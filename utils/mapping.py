import json
import requests
import os
import numpy as np
import pandas as pd
import libsbml


#%%
def biocyc_credentials(dir_credentials):
    s = requests.Session()
    cred_path = os.path.join(dir_credentials, 'biocyc_credentials.json')
    with open(cred_path, 'r') as f:
        credentials = json.load(f)

    s.post('https://websvc.biocyc.org/credentials/login/',
           data={'email': credentials['email'], 'password': credentials['password']})
    return s


def query_bigg2biocyc(query,session):

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
                biocyc_ids = [entry['id'].replace('META:', '') for entry in biocyc_db]


                biocyc_mapping = biocyc_ids

    return biocyc_mapping

def update_results_dict (results_dict,query,biocyc_mapping,wd):
    dir_vEcoli = os.path.join(wd,'resources','vEcoli')
    vEcoli_bulk = np.loadtxt(os.path.join(dir_vEcoli, 'bulk_molecule_ids.txt'), delimiter='\t', dtype=str)

    vEcoli_bulk = [x.split('[')[0] for x in vEcoli_bulk]

    if len(biocyc_mapping)>0:
        biocyc_ids = list(np.array(biocyc_mapping)[np.where(np.isin(biocyc_mapping, vEcoli_bulk))[0]])
        if len(biocyc_ids)>0:
            results_dict[query] = biocyc_mapping
    return results_dict

def rxn_mapping_sbml (model_name,wd):

    dir_models = os.path.join(wd,'models')
    reader = libsbml.SBMLReader()

    model = reader.readSBMLFromFile(os.path.join(dir_models, str(model_name)+".xml")).getModel()

    species_all = [sp.getName() for sp in model.getListOfSpecies()]
    rxn_all = [rxn.id for rxn in model.getListOfReactions()]

    rxn_mapping = pd.DataFrame(data=np.zeros((len(species_all), len(rxn_all))), index=species_all, columns=rxn_all)

    return rxn_mapping
#%%