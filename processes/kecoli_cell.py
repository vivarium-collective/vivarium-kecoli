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
        self.all_species = get_species(model=self.copasi_model_object).index.tolist()

    def ports_schema(self):

        ports = {
            'species': {mol_id: {
                '_default': 0.0,
                '_updater': 'accumulate',
                '_emit': True,
            } for mol_id in self.all_species}
        }

        return ports

    def next_update(self, endtime, states):

        species_levels = states['species']

        for mol_id, value in species_levels.items():
            set_species(name=mol_id, initial_concentration=value, model=self.copasi_model_object)

        timecourse = run_time_course(duration=endtime, intervals=1, update_model=True, model=self.copasi_model_object)

        state_final = timecourse.iloc[-1,:]

        species = {}

        for mol_id in state_final.index:
            species[mol_id] = state_final[mol_id]

        return species

#%%
def test_vkecoli():

    wd = os.getcwd()
    model_path = DEFAULT_MODEL_FILE

    total_time = 300

    config = {
        'model_file': model_path
    }

    kecoli_process = KecoliCell(parameters=config)
    kecoli_ports = kecoli_process.ports_schema()

    sim = Engine(
        processes={'kecoli': kecoli_process},
        topology={'kecoli': {
            'species': ('species_store',)
        }}
    )

    sim.update(total_time)

    data = sim.emitter.get_timeseries()


#%%

if __name__ == '__main__':
    test_vkecoli()

#%%








