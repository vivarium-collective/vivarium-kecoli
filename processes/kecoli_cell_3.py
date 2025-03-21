from vivarium.core.process import Process
from vivarium.core.engine import Engine, pp
from basico import *
from utils.basico_helper import _set_initial_concentrations, _get_transient_concentration
import matplotlib.pyplot as plt
from utils.updater import bulk_numpy_updater
import os

DEFAULT_MODEL_FILE = os.path.join('models','k-ecoli74.xml')

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



    def ports_schema(self):

        ports = {

            'species': {
                '_default':[ (self.all_species[mol_id_idx],self.ic_default[mol_id_idx])for mol_id_idx in range(len(self.all_species))],
                '_updater': bulk_numpy_updater,
                '_emit': True

            }
        }

        return ports

    def next_update(self, endtime, states):

        species_levels = states['species']

        _set_initial_concentrations(species_levels,self.copasi_model_object)


        timecourse = run_time_course(duration=endtime, intervals=1, update_model=True, model=self.copasi_model_object)


        results = { (mol_id,_get_transient_concentration(name=mol_id,dm=self.copasi_model_object)) for mol_id in self.all_species}

        del_value = []

        for idx,(mol_id,value_new) in enumerate(results):
            value = dict(species_levels).values[idx]
            del_value.append(value_new - value)
            # result_sp = (mol_id,del_value)
            # results.append(result_sp)
        # results = dict(results)
        del_value = np.array(del_value)

        return {'species':del_value}

#%
def test_vkecoli():

    wd = os.getcwd()
    model_path = DEFAULT_MODEL_FILE

    total_time = 10

    config = {
        'model_file': model_path
    }

    kecoli_process = KecoliCell(parameters=config)
    kecoli_ports = kecoli_process.ports_schema()

    sim = Engine(
        processes={'kecoli': kecoli_process},
        topology={'kecoli': {
            'species': ('species_store',)
        }} #TODO: pass initial state
    )

    sim.update(total_time)

    data = sim.emitter.get_timeseries()


#%%

if __name__ == '__main__':
    test_vkecoli()

#%%


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
#%%
data = sim.emitter.get_timeseries()

data_rearranged = {}
for timepoint in data['species_store']:
    for mol_id,value in timepoint:
        if mol_id not in data_rearranged:
            data_rearranged[mol_id] = []
        data_rearranged[mol_id].append(value)


#%%
sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "Ac_e", "CO2_e"]

plt.rcParams['figure.dpi'] = 90

plt.figure()

for sp in sp_plot:

    plt.plot(data['time'],data_rearranged[sp],label=sp)

plt.legend()
plt.show()


#%%





