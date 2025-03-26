import os

wd = os.getcwd().replace('/scripts','')

from processes.kecoli_cell import KecoliCell
from vivarium.core.engine import Engine

model_path = os.path.join(wd, 'models','k-ecoli74.xml')

config = {
    'model_file': model_path,
    'env_perturb': ["Gluc_e"],
    'env_conc': [1.0],
}

#%%
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

total_time = 300

sim.update(total_time)


#%%