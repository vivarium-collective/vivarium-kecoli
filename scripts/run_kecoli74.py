from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


plt.rcParams['figure.dpi'] = 150


#%%
model_name = "k-ecoli74"

wd = os.getcwd().replace('scripts', '')

model_dir = os.path.join(wd,'models')

model_kecoli74 = load_model(os.path.join(model_dir,model_name+'.xml'))

species_kecoli74 = get_species(model=model_kecoli74)

rxn_kecoli74 = get_reactions(model=model_kecoli74)
ic_default = species_kecoli74.initial_concentration
params_default = get_parameters(model=model_kecoli74).value

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
sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "AKG", "AcCoA", "SucCoA","OAC", "Ac_e", "CO2_e"]

#%%
plot_pathway(results_gluc,sp_plot,['Glucose (baseline)','Glucose (low)','Glucose (high)'],output_plots)
plot_aa(results_gluc,['Glucose (baseline)','Glucose (low)','Glucose (high)'],output_plots)


plot_pathway(results_so4,sp_plot,['SO4 (baseline)','SO4 (low)','SO4 (high)'],output_plots)
plot_aa(results_so4,['SO4 (baseline)','SO4 (low)','SO4 (high)'],output_plots)
plot_pathway(results_nh3, sp_plot,['NH3 (baseline)','NH3 (low)','NH3 (high)'],output_plots)
plot_aa(results_nh3,['NH3 (baseline)','NH3 (low)','NH3 (high)'],output_plots)
plot_pathway(results_o2, sp_plot,['O2 (baseline)','O2 (low)','O2 (high)'], output_plots)
plot_aa(results_o2,['O2 (baseline)','O2 (low)','O2 (high)'],output_plots)


#%%

from utils.mapping import rxn_mapping_sbml
from utils.mapping import RxnMapping

#%%

sp_unique = list(filter(lambda x: '+' not in x, list(species_kecoli74.index)))

complex_mapping = pd.DataFrame(data=np.zeros((len(species_kecoli74.index),len(sp_unique))),index=species_kecoli74.index,columns=sp_unique)

#%%

complex_R56ENZ = list(complex_mapping.index[np.where(complex_mapping.loc[:,'R56_ENZ'])[0]])


#%%

for sp in species_kecoli74.index:
    sp_monomers = sp.split('+')
    sp_monomers_unique = np.unique(sp_monomers)
    for sp_monomer in sp_monomers_unique:
        units = sp_monomers.count(sp_monomer)
        complex_mapping.loc[sp,sp_monomer] = units

#%%






#%%

# rxn_mapping = rxn_mapping_sbml('k-ecoli74',wd)

kecoli74_mapping = RxnMapping('k-ecoli74',wd)

#%%

ic_perturb = ['Gluc_e','gluc_up_ENZ+ATP+Gluc_e','gluc_up_ENZ+G6P','up_glc_ENZ+Gluc_e']
params_perturb = ["K_kf_gluc_up_1", "K_kr_gluc_up_1", "K_kf_up_glc_1", "K_kr_up_glc_1"]

sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "AKG", "AcCoA", "SucCoA","OAC", "Ac_e", "CO2_e"]
# sp_plot = ["Gluc_e"]

for sp in ic_perturb:
    set_species(model=model_kecoli74, name=sp, initial_concentration=0.0)

for param in params_perturb:
    set_parameters(model=model_kecoli74, name=param,initial_value=0.0)


result_default = run_time_course(model=model_kecoli74, duration=300)

plt.figure()
for sp in sp_plot:
    plt.plot(result_default.index,result_default.loc[:,sp],label=sp)

plt.legend()
plt.xlabel('Time (s)')
plt.show()




#%%

#K_kf_gluc_up_1
#K_kr_gluc_up_1
#K_kf_up_glc_1
#K_kr_up_glc_1


#%%
compare_tp = 100

sp_results = list(results_gluc['baseline']['result'].columns)

sp_compare = [results_gluc['baseline']['result'].iloc[compare_tp,:],results_gluc['high']['result'].iloc[compare_tp,:]]

sp_compare_ratio = pd.Series(data=sp_compare[1].values/sp_compare[0].values,index=sp_results)

#%%


R56_abs = pd.DataFrame()
R56_abs['baseline'] = sp_compare[0][complex_R56ENZ]
R56_abs['high'] = sp_compare[1][complex_R56ENZ]

#%%
sp_sum_baseline = []
sp_sum_high = []

for sp in sp_unique:

    sp_complex_mapping = complex_mapping.loc[:,sp]
    sp_lvls_baseline = sp_compare[0]*sp_complex_mapping
    sp_sum_baseline.append(sum(sp_lvls_baseline.values))
    sp_lvls_high = sp_compare[1]*sp_complex_mapping
    sp_sum_high.append(sum(sp_lvls_high.values))

#%%

sp_sum_ratio = pd.Series(data = np.array(sp_sum_high)/np.array(sp_sum_baseline), index=sp_unique)

#%%
















#%%