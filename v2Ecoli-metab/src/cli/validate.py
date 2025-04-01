
from argparse import Namespace
import os
from pathlib import Path
from typing import Dict, List, Tuple, NamedTuple

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

def perturb_copasi(
  model, sp_name: str, factors: List[float], time: float
):
  sp_all = basico.get_species(model=model).index.to_list()
  IC_all = basico.get_species(model=model)["initial_concentration"].values
  sp_idx = sp_all.index(sp_name)
  sp_ic_default = IC_all[sp_idx]
  res = {}
  for f in factors:
    ic_f = f * sp_ic_default
    basico.set_species(model=model, name=sp_name, initial_concentration=ic_f)
    res[f] = {
      'sp_perturb': sp_name,
      'sp_val': ic_f,
      'result': basico.run_time_course(model=model, duration=time)}
  return res


def perturb_vivarium(
  model: KecoliCell, env_sp: str, factors: List[float], time: float
):
  ic_sp_default = model.ic_default[model.all_species.index(env_sp)]
  res = {}
  for f in factors:
    config_env = {
      'model_file': model.parameters['model_file'],
      'env_perturb': [env_sp],
      'env_conc': [f * ic_sp_default],
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
    res[f] = env_sim.emitter.get_timeseries()
  return res


# ==============================================================================

class IC_Variation(NamedTuple):
  Gluc_e: Dict
  SO4_e: Dict
  NH3_e: Dict
  O2_e: Dict


def simulate_copasi(
  model_path: Path, factors: List[float], time: float
) -> IC_Variation:
  model = load_model(model_path)
  return IC_Variation(*[perturb_copasi(model, sp, factors, time)
                        for sp in IC_Variation._fields])


def simulate_vivarium(
  model_path: Path, factors: List[float], time: float
) -> Tuple[KecoliCell, IC_Variation]:
  config_default = {
    'model_file': model_path,
    'env_perturb': ["Gluc_e"],
    'env_conc': [1.0],
  }
  model = KecoliCell(parameters=config_default)
  return model, IC_Variation(*[perturb_vivarium(model, sp, factors, time)
                               for sp in IC_Variation._fields])


# ==============================================================================

def plot_pathway_validate(
  model: KecoliCell, factors: List[float], sp_plot, labels,
  results_copasi, results_vivarium,
  output_validation: Path
):
  plt.rcParams['figure.dpi'] = 90
  fig, axs = plt.subplots(nrows=1, ncols=len(factors), figsize=(12, 4))
  for (ax_idx, f) in enumerate(factors):
    r_copasi = results_copasi[f]['result']
    r_vivarium = results_vivarium[f]
    t_vivarium = r_vivarium['time']
    for (sp, lbl) in zip(sp_plot, labels):
      sp_idx = model.all_species.index(sp)
      sp_vivarium = [r_vivarium['species_store'][t][sp_idx][1]
                     for t in range(len(r_vivarium['species_store']))]
      axs[ax_idx].plot(r_copasi.index, r_copasi.loc[:, sp].values, label=sp)
      axs[ax_idx].plot(t_vivarium, sp_vivarium,
                       ls='None', marker='x', markevery=10)
    axs[ax_idx].set_xlabel('Time (s)')
    axs[ax_idx].set_title(f"{lbl} ({f}x)")
  axs[ax_idx].legend(loc='best')
  sp_perturb = results_copasi[
    list(results_copasi.keys())[ax_idx]]['sp_perturb'].replace('_e','')
  plt.savefig(os.path.join(output_validation, str(sp_perturb)+'_perturb.png'))


# ==============================================================================

def main(model: Path, args: Namespace):
  output_validation = setup_dirs(model.name)
  factors = [1.0, args.factor, 1/args.factor]
  res_copasi = simulate_copasi(model, factors, args.time)
  model, res_vivarium = simulate_vivarium(model, factors, args.time)
  plot_pathway_validate(
    model, factors, ["Gluc_e"], ['Glucose'],
    res_copasi.Gluc_e, res_vivarium.Gluc_e,
    output_validation)
