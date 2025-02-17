from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


plt.rcParams['figure.dpi'] = 90


#%%
model_name = "k-ecoli74"

wd = os.getcwd().replace('scripts', '')

model_dir = os.path.join(wd,'models')

model_kecoli74 = load_model(os.path.join(model_dir,model_name+'xml'))
species_kecoli74 = get_species(model=model_kecoli74)
rxn_kecoli74 = get_reactions(model=model_kecoli74)
ic_default = species_kecoli74.initial_concentration

output_dir = os.path.join(wd,'output',model_name)

os.makedirs(output_dir, exist_ok=True)

output_results = os.path.join(output_dir,'results')
output_plots = os.path.join(output_dir,'plots')
output_mapping = os.path.join(output_dir,'mapping')

os.makedirs(output_results, exist_ok=True)
os.makedirs(output_plots, exist_ok=True)
os.makedirs(output_mapping, exist_ok=True)

#%%

sp_count = 0

label = ['Glucose (default)','Glucose (low)', 'Glucose (high)']
colors = ['blue','red','green']

fig, axs_aa = plt.subplots(nrows=4,ncols=5,figsize=(20,15))

for ax_row in range(4):
    for ax_col in range(5):
        sp = sp_aa[sp_count]
        for idx,res in enumerate(results_all):
            sp_traj = res.loc[:,sp].values
            axs_aa[ax_row,ax_col].plot(res.index,sp_traj,label=label[idx],color=colors[idx])
        axs_aa[ax_row,ax_col].set_xlabel('Time (s)')
        axs_aa[ax_row,ax_col].set_ylabel(sp)
        sp_count += 1
axs_aa[ax_row,ax_col].legend(loc='best')
plt.subplots_adjust(wspace=0.35)
plt.show()

#%%

def plot_pathway(results,labels):
    sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "Ac_e", "CO2_e"]

    fig, axs = plt.subplots(nrows=1, ncols=3, figsize=(12, 4))


    for ax_idx in range(3):
        result = results[ax_idx]
        for sp in sp_plot:
            axs[ax_idx].plot(result.index, result.loc[:, sp].values, label=sp)

        axs[ax_idx].set_xlabel('Time (s)')
        axs[ax_idx].set_title(labels[ax_idx])
    axs[ax_idx].legend(loc='best')
    plt.show()



def plot_aa(results,labels):
    sp_count = 0

    sp_aa = ["Ala", "Arg", "Asn", "Asp", "Cys",
             "Glu", "Gln", "Gly", "His", "Ile",
             "Leu", "Lys", "Met", "Phe", "Pro",
             "Ser", "Thr", "Trp", "Tyr", "Val"]

    # label = ['Glucose (default)', 'Glucose (low)', 'Glucose (high)']
    colors = ['blue', 'red', 'green']

    fig, axs_aa = plt.subplots(nrows=4, ncols=5, figsize=(20, 15))

    for ax_row in range(4):
        for ax_col in range(5):
            sp = sp_aa[sp_count]
            for idx, res in enumerate(results):
                sp_traj = res.loc[:, sp].values
                axs_aa[ax_row, ax_col].plot(res.index, sp_traj, label=labels[idx], color=colors[idx])
            axs_aa[ax_row, ax_col].set_xlabel('Time (s)')
            axs_aa[ax_row, ax_col].set_ylabel(sp)
            sp_count += 1
    axs_aa[ax_row, ax_col].legend(loc='best')
    plt.subplots_adjust(wspace=0.35)
    plt.show()

#%%
from utils.run_model import perturb_env


#%%

def perturb_env(sp_name):

    sp_all = list(get_species(model=model_kecoli74).index.values)
    IC_all = get_species(model=model_kecoli74)["initial_concentration"].values

    sp_idx = sp_all.index(sp_name)

    sp_ic_default = IC_all[sp_idx]

    result_default = run_time_course(model=model_kecoli74,duration=300)

    set_species(model=model_kecoli74, name=sp_name, initial_concentration=sp_ic_default / 10)

    result_low = run_time_course(model=model_kecoli74, duration=300)

    set_species(model=model_kecoli74, name=sp_name, initial_concentration=sp_ic_default*10)

    result_high = run_time_course(model=model_kecoli74, duration=300)

    set_species(model=model_kecoli74, name=sp_name, initial_concentration=sp_ic_default)

    results_all = [result_default, result_low, result_high]

    return results_all

#%%

results_gluc = perturb_env(model_kecoli74,'Gluc_e')
results_so4 = perturb_env(model_kecoli74,'SO4_e')
results_nh3 = perturb_env(model_kecoli74,'NH3_e')
results_o2 = perturb_env(model_kecoli74,'O2_e')

#%%

plot_pathway(results_gluc,['Glucose (baseline)','Glucose (low)','Glucose (high)'])
plot_aa(results_gluc,['Glucose (baseline)','Glucose (low)','Glucose (high)'])

#%%
plot_pathway(results_so4,['SO4 (baseline)','SO4 (low)','SO4 (high)'])
plot_aa(results_so4,['SO4 (baseline)','SO4 (low)','SO4 (high)'])
plot_pathway(results_nh3,['NH3 (baseline)','NH3 (low)','NH3 (high)'])
plot_aa(results_nh3,['NH3 (baseline)','NH3 (low)','NH3 (high)'])
plot_pathway(results_o2,['O2 (baseline)','O2 (low)','O2 (high)'])
plot_aa(results_o2,['O2 (baseline)','O2 (low)','O2 (high)'])


#%%

