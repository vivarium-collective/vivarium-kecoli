import os





wd = os.getcwd().replace('/scripts','')

from processes.kecoli_cell import KecoliCell



#%%


total_time = 300

config = {
    'model_file': model_path
}

kecoli_process = KecoliCell(parameters=config)
kecoli_ports = kecoli_process.ports_schema()
kecoli_initial_state = kecoli_process.initial_state()
kecoli_initial_state['species_store'] = kecoli_initial_state.pop('species')

total_time = 300
#%%