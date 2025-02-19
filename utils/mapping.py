import json
import requests
import os
import numpy as np
import pandas as pd
import libsbml
from basico import *


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
            results_dict[query] = biocyc_ids
    return results_dict

def rxn_mapping_sbml (model_name,wd):

    dir_models = os.path.join(wd,'models')
    reader = libsbml.SBMLReader()

    model = reader.readSBMLFromFile(os.path.join(dir_models, str(model_name)+".xml")).getModel()

    species_all = [sp.getName() for sp in model.getListOfSpecies()]
    rxn_all = [rxn.id for rxn in model.getListOfReactions()]

    rxn_mapping = pd.DataFrame(data=np.zeros((len(species_all), len(rxn_all))), index=species_all, columns=rxn_all)

    for reaction in model.getListOfReactions():

        for reactant in reaction.getListOfReactants():
            species_name = str(model.getSpecies(reactant.species).name)
            rxn_mapping.loc[species_name, reaction.id] = -1

        for product in reaction.getListOfProducts():
            species_name = str(model.getSpecies(product.species).name)
            rxn_mapping.loc[species_name, reaction.id] = 1

    return rxn_mapping

def enz_mapping_ketchup(model_name,wd,biocyc_mapping_dict):
    dir_models = os.path.join(wd,'models')
    model_basico = load_model(os.path.join(dir_models,str(model_name)+'.xml'))
    species_basico = get_species(model=model_basico)
    rxns_basico = get_reactions(model=model_basico)

    enz_pattern = r'^[A-Z]\d+_ENZ$'
    enz_species = []

    for species in list(species_basico.index):
        if re.match(enz_pattern, species):
            enz_species.append(species)
    rxn_mapping = rxn_mapping_sbml(model_name,wd)

    enz_mapping = pd.DataFrame()

    for enz in enz_species:
        enz_rxns_idxs = np.where(rxn_mapping.loc[enz, :] < 0)[0]
        rxn_id_sbml = np.array(rxn_mapping.columns)[enz_rxns_idxs]
        rxn_id_basico = np.array(rxns_basico.index)[enz_rxns_idxs]
        for rxn_id in rxn_id_sbml:
            enz_row = {}
            enz_row['enz'] = enz
            enz_row['rxn_id'] = rxn_id
            targets_idx = np.where(rxn_mapping.loc[:, rxn_id] < 0)[0]
            targets_rxn = list(np.array(species_basico.index)[targets_idx])
            targets_rxn.remove(enz)
            enz_row['binding targets'] = targets_rxn
            products_idx = np.where(rxn_mapping.loc[:, rxn_id] > 0)[0]
            products_rxn = list(np.array(species_basico.index)[products_idx])
            enz_row['products'] = products_rxn
            # enz_mapping = pd.concat([enz_mapping,pd.DataFrame(enz_row)])
            if np.isin(targets_rxn, list(biocyc_mapping_dict.keys())).all():
                targets_biocyc = biocyc_mapping_dict[targets_rxn[0]]
                if len(targets_biocyc) == 1:
                    enz_row['biocyc_id'] = targets_biocyc[0]
                    enz_mapping = pd.concat([enz_mapping, pd.DataFrame(enz_row)])
                else:
                    for target in targets_biocyc:
                        enz_row_new = {}
                        for key, val in enz_row.items():
                            enz_row_new[key] = val
                        enz_row_new['biocyc_id'] = target
                        enz_mapping = pd.concat([enz_mapping, pd.DataFrame(enz_row_new)])

                # enz_row['vEcoli'] = vEcoli_mapping.loc[targets_rxn,'vEcoli']
            else:
                enz_row['biocyc_id'] = 'NA'
                # enz_row['vEcoli'] = 'NA'
                enz_mapping = pd.concat([enz_mapping, pd.DataFrame(enz_row)])
    enz_mapping = enz_mapping.set_index('rxn_id')

    return enz_mapping

#%%