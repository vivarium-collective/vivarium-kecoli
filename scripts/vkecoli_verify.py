
data = sim.emitter.get_timeseries()

# gluc_e_timeseries = [data['species_store'][tp][26][1] for tp in range(11)]

#%%
data_rearranged = {}
for timepoint in data['species_store']:
    for species in timepoint:
        mol_id = species[0]
        value = species[1]

        if mol_id not in data_rearranged:
            data_rearranged[mol_id] = []
        data_rearranged[mol_id].append(value)


#%%
sp_plot = ["Gluc_e", "Pyr", "ATP", "NADH", "Ac_e", "CO2_e"]

plt.rcParams['figure.dpi'] = 90

plt.figure()

for sp in sp_plot:

    plt.plot(data['time'],data_rearranged[sp],label=sp)

plt.legend()
plt.show()
