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

def gen_StoicMat_vEcoli(model_name,wd): #incomplete

    StoicMat = pd.DataFrame()

    return StoicMat

def retrieve_cat_rxns(model_name,wd):
    rxn_mapping = rxn_mapping_sbml(model_name,wd)
    enz_cat_rxns = {}

    for rxn_idx in range(np.shape(rxn_mapping)[1]):
        if len(np.where(rxn_mapping.iloc[:, rxn_idx])[0]) == 2:
            cat_rxn = rxn_mapping.columns[rxn_idx]
            rxn_dict = {}
            reac = rxn_mapping.index[np.where(rxn_mapping.iloc[:, rxn_idx] < 0)[0][0]]
            prod = rxn_mapping.index[np.where(rxn_mapping.iloc[:, rxn_idx] > 0)[0][0]]
            rxn_dict['reactant'] = reac
            rxn_dict['product'] = prod
            enz_cat_rxns[cat_rxn] = rxn_dict

    return enz_cat_rxns

def enz_mapping_biocyc(model_name,wd,biocyc_mapping_dict):
    enz_df_full = pd.DataFrame()

    enz_cat_rxns = retrieve_cat_rxns(model_name,wd)

    for rxn in enz_cat_rxns.keys():
        rxn_dict = enz_cat_rxns[rxn]
        substrates = rxn_dict['reactant'].split('+')
        enz = list(filter(lambda x: 'ENZ' in x, substrates))[0]
        substrates.remove(enz)
        products = rxn_dict['product'].split('+')
        products.remove(enz)
        if len(products) != 0:
            enz_dict = {}
            enz_dict["enzyme"] = enz
            enz_dict["substrates"] = list(np.unique(substrates))
            enz_dict["produts"] = list(np.unique(products))
            substrates_biocyc = [biocyc_mapping_dict[subs] for subs in substrates]
            substrates_biocyc = list(np.unique([item for items in substrates_biocyc for item in items]))
            enz_dict["substrates_biocyc"] = substrates_biocyc
            products_biocyc = [biocyc_mapping_dict[prod] for prod in products]
            products_biocyc = list(np.unique([item for items in products_biocyc for item in items]))
            enz_dict["products_biocyc"] = products_biocyc

            enz_df = pd.DataFrame(columns=list(enz_dict.keys()), index=['0'])
            for col in enz_df.columns:
                enz_df.loc['0', col] = enz_dict[col]

            enz_df_full = pd.concat([enz_df_full, enz_df])

    enz_df_full = enz_df_full.set_index('enzyme')

    return enz_df_full

#%%

class RxnMapping():

    def __init__(self,model_name,wd):
        self.model_name = model_name
        self.wd = wd
        dir_models = os.path.join(wd,'models')
        reader = libsbml.SBMLReader()

        self.model = reader.readSBMLFromFile(os.path.join(dir_models, str(model_name)+".xml")).getModel()
        self.species_all = [sp.getName() for sp in self.model.getListOfSpecies()]
        self.rxn_all = [rxn.id for rxn in self.model.getListOfReactions()]

        self.rxn_mapping = pd.DataFrame(data=np.zeros((len(self.species_all), len(self.rxn_all))), index=self.species_all, columns=self.rxn_all)
        for reaction in self.model.getListOfReactions():

            for reactant in reaction.getListOfReactants():
                species_name = str(self.model.getSpecies(reactant.species).name)
                self.rxn_mapping.loc[species_name, reaction.id] = -1

            for product in reaction.getListOfProducts():
                species_name = str(self.model.getSpecies(product.species).name)
                self.rxn_mapping.loc[species_name, reaction.id] = 1

    def rxn_get_sp(self,rxn_id):
        return self.rxn_mapping.loc[:, rxn_id]

    def sp_get_rxn(self,sp_id):
        return self.rxn_mapping.loc[sp_id, :]