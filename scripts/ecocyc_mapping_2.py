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

kecoli74_metabolites_biocyc = {}
query_failed = []

for query in kecoli74_metabolites:

    time.sleep(0.15)

    r = s.get(bigg_web_api+str(query.lower()))

    if r.status_code == 200:

        db_links = r.json()['database_links']

        if 'BioCyc' in db_links.keys():

            biocyc_id = db_links['BioCyc'][0]['id'].replace('META:','')

            kecoli74_metabolites_biocyc[query] = biocyc_id

    elif len(query) == 3:
        r = s.get(bigg_web_api + str(query.lower()) + '__L')

        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():

                biocyc_id = db_links['BioCyc'][0]['id'].replace('META:','')

                kecoli74_metabolites_biocyc[query] = biocyc_id

    elif '_e' in query:
        r = s.get(bigg_web_api + str(query.lower().replace('_e','')))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():
                biocyc_id = db_links['BioCyc'][0]['id'].replace('META:', '')

                kecoli74_metabolites_biocyc[query] = biocyc_id
    else:
        r = s.get(bigg_web_api + str(query))
        if r.status_code == 200:

            db_links = r.json()['database_links']

            if 'BioCyc' in db_links.keys():
                biocyc_id = db_links['BioCyc'][0]['id']

                kecoli74_metabolites_biocyc[query] = biocyc_id.replace('META:','')


for query in kecoli74_metabolites:
    if query not in kecoli74_metabolites_biocyc.keys():
        query_failed.append(query)


#%%




