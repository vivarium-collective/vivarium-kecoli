
from argparse import Namespace
import os
from pathlib import Path
from collections import OrderedDict
from dataclasses import dataclass, field
from typing import Dict, List, Tuple, Iterable

import numpy as np
import pandas as pd
import matplotlib.pyplot as plt

import basico as bc
from vivarium.core.engine import Engine

from v2Ecoli.metab.process.kecoli_cell import KecoliCell
from v2Ecoli.metab.util.plotting import plot_pathway, plot_aa


# ==============================================================================

def setup_dirs(model_name: str) -> Path:
  output_dir = Path.cwd() / "output" / model_name
  # output_results = output_dir / 'results'
  # output_plots = output_dir / 'plots'
  # output_mapping = output_dir / 'mapping'
  output_validation = output_dir / 'validation'
  # os.makedirs(output_results, exist_ok=True)
  # os.makedirs(output_plots, exist_ok=True)
  # os.makedirs(output_mapping, exist_ok=True)
  os.makedirs(output_validation, exist_ok=True)
  return output_validation


# ==============================================================================

@dataclass
class Perturbation:
  ic_factors: Dict[str, float] = field(default_factory=dict)
  param_factors: Dict[str, float] = field(default_factory=dict)

  def __post_init__(self):
    for (sp, f) in self.ic_factors.items():
      assert isinstance(sp, str)
      assert isinstance(f, float)
    for (par, f) in self.param_factors.items():
      assert isinstance(par, str)
      assert isinstance(f, float)


# ==============================================================================

def perturb_copasi_single(
  model: bc.COPASI.CDataModel,
  perturbation: Perturbation, time: float
) -> pd.DataFrame:
  # obtain default model config
  ic_def = bc.get_species(model=model).initial_concentration
  par_def = bc.get_parameters(model=model).value
  # perturb model config
  assert isinstance(perturbation, Perturbation)
  for (sp, f) in perturbation.ic_factors.items():
    bc.set_species(model=model, name=sp, initial_concentration=f * ic_def[sp])
  for (par, f) in perturbation.param_factors.items():
    bc.set_parameters(model=model, name=par, initial_value=f * par_def[par])
  # simulate
  res = bc.run_time_course(model=model, duration=time)
  assert isinstance(res, pd.DataFrame)
  # reset model config
  for sp in perturbation.ic_factors.keys():
    bc.set_species(model=model, name=sp, initial_concentration=ic_def[sp])
  for par in perturbation.param_factors.keys():
    bc.set_parameters(model=model, name=par, initial_value=par_def[par])
  return res


def perturb_vivarium_single(
  model_path: Path, model: bc.COPASI.CDataModel,
  perturbation: Perturbation, time: float
) -> Tuple[KecoliCell, Dict]:
  # obtain default model config
  ic_def = bc.get_species(model=model).initial_concentration
  par_def = bc.get_parameters(model=model).value
  # perturb model config
  assert isinstance(perturbation, Perturbation)
  conf = {
    'model_file': model_path,
    'env_perturb': {sp: f * ic_def[sp]
                    for (sp, f) in perturbation.ic_factors.items()},
    'params_perturb': {par: f * par_def[par]
                       for (par, f) in perturbation.param_factors.items()}}
  # simulate
  proc = KecoliCell(parameters=conf)
  ports = proc.ports_schema()
  ic = proc.initial_state()
  ic['species_store'] = ic.pop('species')
  sim = Engine(
    processes={'kecoli': proc},
    topology={'kecoli': {'species': ('species_store',)}},
    initial_state=ic)
  sim.update(time)
  return (proc, sim.emitter.get_timeseries())


def perturb_copasi(
  model_path: Path, perturbations: Iterable[Perturbation], time: float
) -> List[pd.DataFrame]:
  model = bc.load_model(model_path)
  return [perturb_copasi_single(model, p, time)
          for p in perturbations]


def perturb_vivarium(
  model_path: Path, perturbations: Iterable[Perturbation], time: float
) -> List[Tuple[KecoliCell, Dict]]:
  model = bc.load_model(model_path)
  return [perturb_vivarium_single(model_path, model, p, time)
          for p in perturbations]


# ==============================================================================

def plot_pathway_validate(
  perturbation_labels: List[str], sp_plot: List[str],
  results_copasi: List[pd.DataFrame],
  results_vivarium: List[Tuple[KecoliCell, Dict]],
  output_validation: Path
):
  ncols = len(perturbation_labels)
  assert ncols > 1
  plt.rcParams['figure.dpi'] = 90
  fig, axs = plt.subplots(nrows=1, ncols=ncols, figsize=(12, 4))
  perturbations = zip(perturbation_labels, results_copasi, results_vivarium)
  for (ax_idx, (lbl, r_copasi, (proc, r_vivarium))) in enumerate(perturbations):
    t_vivarium = r_vivarium['time']
    for sp in sp_plot:
      sp_idx = proc.all_species.index(sp)
      sp_vivarium = [r_vivarium['species_store'][t][sp_idx][1]
                     for t in range(len(r_vivarium['species_store']))]
      axs[ax_idx].plot(r_copasi.index, r_copasi.loc[:, sp].values, label=sp)
      axs[ax_idx].plot(t_vivarium, sp_vivarium,
                       ls='None', marker='x', markevery=10)
    axs[ax_idx].set_xlabel('Time (s)')
    axs[ax_idx].set_title(lbl)
  axs[ax_idx].legend(loc='best')
  plt.savefig(output_validation / "perturb.png")


# ==============================================================================

def main(model_path: Path, args: Namespace):
  perturbations = OrderedDict([
    ("Default",
     Perturbation()),
    ("No glucose",
     Perturbation({"GLCx": .0}, {"FEED": .0})),
    ("No phosphate",
     Perturbation({"Px": .0})),
    ("No glucose & no phosphate",
     Perturbation({"GLCx": .0, "Px": .0}, {"FEED": .0}))
  ])
  res_copasi = perturb_copasi(model_path, perturbations.values(), args.time)
  res_vivarium = perturb_vivarium(model_path, perturbations.values(), args.time)
  plot_pathway_validate(
    perturbations.keys(),
    ["GLX", "FUM", "PYR", "ACCOA", "AKG", "SUCCOA", "OAA"],
    res_copasi, res_vivarium,
    setup_dirs(model_path.name))
