from basico import *
import os
import matplotlib.pyplot as plt
import numpy as np


plt.rcParams['figure.dpi'] = 300


#%%

model_dir = os.path.join('models')
model_kecoli74 = load_model(os.path.join(model_dir,'k-ecoli74.xml'))
species_kecoli74 = get_species(model=model_kecoli74)[:,"sbml_id"]
#%%

result_test = run_time_course(model=model_kecoli74,duration=3000)

#%%
sp = "Gluc_e"
plt.figure
plt.plot(result_test.index,result_test.loc[:,sp].values)
plt.xlabel('Time (s)')
plt.show()

#%%