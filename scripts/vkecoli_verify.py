import matplotlib.pyplot as plt

plt.rcParams['figure.dpi'] = 90

#%%
data = sim.emitter.get_timeseries()

# gluc_e_timeseries = [data['species_store'][tp][26][1] for tp in range(11)]



#%%
sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "Ac_e", "CO2_e"]

plt.rcParams['figure.dpi'] = 90

plt.figure()

for sp in sp_plot:
    sp_idx = kecoli_process.all_species.index(sp)

    sp_traj = [data['species_store'][tp][sp_idx][1] for tp in range(len(data['species_store']))]

    plt.plot(data['time'],sp_traj,label=sp)

plt.legend()
plt.show()
#%%