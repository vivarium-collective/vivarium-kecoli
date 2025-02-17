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

model_kecoli74 = load_model(os.path.join(model_dir,model_name+'.xml'))

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
from utils.run_model import perturb_env
from utils.plotting import plot_pathway, plot_aa



#%%

results_gluc = perturb_env(model_kecoli74,'Gluc_e')
results_so4 = perturb_env(model_kecoli74,'SO4_e')
results_nh3 = perturb_env(model_kecoli74,'NH3_e')
results_o2 = perturb_env(model_kecoli74,'O2_e')

#%%
sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "Ac_e", "CO2_e"]

plot_pathway(results_gluc,sp_plot,['Glucose (baseline)','Glucose (low)','Glucose (high)'],output_plots)
plot_aa(results_gluc,['Glucose (baseline)','Glucose (low)','Glucose (high)'],output_plots)

#%%
plot_pathway(results_so4,['SO4 (baseline)','SO4 (low)','SO4 (high)'])
plot_aa(results_so4,['SO4 (baseline)','SO4 (low)','SO4 (high)'])
plot_pathway(results_nh3,['NH3 (baseline)','NH3 (low)','NH3 (high)'])
plot_aa(results_nh3,['NH3 (baseline)','NH3 (low)','NH3 (high)'])
plot_pathway(results_o2,['O2 (baseline)','O2 (low)','O2 (high)'])
plot_aa(results_o2,['O2 (baseline)','O2 (low)','O2 (high)'])


#%%

