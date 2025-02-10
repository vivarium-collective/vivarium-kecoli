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

            biocyc_id = db_links['BioCyc'][0]['id'].replace('META:','')

            kecoli74_metabolites_biocyc[query] = biocyc_id

            if len(db_links['BioCyc'])>1:
                kecoli74_mapping_multi[query] = db_links['BioCyc']

    elif len(query) == 3:
        r = s.get(bigg_web_api + str(query.lower()) + '__L')

        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_id = db_links['BioCyc'][0]['id'].replace('META:','')

                kecoli74_metabolites_biocyc[query] = biocyc_id

                if len(db_links['BioCyc']) > 1:
                    kecoli74_mapping_multi[query] = db_links['BioCyc']

    elif '_e' in query:
        r = s.get(bigg_web_api + str(query.lower().replace('_e','')))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():
                biocyc_id = db_links['BioCyc'][0]['id'].replace('META:', '')

                kecoli74_metabolites_biocyc[query] = biocyc_id

                if len(db_links['BioCyc']) > 1:
                    kecoli74_mapping_multi[query] = db_links['BioCyc']
    else:
        r = s.get(bigg_web_api + str(query))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():
                biocyc_id = db_links['BioCyc'][0]['id']

                kecoli74_metabolites_biocyc[query] = biocyc_id.replace('META:','')

                if len(db_links['BioCyc']) > 1:
                    kecoli74_mapping_multi[query] = db_links['BioCyc']


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
        kecoli74_metabolites_biocyc[biocyc_query[idx]] = r.json()['RESULTS'][0]['OBJECT-ID']

#%%

for idx in range(len(ecocyc_metabolite_results_2)):

    biocyc_id[ecocyc_metabolite_results_2.index[idx]] = ecocyc_metabolite_results_2.BioCyc.values[idx]