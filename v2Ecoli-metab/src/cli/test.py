
from argparse import Namespace
from pathlib import Path

from vivarium.core.engine import Engine

from v2Ecoli.metab.process.kecoli_cell import KecoliCell


# ==============================================================================

def main(model: Path, args: Namespace):
  config = {
    'model_file': model
  }
  kecoli_process = KecoliCell(parameters=config)
  kecoli_ports = kecoli_process.ports_schema()
  kecoli_initial_state = kecoli_process.initial_state()
  kecoli_initial_state['species_store'] = kecoli_initial_state.pop('species')

  sim = Engine(
    processes={'kecoli': kecoli_process},
    topology={'kecoli': {
        'species': ('species_store',)
    }},
    initial_state=kecoli_initial_state,
  )
  sim.update(args.time)
  data = sim.emitter.get_timeseries()
