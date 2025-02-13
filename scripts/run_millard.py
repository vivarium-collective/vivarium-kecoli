from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


plt.rcParams['figure.dpi'] = 300

#%%

model_dir = os.path.join('models')
model_millard = load_model(os.path.join(model_dir,'E_coli_Millard2016.xml'))

species_all = get_species(model=model_millard)
rxn_all = get_reactions(model=model_millard)
ic_default = species_all.initial_concentration

#%%

result_default = run_time_course(model=model_millard, duration=300)

#%%

# sp_plot = ["GLCx","ACE","G6P","F6P","GAP","PGA3","PYR","R5P","E4P","MAL","OAA","AKG","ACCOA"]

sp_plot = ["GLCx","ACEx","G6P","F6P","GAP","PYR","R5P","MAL","AKG","ACCOA"]


fig, axs = plt.subplots(nrows=1, ncols=1, figsize=(8, 5))


result = result_default
for sp in sp_plot:
    sp_traj = result.loc[:,sp].values
    y_vals = sp_traj/max(sp_traj)
    axs.plot(result.index, y_vals, label=sp)
axs.legend(bbox_to_anchor=(0.95, 1))
plt.show()

#%%