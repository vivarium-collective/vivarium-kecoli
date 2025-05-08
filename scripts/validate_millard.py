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
params_default = get_parameters(model=model_millard).value
result_default = run_time_course(model=model_millard, duration=300)

#%%
# sp_plot = ["GLCx","ACEx","G6P","F6P","GAP","PYR","R5P","MAL","AKG","ACCOA"]
#
#
# fig, axs = plt.subplots(nrows=1, ncols=1, figsize=(8, 5))
#
#
# result = result_default
# for sp in sp_plot:
#     sp_traj = result.loc[:,sp].values
#     y_vals = sp_traj/max(sp_traj)
#     axs.plot(result.index, y_vals, label=sp)
# axs.legend(bbox_to_anchor=(0.95, 1))
#
# plt.show()
# plt.savefig(os.path.join(output_plots,'timecourse_default.png'))

#%% shutoff glucose

set_species(model=model_millard, name='GLCx', initial_concentration=0)
set_parameters(model=model_millard, name='FEED',initial_value=0)

result_noglc = run_time_course(model=model_millard, duration=300)

set_species(model=model_millard, name='GLCx', initial_concentration=ic_default['GLCx'])
set_parameters(model=model_millard, name='FEED',initial_value=params_default['FEED'])


#%% shutoff phosphate

set_species(model=model_millard, name='Px', initial_concentration=0)

result_nopx = run_time_course(model=model_millard, duration=300)

set_species(model=model_millard, name='Px',initial_value=ic_default['Px'])

#%%
# sp_plot = ["GLCx","ACEx","G6P","F6P","GAP","PYR","R5P","MAL","AKG","ACCOA"]
sp_plot = ["GLCx","PYR","ACCOA","AKG","SUCCOA","OAA"]
results = [result_default, result_noglc, result_nopx]
titles = ["Default","No glucose","No phosphate"]
fig, axs = plt.subplots(nrows=1, ncols=3, figsize=(10, 4),layout='tight')


result = result_default

for i,result in enumerate(results):
    for sp in sp_plot:
        sp_traj = result.loc[:,sp].values
        # y_vals = sp_traj/max(sp_traj)
        y_vals = sp_traj
        axs[i].plot(result.index, y_vals, label=sp)
        axs[i].set_xlabel('Time (s)')
        axs[i].set_title(titles[i])

axs[i].legend(bbox_to_anchor=(1.0, 1))

plt.show()



#%%


config_default = {
    'model_file': model_path,
    'env_perturb': {"GLCx":ic_default["GLCx"]},
}

config_noglc = {
    'model_file': model_path,
    'env_perturb': {"GLCx":0},
    'params_perturb': {"FEED":0},
}

config_nopx = {
    'model_file': model_path,
    'env_perturb': {"GLCx":ic_default["GLCx"],
                    "Px": 0
                    },
    'params_perturb': {"FEED":params_default["FEED"],},
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

def perturb_vkecoli_millard(config):

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

    results = sim.emitter.get_timeseries()

    return results

#%%
results_vk_default = perturb_vkecoli_millard(config_default)
results_vk_noglc = perturb_vkecoli_millard(config_noglc)
results_vk_nopx = perturb_vkecoli_millard(config_nopx)

results_vk = [results_vk_default, results_vk_noglc, results_vk_nopx]

#%%
