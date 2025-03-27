
from argparse import Namespace
import os
from pathlib import Path
from typing import Dict, Tuple, NamedTuple

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

from basico import *
from vivarium.core.engine import Engine

from v2Ecoli.metab.process.kecoli_cell import KecoliCell
from v2Ecoli.metab.util.plotting import plot_pathway, plot_aa


# ==============================================================================

def setup_dirs(model_name: str):
  output_dir = Path.cwd() / "output" / model_name
  os.makedirs(output_dir, exist_ok=True)
  # output_results = os.path.join(output_dir,'results')
  # output_plots = os.path.join(output_dir,'plots')
  # output_mapping = os.path.join(output_dir,'mapping')
  output_validation = os.path.join(output_dir,'validation')
  # os.makedirs(output_results, exist_ok=True)
  # os.makedirs(output_plots, exist_ok=True)
  # os.makedirs(output_mapping, exist_ok=True)
  os.makedirs(output_validation, exist_ok=True)
  return output_validation


# ==============================================================================

def perturb_copasi(model, sp_name: str, time: float):
  sp_all = basico.get_species(model=model).index.to_list()
  IC_all = basico.get_species(model=model)["initial_concentration"].values

  sp_idx = sp_all.index(sp_name)
  sp_ic_default = IC_all[sp_idx]
  result_default = basico.run_time_course(model=model, duration=time)
  basico.set_species(model=model, name=sp_name,
                     initial_concentration=sp_ic_default / 10)
  result_low = basico.run_time_course(model=model, duration=time)
  basico.set_species(model=model, name=sp_name,
                     initial_concentration=sp_ic_default*10)
  result_high = basico.run_time_course(model=model, duration=time)
  basico.set_species(model=model, name=sp_name,
                     initial_concentration=sp_ic_default)

  results_all = {}
  results_all['baseline'] = {}
  results_all['baseline']['result'] = result_default
  results_all['baseline']['sp_perturb'] = sp_name
  results_all['baseline']['sp_val'] = sp_ic_default
  results_all['low'] = {}
  results_all['low']['result'] = result_low
  results_all['low']['sp_perturb'] = sp_name
  results_all['low']['sp_val'] = sp_ic_default/10
  results_all['high'] = {}
  results_all['high']['result'] = result_high
  results_all['high']['sp_perturb'] = sp_name
  results_all['high']['sp_val'] = sp_ic_default*10
  return results_all


def perturb_vivarium(proc: KecoliCell, env_sp: str, time: float):
  ic_sp_default = proc.ic_default[proc.all_species.index(env_sp)]
  env_all = {
      'baseline': ic_sp_default,
      'high': ic_sp_default*10,
      'low': ic_sp_default/10
  }
  env_output = {}
  for key,val in env_all.items():
    config_env = {
      'model_file': proc.parameters['model_file'],
      'env_perturb': [env_sp],
      'env_conc': [val],
    }
    env_process = KecoliCell(parameters=config_env)
    env_ports = env_process.ports_schema()
    env_initial_state = env_process.initial_state()
    env_initial_state['species_store'] = env_initial_state.pop('species')
    env_sim = Engine(
      processes={'kecoli': env_process},
      topology={'kecoli': {'species': ('species_store',)}},
      initial_state=env_initial_state)
    env_sim.update(time)
    env_data = env_sim.emitter.get_timeseries()
    env_output[key] = env_data
  return env_output


# ==============================================================================

env_species = ["Gluc_e", "SO4_e", "NH3_e", "O2_e"]

class IC_Variation(NamedTuple):
  gluc: Dict
  so4: Dict
  nh3: Dict
  o2: Dict


def simulate_copasi(
  model_path: Path, time: float
) -> IC_Variation:
  model = load_model(model_path)
  species_kecoli74 = get_species(model=model)
  rxn_kecoli74 = get_reactions(model=model)
  ic_default = species_kecoli74.initial_concentration
  return IC_Variation(*[perturb_copasi(model, sp, time)
                        for sp in env_species])


def simulate_vivarium(
  model_path: Path, time: float
) -> Tuple[KecoliCell, IC_Variation]:
  config_default = {
    'model_file': model_path,
    'env_perturb': ["Gluc_e"],
    'env_conc': [1.0],
  }
  proc = KecoliCell(parameters=config_default)
  ports = proc.ports_schema()
  ic = proc.initial_state()
  ic['species_store'] = ic.pop('species')
  return proc, IC_Variation(*[perturb_vivarium(proc, sp, time)
                              for sp in env_species])


# ==============================================================================

def plot_pathway_validate(
  proc: KecoliCell,
  results_basico, results_vkecoli,
  sp_plot, labels,
  output_validation: Path
):
  plt.rcParams['figure.dpi'] = 90

  fig, axs = plt.subplots(nrows=1, ncols=len(results_basico), figsize=(12, 4))
  conditions = ['baseline','high','low']
  for ax_idx,con in enumerate(conditions):
    result = results_basico[con]['result']
    data_vk = results_vkecoli[con]
    tp_vk = data_vk['time']
    for sp in sp_plot:
      sp_idx = proc.all_species.index(sp)
      sp_traj_vk = [data_vk['species_store'][tp][sp_idx][1] for tp in range(len(data_vk['species_store']))]
      axs[ax_idx].plot(result.index, result.loc[:, sp].values, label=sp)
      axs[ax_idx].plot(tp_vk, sp_traj_vk, ls='None', marker = 'x', markevery = 10)
    axs[ax_idx].set_xlabel('Time (s)')
    axs[ax_idx].set_title(labels[ax_idx])
  axs[ax_idx].legend(loc='best')
  sp_perturb = results_basico[list(results_basico.keys())[ax_idx]]['sp_perturb'].replace('_e','')
  plt.savefig(os.path.join(output_validation, str(sp_perturb)+'_perturb.png'))


# ==============================================================================

def main(model: Path, args: Namespace):
  output_validation = setup_dirs(model.name)
  res_copasi = simulate_copasi(model, args.time)
  proc, res_vivarium = simulate_vivarium(model, args.time)
  plot_pathway_validate(
    proc,
    res_copasi.gluc, res_vivarium.gluc,
    ["Gluc_e"],
    ['Glucose (baseline)','Glucose (high)','Glucose (low)'],
    output_validation)
