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


model_name = "E_coli_Millard2016"

wd = os.getcwd().replace('scripts', '')

model_dir = os.path.join(wd,'models')

output_dir = os.path.join(wd,'output',model_name)

os.makedirs(output_dir, exist_ok=True)

output_results = os.path.join(output_dir,'results')
output_plots = os.path.join(output_dir,'plots')
output_mapping = os.path.join(output_dir,'mapping')

os.makedirs(output_results, exist_ok=True)
os.makedirs(output_plots, exist_ok=True)
os.makedirs(output_mapping, exist_ok=True)

dir_credentials = os.path.join(wd,'credentials')

#%%
from utils.mapping import (biocyc_credentials,
                           query_bigg2biocyc,
                           update_results_dict,
                           rxn_mapping_sbml,
                           enz_mapping_ketchup)

s = biocyc_credentials(dir_credentials)



#%%
resources_bigg = os.path.join('resources', 'bigg')
resources_ecocyc = os.path.join('resources', 'ecocyc')
resources_vEcoli = os.path.join('resources', 'vEcoli')
resources_ketchup = os.path.join('resources', 'ketchup')

bigg_web_api = 'http://bigg.ucsd.edu/api/v2/universal/metabolites/'

model_dir = os.path.join('models')
model_millard = load_model(os.path.join(model_dir,str(model_name)+'.xml'))

species_all = get_species(model=model_millard)
rxn_all = get_reactions(model=model_millard)
ic_default = species_all.initial_concentration

#%%
vEcoli_bulk = np.loadtxt(os.path.join(resources_vEcoli, 'bulk_molecule_ids.txt'),delimiter='\t',dtype=str)

vEcoli_bulk = [x.split('[')[0] for x in vEcoli_bulk]

#%%
millard_species = list(species_all.index)


millard_metabolites_biocyc = {}
query_failed = []


for query in millard_species:

    time.sleep(0.15)

    query_send = str(query.lower())  # query with lowercase first

    biocyc_mapping = query_bigg2biocyc(query_send, s)

    if len(biocyc_mapping) > 0:
        millard_metabolites_biocyc = update_results_dict(millard_metabolites_biocyc, query, biocyc_mapping, wd)

    elif len(query) == 3:

        query_send = str(query.lower()) + '__L'  # for finding L-amino acids
        biocyc_mapping = query_bigg2biocyc(query_send, s)

        millard_metabolites_biocyc = update_results_dict(millard_metabolites_biocyc, query, biocyc_mapping, wd)

    elif '_e' in query:

        query_send = str(query.lower().replace('_e', ''))  # removing compartment identifier from query
        biocyc_mapping = query_bigg2biocyc(query_send, s)

        millard_metabolites_biocyc = update_results_dict(millard_metabolites_biocyc, query, biocyc_mapping, wd)


    else:
        query_send = query
        biocyc_mapping = query_bigg2biocyc(query_send, s)
        millard_metabolites_biocyc = update_results_dict(millard_metabolites_biocyc, query, biocyc_mapping, wd)

    #%%
    time.sleep(0.15)

    r = s.get(bigg_web_api + str(query.lower()))

    if r.status_code == 200:

        db_links = r.json()['database_links']

        if 'BioCyc' in db_links.keys():

            biocyc_db = db_links['BioCyc']

            if len(biocyc_db) == 1:
                biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                millard_metabolites_biocyc[query] = [biocyc_id]


            else:
                biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                millard_metabolites_biocyc[query] = biocyc_ids


    elif len(query) == 3:
        r = s.get(bigg_web_api + str(query.lower()) + '__L')

        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_db = db_links['BioCyc']

                if len(biocyc_db) == 1:
                    biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                    millard_metabolites_biocyc[query] = [biocyc_id]


                else:
                    biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                    biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                    millard_metabolites_biocyc[query] = biocyc_ids

    elif '_e' in query:
        r = s.get(bigg_web_api + str(query.lower().replace('_e', '')))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_db = db_links['BioCyc']

                if len(biocyc_db) == 1:
                    biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                    millard_metabolites_biocyc[query] = [biocyc_id]


                else:
                    biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                    biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                    millard_metabolites_biocyc[query] = biocyc_ids
    else:
        r = s.get(bigg_web_api + str(query))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_db = db_links['BioCyc']

                if len(biocyc_db) == 1:
                    biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                    millard_metabolites_biocyc[query] = [biocyc_id]


                else:
                    biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                    biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                    millard_metabolites_biocyc[query] = biocyc_ids

#%%

for query in millard_species:
    if query not in millard_metabolites_biocyc.keys():
        query_failed.append(query)

np.savetxt(os.path.join(output_mapping,'query_failed_millard.txt'),query_failed,fmt='%s')


#%%

metabolite_translation_millard = pd.read_csv(os.path.join('mapping_results', 'translation_results_millard.txt'),
                                        sep='\t',header=0,index_col=0)

biocyc_names = metabolite_translation_millard['BioCyc Common-Name'].values
biocyc_query = metabolite_translation_millard.index
biocyc_id = {}

for idx,name in enumerate(biocyc_names):
    url = f'https://websvc.biocyc.org/ECOLI/name-search?object={name}&class=Compounds&fmt=json'
    r = s.get(url)
    if r.status_code == 200:
        millard_metabolites_biocyc[biocyc_query[idx]] = [r.json()['RESULTS'][0]['OBJECT-ID']]

#%%

with open(os.path.join(output_mapping,'ecocyc_mapping_millard_partial.json'), 'w') as f:
    json.dump(millard_metabolites_biocyc,f, indent=2)

#%%