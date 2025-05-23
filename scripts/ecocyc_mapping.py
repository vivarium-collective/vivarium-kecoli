import numpy as np
import pandas as pd
import os
import requests
import re
import libsbml
import json
import time
from basico import *
import urllib.parse
import pickle

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
                           enz_mapping_ketchup,
                           retrieve_cat_rxns,
                           enz_mapping_biocyc)

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

#%%
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

#%%
kecoli74_mapping_metabolites = pd.DataFrame(index=kecoli74_metabolites,
                                            columns=['BioCyc'],
                                            data = np.ones(len(kecoli74_metabolites))*np.nan)


for mtb in kecoli74_metabolites:

    if kecoli74_metabolites_biocyc.get(mtb):
        kecoli74_mapping_metabolites.loc[mtb,'BioCyc'] = np.array(kecoli74_metabolites_biocyc[mtb]).astype('str')


#%%

kecoli74_mapping_metabolites.to_csv(os.path.join('mapping_results','kecoli74_mapping_metabolites.csv'))






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

pd.DataFrame(enz_cat_rxns).transpose().to_csv(os.path.join(output_mapping, 'enz_cat_rxns.txt'), sep='\t', index=True, header=True)

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
rst = s.put(url=url_st,data=json.dumps(smart_table_dict))

smart_table_id = rst.json()

with open (os.path.join(output_mapping,'smart_table_id.json'), 'w') as f:
    json.dump(smart_table_id,f)

#%% st retrieval test

st_retrieval_id = str(smart_table_id['id'])

# url_st_retrieval = f'https://websvc.biocyc.org/st-service-get?id={st_retrieval_id}&format=json'

url_st_retrieval = f'https://websvc.biocyc.org/st-get?id={st_retrieval_id}&format=json'

rst01 = s.get(url=url_st_retrieval) # success

#%%

url_example = "https://websvc.biocyc.org/st-get?id=biocyc14-15682-3673724563&format=json&sid=biocyc17-3943991625"

rst03 = s.get(url_example) # status code 200
print(rst03.json())


#%%

sid2 = 'biocyc14-3948971799'
sid_chrome = 'biocyc17-3943991625'

rst02 = s.get(url_st_retrieval+("&sid=")+str(sid_chrome))


#%% biovelo test

url_test = "https://websvc.biocyc.org/xmlquery?query=%5bx%3ax%3c-ecoli%5e%5egenes%2cx%5ename%253D%22trpA%22%5d&detail=full"

r_biovelo = s.get(url_test)

import xml.etree.ElementTree as ET

xml_content = r_biovelo.text
xml_tree = ET.fromstring(xml_content)

for element in xml_tree.findall('.//*'):
    print(element.text)

#%% biovelo url encoding:

biovelo_query = "%28%5B%28Reaction%2C%20EC_Number%29%3Af%3C-ECOLI%5E%5EReactions%2C%20%21%28classp%20f%29%2C%20EC_Number%20%3A%3D%20f%5EEC-NUMBER%2C%20Reaction%20%3A%3D%20f%5E%3FNAME%2C%20%2C%20%5Bc%3Ac%3C-f%5ESUBSTRATES%2C%20%28c%20isa%20D-glucopyranose-6-phosphate%20%7C%20c%3DECOLI%7ED-glucopyranose-6-phosphate%29%5D%2C%20%5Bc%3Ac%3C-f%5ESUBSTRATES%2C%20c%3DECOLI%7EFRUCTOSE-6P%5D%2C%20%28opp-side-substrates%3F%20%28f%2C%20ECOLI%7ED-glucopyranose-6-phosphate%2C%20ECOLI%7EFRUCTOSE-6P%29%29%5D%2C%201%29"

url_test = "https://websvc.biocyc.org/xmlquery?"+biovelo_query

r_biovelo2 = s.get(url_test)



#%% pathway tools test
url_test = "https://websvc.biocyc.org/apixml?fn=genes-regulated-by-gene&id=ECOLI:EG10164&detail=none"

r_ptools = s.get(url_test)




#%%

url_biovelo_query = "https://websvc.biocyc.org/xmlquery?query="

test_input_idx = 24

biovelo_input = open(os.path.join(wd,f"test_input",f"biovelo_{str(test_input_idx)}.txt"),'r').read().replace("\n","")

r_biovelo = s.get(url_biovelo_query+str(biovelo_input))

print(r_biovelo.status_code)
#%%
print(r_biovelo.text)


#%%
test_input_idx = 26

biovelo_input = open(os.path.join(wd,f"test_input",f"biovelo_{str(test_input_idx)}.txt"),'r').read().replace("\n","")

query_encoded = urllib.parse.quote(biovelo_input)

r_biovelo = s.get(url_biovelo_query+str(query_encoded))

print(r_biovelo.status_code)

#%%
print(r_biovelo.text)


#%%


xml_content = r_biovelo.text
xml_tree = ET.fromstring(xml_content)

for element in xml_tree.findall('Reaction'):
    ID = element.get("ID")
    text_content = element.text
    print(f"Tag: {element.tag}, Attribute: {ID}, Text: {text_content}")

#%% extract enzyme id

enz01 = xml_tree.findall('Reaction')[0].find('enzymatic-reaction').findall('Enzymatic-Reaction')[0].find('enzyme').find('Protein').get('frameid')
enz02 = xml_tree.findall('Reaction')[0].find('enzymatic-reaction').findall('Enzymatic-Reaction')[1].find('enzyme').find('Protein').get('frameid')



#%%
from utils.biovelo import *


#%%
db_name = "ECOLI"


#%%
# from utils.mapping import enz_mapping_biocyc
enz_df_full = enz_mapping_biocyc('k-ecoli74',wd,kecoli74_metabolites_biocyc)

#%% test loop

# enz = 'R28_ENZ'
enz = 'R2x_ENZ'
substrates = enz_df_full.loc[enz,'substrates_biocyc']
products = enz_df_full.loc[enz,'products_biocyc']
expr_rxns_enz = expr_rxns(substrates,products,db_name='ECOLI')

# expr_subs_list = [expr_subs(subs,'ECOLI') for subs in substrates+products]
#
# expr_subs_full = ",".join(expr_subs_list)

# expr_subs_enz = expr_subs_full(substrates+products,'ECOLI')
#
# expr_sides_enz = expr_sides(substrates,products,'ECOLI')
#
# expr_rxns_enz = expr_rxns(expr_subs_enz,expr_sides_enz,'ECOLI')

#%%
query_encoded = urllib.parse.quote(expr_rxns_enz)

r_biovelo = s.get(url_biovelo_query+str(query_encoded))

print(r_biovelo.status_code)

#%%
print(r_biovelo.text)
xml_content = r_biovelo.text
xml_tree = ET.fromstring(xml_content)

for element in xml_tree.findall('Reaction'):
    ID = element.get("ID")
    text_content = element.text
    print(f"Tag: {element.tag}, Attribute: {ID}, Text: {text_content}")



#%%
