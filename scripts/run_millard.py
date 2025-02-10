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