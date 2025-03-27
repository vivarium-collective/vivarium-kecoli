from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


from processes.kecoli_cell import KecoliCell
from vivarium.core.engine import Engine


plt.rcParams['figure.dpi'] = 90

model_name = 'E_coli_Millard2016'
wd = os.getcwd().replace('scripts', '')
output_dir = os.path.join(wd,'output',model_name)

os.makedirs(output_dir, exist_ok=True)

output_results = os.path.join(output_dir,'results')
output_plots = os.path.join(output_dir,'plots')
output_mapping = os.path.join(output_dir,'mapping')

os.makedirs(output_results, exist_ok=True)
os.makedirs(output_plots, exist_ok=True)
os.makedirs(output_mapping, exist_ok=True)



model_dir = os.path.join('models')
model_path = os.path.join(model_dir,model_name+'.xml')
model_millard = load_model(model_path)

species_all = get_species(model=model_millard)
rxn_all = get_reactions(model=model_millard)
ic_default = species_all.initial_concentration

result_default = run_time_course(model=model_millard, duration=300)

sp_plot = ["GLCx","ACEx","G6P","F6P","GAP","PYR","R5P","MAL","AKG","ACCOA"]


fig, axs = plt.subplots(nrows=1, ncols=1, figsize=(8, 5))


result = result_default
for sp in sp_plot:
    sp_traj = result.loc[:,sp].values
    y_vals = sp_traj/max(sp_traj)
    axs.plot(result.index, y_vals, label=sp)
axs.legend(bbox_to_anchor=(0.95, 1))

plt.show()
# plt.savefig(os.path.join(output_plots,'timecourse_default.png'))

#%%


config_default = {
    'model_file': model_path,
    'env_perturb': ["GLCx"],
    'env_conc': [ic_default["GLCx"]],
}


#%% millard-vkecoli test

kecoli_process = KecoliCell(parameters=config_default)
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

total_time = 300

sim.update(total_time)
#%%
data_vk = sim.emitter.get_timeseries()

tp_vk = data_vk['time']

plt.figure()

for sp in sp_plot:
    sp_idx = kecoli_process.all_species.index(sp)
    sp_traj_vk = [data_vk['species_store'][tp][sp_idx][1] for tp in range(len(data_vk['species_store']))]

    plt.plot(tp_vk, np.array(sp_traj_vk)/max(sp_traj_vk), label=sp)

plt.legend(bbox_to_anchor=(0.95, 1))
plt.xlabel('Time (s)')
plt.show()


#%%