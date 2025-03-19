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

    