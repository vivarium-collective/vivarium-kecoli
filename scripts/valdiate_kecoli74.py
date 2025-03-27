from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from processes.kecoli_cell import KecoliCell
from vivarium.core.engine import Engine

plt.rcParams['figure.dpi'] = 90
wd = os.getcwd().replace('/scripts','')

#%%
model_name = "k-ecoli74"

model_dir = os.path.join(wd,'models')

model_path = os.path.join(model_dir,model_name+'.xml')

model_kecoli74 = load_model(model_path)

species_kecoli74 = get_species(model=model_kecoli74)

rxn_kecoli74 = get_reactions(model=model_kecoli74)
ic_default = species_kecoli74.initial_concentration

output_dir = os.path.join(wd,'output',model_name)

os.makedirs(output_dir, exist_ok=True)

output_results = os.path.join(output_dir,'results')
output_plots = os.path.join(output_dir,'plots')
output_mapping = os.path.join(output_dir,'mapping')
output_validation = os.path.join(output_dir,'validation')

os.makedirs(output_results, exist_ok=True)
os.makedirs(output_plots, exist_ok=True)
os.makedirs(output_mapping, exist_ok=True)
os.makedirs(output_validation, exist_ok=True)


#%%
from utils.run_model import perturb_env
from utils.plotting import plot_pathway, plot_aa



#%%

results_gluc = perturb_env(model_kecoli74,'Gluc_e')
results_so4 = perturb_env(model_kecoli74,'SO4_e')
results_nh3 = perturb_env(model_kecoli74,'NH3_e')
results_o2 = perturb_env(model_kecoli74,'O2_e')

#%% run the same simulations using vkecoli

config_default = {
    'model_file': model_path,
    'env_perturb': ["Gluc_e"],
    'env_conc': [1.0],
}

kecoli_process = KecoliCell(parameters=config_default)
kecoli_ports = kecoli_process.ports_schema()
kecoli_initial_state = kecoli_process.initial_state()
kecoli_initial_state['species_store'] = kecoli_initial_state.pop('species')

#%%

def perturb_vkecoli(env_sp,process_default=kecoli_process):

    ic_sp_default = process_default.ic_default[process_default.all_species.index(env_sp)]

    env_all = {'baseline':ic_sp_default,'high':ic_sp_default*10,'low':ic_sp_default/10}

    env_output = {}

    for key,val in env_all.items():
        config_env = {
            'model_file': model_path,
            'env_perturb': [env_sp],
            'env_conc': [val],
        }
        env_process = KecoliCell(parameters=config_env)
        env_ports = env_process.ports_schema()
        env_initial_state = env_process.initial_state()
        env_initial_state['species_store'] = env_initial_state.pop('species')

        env_sim = Engine(
            processes={'kecoli': env_process},
            topology={'kecoli': {'species': ('species_store',)}},initial_state=env_initial_state)

        env_sim.update(300)
        env_data = env_sim.emitter.get_timeseries()

        env_output[key] = env_data

    return env_output

#%%
results_gluc_vkecoli = perturb_vkecoli('Gluc_e')
results_so4_vkecoli = perturb_vkecoli('SO4_e')
results_nh3_vkecoli = perturb_vkecoli('NH3_e')
results_o2_vkecoli = perturb_vkecoli('O2_e')

#%%


def plot_pathway_validate(results_basico,results_vkecoli,sp_plot,labels,me=20,output_validation=output_validation):


    fig, axs = plt.subplots(nrows=1, ncols=len(results_basico), figsize=(12, 4))

    conditions = ['baseline','high','low']

    for ax_idx,con in enumerate(conditions):
        result = results_basico[con]['result']
        data_vk = results_vkecoli[con]
        tp_vk = data_vk['time']
        for sp in sp_plot:
            sp_idx = kecoli_process.all_species.index(sp)
            sp_traj_vk = [data_vk['species_store'][tp][sp_idx][1] for tp in range(len(data_vk['species_store']))]

            axs[ax_idx].plot(result.index, result.loc[:, sp].values, label=sp)
            axs[ax_idx].plot(tp_vk, sp_traj_vk, ls='None', marker = 'x', markevery = me)

        axs[ax_idx].set_xlabel('Time (s)')
        axs[ax_idx].set_title(labels[ax_idx])
    axs[ax_idx].legend(loc='best')

    sp_perturb = results_basico[list(results_basico.keys())[ax_idx]]['sp_perturb'].replace('_e','')

    plt.savefig(os.path.join(output_validation,str(sp_perturb)+'_perturb.png'))

#%%
sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "Ac_e", "CO2_e"]

plot_pathway_validate(results_gluc,results_gluc_vkecoli,sp_plot,['Glucose (baseline)','Glucose (high)','Glucose (low)'])



#%%