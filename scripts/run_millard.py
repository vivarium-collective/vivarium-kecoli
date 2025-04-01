from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


plt.rcParams['figure.dpi'] = 150

#%%

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
model_millard = load_model(os.path.join(model_dir,'E_coli_Millard2016.xml'))

species_all = get_species(model=model_millard)
rxn_all = get_reactions(model=model_millard)
ic_default = species_all.initial_concentration
params_default = get_parameters(model=model_millard).value


#%%

result_default = run_time_course(model=model_millard, duration=300)

#%%

# sp_plot = ["GLCx","ACE","G6P","F6P","GAP","PGA3","PYR","R5P","E4P","MAL","OAA","AKG","ACCOA"]

sp_plot = ["GLCx","PYR","AKG","ACCOA"]


fig, axs = plt.subplots(nrows=1, ncols=1, figsize=(8, 5))


result = result_default
for sp in sp_plot:
    sp_traj = result.loc[:,sp].values
    y_vals = sp_traj/max(sp_traj)
    axs.plot(result.index, y_vals, label=sp)
axs.legend(bbox_to_anchor=(0.95, 1))
# plt.savefig(os.path.join(output_plots,'timecourse_default.png'))
plt.show()

#%%
from utils.mapping import RxnMapping

millard_mapping = RxnMapping(model_name,wd)



#%%
sp_plot = ["GLCx","PYR","ACCOA","AKG","SUCCOA","OAA"]
# ic_perturb = ['Gluc_e','gluc_up_ENZ+ATP+Gluc_e','gluc_up_ENZ+G6P','up_glc_ENZ+Gluc_e']

ic_perturb = ['GLCx']
params_perturb = ['FEED']

for sp in ic_perturb:
    set_species(model=model_millard, name=sp, initial_concentration=0)

for param in params_perturb:
    set_parameters(model=model_millard, name=param,initial_value=0)


result_perturbed = run_time_course(model=model_millard, duration=300)


plt.figure(figsize=(9,5))
for sp in sp_plot:
    sp_traj = result_perturbed.loc[:,sp].values
    # plt.plot(result_perturbed.index,sp_traj/max(sp_traj),label=sp)
    plt.plot(result_perturbed.index, sp_traj, label=sp)

plt.legend(bbox_to_anchor=(0.95, 1))
plt.xlabel('Time (s)')
plt.show()
#%%