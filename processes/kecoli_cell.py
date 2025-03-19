from vivarium.core.process import Process
from vivarium.core.engine import Engine, pp
from basico import *

import os

DEFAULT_MODEL_FILE = os.path.join('models','k-ecoli74.xml')

class KecoliCell(Process):

    defaults = {
        'model_file': DEFAULT_MODEL_FILE,
        'time_step': 1.0,
    }

    def __init__(self, parameters=None):
        super().__init__(parameters)

        self.copasi_model_object = load_model(self.parameters['model_file'])
        all_species = get_species(model=self.copasi_model_object.index.tolist())

    def ports_schema(self):
        return{
            'species': {mol_id: {} for mol_id in self.all_species}
        }

    def next_update(self, endtime, states):

        species_levels = states['species']

        for mol_id, value in species_levels.items():
            set_species(name=mol_id, initial_concentration=value, model=self.copasi_model_object)

        timecourse = run_time_course(duration=endtime, intervals=1, update_model=True, model=self.copasi_model_object)

        results = {}

        return results


