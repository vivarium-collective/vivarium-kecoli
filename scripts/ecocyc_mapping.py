import numpy as np
import pandas as pd
import os
import requests
import re
import libsbml
from pandas.core.nanops import nanskew

from scripts.run_kecoli74 import rxn_kecoli74

s = requests.Session()

with open('biocyc_credentials.json','r') as f:
    credentials = json.load(f)

s.post('https://websvc.biocyc.org/credentials/login/',
       data={'email': credentials['email'], 'password': credentials['password']})
#%%
resources_bigg = os.path.join('resources', 'bigg')
resources_ecocyc = os.path.join('resources', 'ecocyc')
resources_vEcoli = os.path.join('resources', 'vEcoli')

ecocyc_cc = pd.read_csv(os.path.join(resources_ecocyc, 'Central-carbon-metabolism.txt'),
                        sep='\t',header=0,index_col=0)
bigg_metabolites = pd.read_csv(os.path.join(resources_bigg, 'bigg_models_metabolites.txt'),
                               sep='\t',header=0,index_col=0)
bigg_rxns = pd.read_csv(os.path.join(resources_bigg,'bigg_models_reactions.txt'),
                        sep='\t',header=0,index_col=0)
ecocyc_metabolite_results = pd.read_csv(os.path.join(resources_ecocyc, 'metabolite_translation_results.txt'),
                                        sep='\t',header=0,index_col=0)
ecocyc_metabolite_results_2 = pd.read_csv(os.path.join(resources_ecocyc, 'ketchup-metabolites.txt'),
                                          sep='\t',header=0,index_col=0)

vEcoli_bulk = np.loadtxt(os.path.join(resources_vEcoli, 'bulk_molecule_ids.txt'),delimiter='\t',dtype=str)

vEcoli_bulk = [x.split('[')[0] for x in vEcoli_bulk]

#%%
biocyc_names = ecocyc_metabolite_results['BioCyc Common-Name'].values
biocyc_query = ecocyc_metabolite_results.index
biocyc_id = {}

for idx,name in enumerate(biocyc_names):
    url = f'https://websvc.biocyc.org/ECOLI/name-search?object={name}&class=Compounds&fmt=json'
    r = s.get(url)
    if r.status_code == 200:
        biocyc_id[biocyc_query[idx]] = r.json()['RESULTS'][0]['OBJECT-ID']

for idx in range(len(ecocyc_metabolite_results_2)):

    biocyc_id[ecocyc_metabolite_results_2.index[idx]] = ecocyc_metabolite_results_2.BioCyc.values[idx]

#%% vEcoli cross reference
vEcoli_mapping = pd.DataFrame(index=biocyc_id.keys())
vEcoli_mapping['biocyc_id'] = biocyc_id.values()

vEcoli_mapping['vEcoli'] = np.isin(list(biocyc_id.values()),vEcoli_bulk)

#%% kecoli rxn_mapping


reader = libsbml.SBMLReader()

model = reader.readSBMLFromFile(os.path.join("models","k-ecoli74.xml")).getModel()


species_all = [sp.getName() for sp in model.getListOfSpecies()]
rxn_all = [rxn.id for rxn in model.getListOfReactions()]

rxn_mapping = pd.DataFrame(data=np.zeros((len(species_all),len(rxn_all))), index=species_all, columns=rxn_all)


for reaction in model.getListOfReactions():

    for reactant in reaction.getListOfReactants():

        species_name = str(model.getSpecies(reactant.species).name)
        rxn_mapping.loc[species_name,reaction.id] = -1

    for product in reaction.getListOfProducts():

        species_name = str(model.getSpecies(product.species).name)
        rxn_mapping.loc[species_name,reaction.id] = 1


#%% ENZ mapping

model_kecoli74 = load_model(os.path.join('models','k-ecoli74.xml'))
species_kecoli74 = get_species(model=model_kecoli74)
rxns_kecoli74 = get_reactions(model=model_kecoli74)

enz_pattern = r'^[A-Z]\d+_ENZ$'

enz_species = []

for species in list(species_kecoli74.index):
    if re.match(enz_pattern, species):
        enz_species.append(species)

#%%
# iterate through enz_species
# find rxn_mapping for enz_species = -1
# iterate through rxns
# find other reactants
# check for inhibition
enz_mapping = pd.DataFrame()

for enz in enz_species:
    enz_rxns_idxs = np.where(rxn_mapping.loc[enz,:]<0)[0]
    rxn_id_sbml = np.array(rxn_mapping.columns)[enz_rxns_idxs]
    rxn_id_basico = np.array(rxns_kecoli74.index)[enz_rxns_idxs]
    for rxn_id in rxn_id_sbml:
        enz_row = {}
        enz_row['enz'] = enz
        enz_row['rxn_id'] = rxn_id
        targets_idx = np.where(rxn_mapping.loc[:,rxn_id]<0)[0]
        targets_rxn = list(np.array(species_kecoli74.index)[targets_idx])
        targets_rxn.remove(enz)
        enz_row['binding targets'] = targets_rxn
        products_idx = np.where(rxn_mapping.loc[:,rxn_id]>0)[0]
        products_rxn = list(np.array(species_kecoli74.index)[products_idx])
        enz_row['products'] = products_rxn
        # enz_mapping = pd.concat([enz_mapping,pd.DataFrame(enz_row)])
        if np.isin(targets_rxn,list(vEcoli_mapping.index)).all():
            enz_row['biocyc_id'] = vEcoli_mapping.loc[targets_rxn,'biocyc_id']
            enz_row['vEcoli'] = vEcoli_mapping.loc[targets_rxn,'vEcoli']
        else:
            enz_row['biocyc_id'] = 'NA'
            enz_row['vEcoli'] = 'NA'
        enz_mapping = pd.concat([enz_mapping,pd.DataFrame(enz_row)])
enz_mapping = enz_mapping.set_index('rxn_id')
#%%
enz_mapping_new = {}

for rxn in enz_mapping.index:
    enz_row_new = dict(enz_mapping.loc[rxn])







