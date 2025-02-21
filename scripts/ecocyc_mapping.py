import numpy as np
import pandas as pd
import os
import requests
import re
import libsbml
import json
import time
from basico import *
import pickle

from scripts.ecocyc_mapping_kecoli307 import products_rxn

#%%

model_name = "k-ecoli74"

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
resources_bigg = os.path.join(wd,'resources', 'bigg')
resources_ecocyc = os.path.join(wd,'resources', 'ecocyc')
resources_vEcoli = os.path.join(wd,'resources', 'vEcoli')
resources_ketchup = os.path.join(wd,'resources', 'ketchup')

bigg_web_api = 'http://bigg.ucsd.edu/api/v2/universal/metabolites/'

kecoli74_metabolites = pd.read_excel(os.path.join(resources_ketchup, 'ketchup_supplementary.xlsx'),sheet_name='ST2')['ID'].to_list()
#%%
vEcoli_bulk = np.loadtxt(os.path.join(resources_vEcoli, 'bulk_molecule_ids.txt'),delimiter='\t',dtype=str)

vEcoli_bulk = [x.split('[')[0] for x in vEcoli_bulk]

#%% biocyc web service new


kecoli74_metabolites_biocyc = {}
query_failed = []

for query in kecoli74_metabolites:

    time.sleep(0.15)

    query_send = str(query.lower()) # query with lowercase first

    biocyc_mapping = query_bigg2biocyc(query_send,s)

    if len(biocyc_mapping) > 0:
        kecoli74_metabolites_biocyc = update_results_dict(kecoli74_metabolites_biocyc,query,biocyc_mapping,wd)

    elif len(query) == 3:

        query_send  = str(query.lower()) + '__L' # for finding L-amino acids
        biocyc_mapping = query_bigg2biocyc(query_send,s)

        kecoli74_metabolites_biocyc = update_results_dict(kecoli74_metabolites_biocyc,query,biocyc_mapping,wd)

    elif '_e' in query:

        query_send = str(query.lower().replace('_e',''))  # removing compartment identifier from query
        biocyc_mapping = query_bigg2biocyc(query_send, s)

        kecoli74_metabolites_biocyc = update_results_dict(kecoli74_metabolites_biocyc,query,biocyc_mapping,wd)


    else:
        query_send = query
        biocyc_mapping = query_bigg2biocyc(query_send, s)
        kecoli74_metabolites_biocyc = update_results_dict(kecoli74_metabolites_biocyc,query,biocyc_mapping,wd)




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

#%%
with open(os.path.join(output_mapping,'ecocyc_mapping_kecoli74.json'), 'w') as f:
    json.dump(kecoli74_metabolites_biocyc,f, indent=2)

#%% kecoli rxn_mapping
rxn_mapping = rxn_mapping_sbml(model_name,wd)
enz_mapping = enz_mapping_ketchup(model_name,wd,kecoli74_metabolites_biocyc)


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
# StoicMat.to_csv(os.path.join(resources_vEcoli,'StoicMat.txt'),sep='\t',index=True,header=True)
#%%
# with open (os.path.join(output_mapping,'StoicMat.pickle'),'wb') as f:
#     pickle.dump(StoicMat,f)
StoicMat.to_csv(os.path.join(output_mapping, 'StoicMat.txt'), sep='\t', index=True, header=True)


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
enz_mapping.to_csv(os.path.join(output_mapping, 'enz_mapping_vEcoli.txt'), sep='\t', index=True, header=True)

#%%
enz_products = {}
enz_species = list(np.unique(enz_mapping["enz"]))
for enz in enz_species:
    rxns_prod = rxn_mapping.columns[np.where(rxn_mapping.loc[enz,:]>0)[0]]
    enz_rxn = {}
    for rxn in rxns_prod:
        prods_all = list(rxn_mapping.index[np.where(rxn_mapping.loc[:,rxn]>0)[0]])
        prods_all.remove(enz)
        enz_rxn[rxn] = prods_all
    enz_products[enz] =enz_rxn

#%%

enz_cat_rxns = {}

for rxn_idx in range(np.shape(rxn_mapping)[1]):
    if len(np.where(rxn_mapping.iloc[:,rxn_idx])[0])==2:
        cat_rxn = rxn_mapping.columns[rxn_idx]
        rxn_dict = {}
        reac = rxn_mapping.index[np.where(rxn_mapping.iloc[:,rxn_idx]<0)[0][0]]
        prod = rxn_mapping.index[np.where(rxn_mapping.iloc[:,rxn_idx]>0)[0][0]]
        rxn_dict['reactant'] = reac
        rxn_dict['product'] = prod
        enz_cat_rxns[cat_rxn] = rxn_dict

#%%
enz_df_full = pd.DataFrame()

rxns_test = ['R_R55_6','R_R56_10']

enz_dict_all = {}
# for rxn in enz_cat_rxns.keys():

for rxn in enz_cat_rxns.keys():
    rxn_dict = enz_cat_rxns[rxn]
    substrates = rxn_dict['reactant'].split('+')
    enz = list(filter(lambda x: 'ENZ' in x, substrates))[0]
    substrates.remove(enz)
    products = rxn_dict['product'].split('+')
    products.remove(enz)
    if len(products)!=0:
        enz_dict = {}
        enz_dict["enzyme"] = enz
        enz_dict["substrates"] = list(np.unique(substrates))
        enz_dict["produts"] = list(np.unique(products))
        substrates_biocyc = [kecoli74_metabolites_biocyc[subs] for subs in substrates]
        substrates_biocyc = list(np.unique([item for items in substrates_biocyc for item in items]))
        enz_dict["substrates_biocyc"] = substrates_biocyc
        products_biocyc = [kecoli74_metabolites_biocyc[prod] for prod in products]
        products_biocyc = list(np.unique([item for items in products_biocyc for item in items]))
        enz_dict["products_biocyc"] = products_biocyc

        enz_df = pd.DataFrame(columns=list(enz_dict.keys()),index=['0'])
        for col in enz_df.columns:
            enz_df.loc['0',col] = enz_dict[col]

    # enz_df_current = pd.DataFrame({key:(value) for key, value in enz_dict.items()})
    # enz_df = pd.concat([enz_df,enz_df_current],ignore_index=True)
        enz_dict_all[enz] = enz_dict

        enz_df_full = pd.concat([enz_df_full,enz_df])

enz_df_full = enz_df_full.set_index('enzyme')

enz_df_full.to_csv(os.path.join(output_mapping,'enz_df_full.txt'), sep='\t', index=True, header=True)
#%%



#%%






#%%




#%% smart table api test

smart_table_list = list(enz_mapping['biocyc_id'].values)

smart_table_dict = {
    "name": "smart_table_python",
    "description": "test",
    "pgdb": "ECOLI",
    "type": "Compounds",
    "values": smart_table_list[:5]
}

url_st = 'https://websvc.biocyc.org/st-create?format=json&orgid=ECOLI&class=Compounds'

#%%
rst = s.put(url=url_st,data=smart_table_dict)

#%%