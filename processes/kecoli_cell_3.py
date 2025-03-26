from typing import Optional

from vivarium.core.process import Process
from vivarium.core.engine import Engine, pp
from basico import *
from vivarium.core.types import State

from utils.basico_helper import _set_initial_concentrations, _get_transient_concentration
import matplotlib.pyplot as plt
from utils.updater import bulk_numpy_updater, get_bulk_counts, divide_bulk
import os

DEFAULT_MODEL_FILE = os.path.join('models','k-ecoli74.xml')

custom_dtype = np.dtype([
    ('id', '<U50'),  # String (Unicode, max 50 characters)
    ('count', '<f8'),  # Float (64-bit)
    ('rRNA_submass', '<f8'),  # Float (64-bit)
    ('tRNA_submass', '<f8'),
    ('mRNA_submass', '<f8'),
    ('miscRNA_submass', '<f8'),
    ('nonspecific_RNA_submass', '<f8'),
    ('protein_submass', '<f8'),
    ('metabolite_submass', '<f8'),
    ('water_submass', '<f8'),
    ('DNA_submass', '<f8')
])


class KecoliCell(Process):

    defaults = {
        'model_file': DEFAULT_MODEL_FILE,
        'time_step': 1.0,
        'env_perturb': "Gluc_e",
        'env_conc': 1.0,
    }

    def __init__(self, parameters=None):
        super().__init__(parameters)

        self.copasi_model_object = load_model(self.parameters['model_file'])
        self.all_species = get_species(model=self.copasi_model_object).index.tolist()
        self.ic_default = get_species(model=self.copasi_model_object)["initial_concentration"].values
        self.ic_default[self.all_species.index(self.parameters['env_perturb'])] = float(self.parameters['env_conc'])

    def initial_state(self, config=None):

        num_species = len(self.all_species)

        # Create an empty array with default values of 0
        species_array = np.zeros(num_species, dtype=custom_dtype)

        # Fill in the 'id' and 'count' fields
        species_array['id'] = self.all_species  # Assign species names
        species_array['count'] = self.ic_default  # Assign initial counts

        return {'species':species_array }

        # return {'species': [(mol_id,conc) for mol_id, conc in zip(self.all_species, self.ic_default) ]}

    def ports_schema(self):

        ports = {

            'species': {
                '_default':[],
                '_updater': bulk_numpy_updater,
                '_emit': True,
                "_divider": divide_bulk

            }
        }

        return ports

    def next_update(self, endtime, states):

        species_levels = list(zip(states['species']['id'],states['species']['count']))

        _set_initial_concentrations(species_levels,self.copasi_model_object)


        timecourse = run_time_course(duration=endtime, intervals=1, update_model=True, model=self.copasi_model_object)


        # results = { (mol_id,_get_transient_concentration(name=mol_id,dm=self.copasi_model_object)) for mol_id in self.all_species}
        results = [(mol_id, _get_transient_concentration(name=mol_id, dm=self.copasi_model_object)) for mol_id in self.all_species]
        del_value = []
        species_levels_values = states['species']['count']

        for idx,(mol_id,value_new) in enumerate(results):
            value = species_levels_values[idx]
            del_value.append((idx,value_new - value))
            # result_sp = (mol_id,del_value)
            # results.append(result_sp)
        # results = dict(results)
        # del_value = np.array(del_value)

        return {'species':del_value}

#%
def test_vkecoli():

    wd = os.getcwd()
    model_path = DEFAULT_MODEL_FILE

    total_time = 300

    config = {
        'model_file': model_path
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

    sim.update(total_time)

    data = sim.emitter.get_timeseries()


#%%
#
# if __name__ == '__main__':
#     test_vkecoli()

#%%


wd = os.getcwd()
model_path = DEFAULT_MODEL_FILE

total_time = 300

config = {
    'model_file': model_path
}

kecoli_process = KecoliCell(parameters=config)
kecoli_ports = kecoli_process.ports_schema()
kecoli_initial_state = kecoli_process.initial_state()
kecoli_initial_state['species_store'] = kecoli_initial_state.pop('species')
#%%


sim = Engine(
    processes={'kecoli': kecoli_process},
    topology={'kecoli': {
        'species': ('species_store',)
    }},
    initial_state=kecoli_initial_state,
)


sim.update(total_time)


#%%





