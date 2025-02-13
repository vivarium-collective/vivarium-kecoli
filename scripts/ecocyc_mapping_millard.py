import numpy as np
import pandas as pd
import os
import requests
import re
import libsbml
import json
import time
from basico import *

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

model_dir = os.path.join('models')
model_millard = load_model(os.path.join(model_dir,'E_coli_Millard2016.xml'))

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
millard_mapping_multi = {}


for query in millard_species:

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

for query in millard_species:
    if query not in millard_metabolites_biocyc.keys():
        query_failed.append(query)

#%%