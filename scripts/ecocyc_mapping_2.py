import numpy as np
import pandas as pd
import os
import requests
import re
import libsbml
import json
import time
from basico import *

#%%

model_name = "k-ecoli74"

wd = os.getcwd().replace('scripts', '')

model_dir = os.path.join(wd,'models')


#%%

s = requests.Session()

with open('biocyc_credentials.json','r') as f:
    credentials = json.load(f)

s.post('https://websvc.biocyc.org/credentials/login/',
       data={'email': credentials['email'], 'password': credentials['password']})

#%%
resources_bigg = os.path.join('resources', 'bigg')
resources_ecocyc = os.path.join('resources', 'ecocyc')
resources_vEcoli = os.path.join('resources', 'vEcoli')
resources_ketchup = os.path.join('resources', 'ketchup')

bigg_web_api = 'http://bigg.ucsd.edu/api/v2/universal/metabolites/'

kecoli74_metabolites = pd.read_excel(os.path.join(resources_ketchup, 'ketchup_supplementary.xlsx'),sheet_name='ST2')['ID'].to_list()
#%%
vEcoli_bulk = np.loadtxt(os.path.join(resources_vEcoli, 'bulk_molecule_ids.txt'),delimiter='\t',dtype=str)

vEcoli_bulk = [x.split('[')[0] for x in vEcoli_bulk]
#%%

kecoli74_metabolites_biocyc = {}
query_failed = []
kecoli74_mapping_multi = {}
for query in kecoli74_metabolites:

    time.sleep(0.15)

    r = s.get(bigg_web_api+str(query.lower()))

    if r.status_code == 200:

        db_links = r.json()['database_links']

        if 'BioCyc' in db_links.keys():

            biocyc_db = db_links['BioCyc']

            if len(biocyc_db) == 1:
                biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                kecoli74_metabolites_biocyc[query] = [biocyc_id]


            else:
                biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                kecoli74_metabolites_biocyc[query] = biocyc_ids


    elif len(query) == 3:
        r = s.get(bigg_web_api + str(query.lower()) + '__L')

        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_db = db_links['BioCyc']

                if len(biocyc_db) == 1:
                    biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                    kecoli74_metabolites_biocyc[query] = [biocyc_id]


                else:
                    biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                    biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                    kecoli74_metabolites_biocyc[query] = biocyc_ids

    elif '_e' in query:
        r = s.get(bigg_web_api + str(query.lower().replace('_e','')))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_db = db_links['BioCyc']

                if len(biocyc_db) == 1:
                    biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                    kecoli74_metabolites_biocyc[query] = [biocyc_id]


                else:
                    biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                    biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                    kecoli74_metabolites_biocyc[query] = biocyc_ids
    else:
        r = s.get(bigg_web_api + str(query))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_db = db_links['BioCyc']

                if len(biocyc_db) == 1:
                    biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                    kecoli74_metabolites_biocyc[query] = [biocyc_id]


                else:
                    biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                    biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                    kecoli74_metabolites_biocyc[query] = biocyc_ids


for query in kecoli74_metabolites:
    if query not in kecoli74_metabolites_biocyc.keys():
        query_failed.append(query)

np.savetxt('mapping_results/query_failed_kecoli74.txt',query_failed,fmt='%s')

#%%
metabolite_translation_kecoli74 = pd.read_csv(os.path.join('mapping_results', 'translation_results_kecoli74.txt'),
                                        sep='\t',header=0,index_col=0)

biocyc_names = metabolite_translation_kecoli74['BioCyc Common-Name'].values
biocyc_query = metabolite_translation_kecoli74.index
biocyc_id = {}

for idx,name in enumerate(biocyc_names):
    url = f'https://websvc.biocyc.org/ECOLI/name-search?object={name}&class=Compounds&fmt=json'
    r = s.get(url)
    if r.status_code == 200:
        kecoli74_metabolites_biocyc[biocyc_query[idx]] = [r.json()['RESULTS'][0]['OBJECT-ID']]

#%%

kecoli74_mapping_manual = pd.read_csv('mapping_results/query_manual_kecoli74.txt',sep='\t',index_col=0,header=0)

for idx in range(len(kecoli74_mapping_manual)):

    ketchup_id = kecoli74_mapping_manual.index[idx]
    kecoli74_metabolites_biocyc[ketchup_id] = [kecoli74_mapping_manual['BioCyc'][idx]]



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

