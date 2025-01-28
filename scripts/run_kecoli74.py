from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd


plt.rcParams['figure.dpi'] = 300


#%%

model_dir = os.path.join('models')
model_kecoli74 = load_model(os.path.join(model_dir,'k-ecoli74.xml'))
species_kecoli74 = get_species(model=model_kecoli74)

ic_default = species_kecoli74.initial_concentration

#%%

result_test = run_time_course(model=model_kecoli74,duration=300)


sp_plot = ["Gluc_e","Glu","Pyr","ATP","NADH","Mal","Ac","Val"]
plt.figure
for sp in sp_plot:
    plt.plot(result_test.index,result_test.loc[:,sp].values,label=sp)
plt.xlabel('Time (s)')
plt.legend()
plt.show()

#%%
set_species(model=model_kecoli74,name="Gluc_e",initial_concentration=0.1)
set_species(model=model_kecoli74,name="Glu",initial_concentration=0.1)
result_test = run_time_course(model=model_kecoli74,duration=300)

sp_plot = ["Gluc_e","Glu","Pyr","ATP","NADH","Mal"]
plt.figure
for sp in sp_plot:
    plt.plot(result_test.index,result_test.loc[:,sp].values,label=sp)
plt.xlabel('Time (s)')
plt.legend()
plt.show()

#%%
set_species(model=model_kecoli74,name="Gluc_e",initial_concentration=2)
# set_species(model=model_kecoli74,name="Glu",initial_concentration=10)
result_test = run_time_course(model=model_kecoli74,duration=300)

sp_plot = ["Gluc_e","Glu","Pyr","ATP","NADH","Mal"]
plt.figure
for sp in sp_plot:
    plt.plot(result_test.index,result_test.loc[:,sp].values,label=sp)
plt.xlabel('Time (s)')
plt.ylim(0,2.25)
plt.legend()
plt.show()
#%%