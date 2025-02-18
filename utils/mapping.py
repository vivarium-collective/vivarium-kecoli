import json
import requests
import os
import numpy as np


#%%
def biocyc_credentials(dir_credentials):
    s = requests.Session()
    cred_path = os.path.join(dir_credentials, 'biocyc_credentials.json')
    with open(cred_path, 'r') as f:
        credentials = json.load(f)

    s.post('https://websvc.biocyc.org/credentials/login/',
           data={'email': credentials['email'], 'password': credentials['password']})
    return s


def query_bigg2biocyc(query,session,vEcoli_bulk=vEcoli_bulk):

    biocyc_mapping = []
    bigg_web_api = 'http://bigg.ucsd.edu/api/v2/universal/metabolites/'
    r = session.get(bigg_web_api + str(query))
    if r.status_code == 200:

        db_links = r.json()['database_links']

        if 'BioCyc' in db_links.keys():

            biocyc_db = db_links['BioCyc']

            if len(biocyc_db) == 1:
                biocyc_id = biocyc_db[0]['id'].replace('META:', '')
                biocyc_mapping = [biocyc_id]


            else:
                biocyc_ids_search = [entry['id'].replace('META:', '') for entry in biocyc_db]
                biocyc_ids = list(np.array(biocyc_ids_search)[np.where(np.isin(biocyc_ids_search, vEcoli_bulk))[0]])

                biocyc_mapping = biocyc_ids

    return biocyc_mapping

#%%