#%%
model_kecoli74 = load_model(os.path.join('models','k-ecoli74.xml'))
species_kecoli74 = get_species(model=model_kecoli74)
rxns_kecoli74 = get_reactions(model=model_kecoli74)

enz_pattern = r'^[A-Z]\d+_ENZ$'

enz_species = []

for species in list(species_kecoli74.index):
    if re.match(enz_pattern, species):
        enz_species.append(species)

#%%



#%%

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
        if np.isin(targets_rxn,list(kecoli74_metabolites_biocyc.keys())).all():
            targets_biocyc = kecoli74_metabolites_biocyc[targets_rxn[0]]
            if len(targets_biocyc) == 1:
                enz_row['biocyc_id'] = targets_biocyc[0]
                enz_mapping = pd.concat([enz_mapping, pd.DataFrame(enz_row)])
            else:
                for target in targets_biocyc:
                    enz_row_new = {}
                    for key,val in enz_row.items():

                        enz_row_new[key] = val
                    enz_row_new['biocyc_id'] = target
                    enz_mapping = pd.concat([enz_mapping, pd.DataFrame(enz_row_new)])

            # enz_row['vEcoli'] = vEcoli_mapping.loc[targets_rxn,'vEcoli']
        else:
            enz_row['biocyc_id'] = 'NA'
            # enz_row['vEcoli'] = 'NA'
            enz_mapping = pd.concat([enz_mapping,pd.DataFrame(enz_row)])
enz_mapping = enz_mapping.set_index('rxn_id')

enz_mapping.to_csv('mapping_results/enz_mapping_kecoli74.txt',sep='\t')
#%%

vEcoli_metabolism = pd.read_csv(os.path.join(resources_vEcoli,'metabolic_reactions.tsv'),sep='\t',index_col=0,header=4)

StoicMat = pd.DataFrame()

for idx in range(len(vEcoli_metabolism)):
    print(idx)
    rxn_stoic = vEcoli_metabolism["stoichiometry"][idx]
    rxn_stoic = rxn_stoic.replace("null","np.nan")
    exec(f"dict_rxn={rxn_stoic}")
    dict_rxn_df = pd.DataFrame(dict_rxn,index=[vEcoli_metabolism.index[idx]])

    StoicMat = pd.concat([StoicMat,dict_rxn_df])

StoicMat = pd.DataFrame(data=np.nan_to_num(StoicMat,copy=True,nan=0.0),index=StoicMat.index,columns=StoicMat.columns)
StoicMat.to_csv(os.path.join(resources_vEcoli,'StoicMat.txt'),sep='\t',index=True,header=True)

#%%

# species_StoicMat = [sp.split('[')[0] for sp in StoicMat.columns ]
# sp_check = [True if sp in StoicMat.columns else False for sp in enz_mapping['biocyc_id']]

sp_check = []

for sp in enz_mapping['biocyc_id']:
    check = [spm if sp==spm.split('[')[0] else None for spm in StoicMat.columns]
    check = [x for x in check if x!=None]
    sp_check.append(check)

enz_mapping['species_vEcoli'] = sp_check

#%%

enz_mapping_vEcoli = []

for target_idx in range(len(enz_mapping)):
    sp_vEcoli = enz_mapping["species_vEcoli"][target_idx]
    enz_vEcoli = []
    for sp in sp_vEcoli:
        rxn_idxs = np.where(StoicMat.loc[:,sp].values < 0)[0]
        sp_rxns = StoicMat.index[rxn_idxs]
        enz_sp = vEcoli_metabolism.loc[sp_rxns,'catalyzed_by'].values
        # enz_sp = [x for xs in enz_sp for x in xs]
        enz_vEcoli.append(enz_sp)
    enz_vEcoli = [x for xs in enz_vEcoli for x in xs]

    enz_vEcoli_new = []
    for enz in enz_vEcoli:
        enzs_str = enz[1:-1]
        enzs_actual = enzs_str.split(',')
        enzs_actual = [s.replace('"','').strip() for s in enzs_actual]
        enz_vEcoli_new.append(enzs_actual)

    enz_vEcoli_new =  [x for xs in enz_vEcoli_new for x in xs]
    enz_vEcoli_new = list(np.unique(enz_vEcoli_new))
    enz_mapping_vEcoli.append(enz_vEcoli_new)

enz_mapping['enz_vEcoli'] = enz_mapping_vEcoli
#%%
