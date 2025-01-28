import numpy as np
import pandas as pd
import os
import requests

s = requests.Session()
s.post('https://websvc.biocyc.org/credentials/login/',
       data={'email': 'mutsuddy@uchc.edu', 'password': 'FX##uhsVdpiTK7X'})

#%%
resources_bigg = os.path.join('resources', 'bigg')
resources_ecocyc = os.path.join('resources', 'ecocyc')

ecocyc_cc = pd.read_csv(os.path.join(resources_ecocyc, 'Central-carbon-metabolism.txt'),
                        sep='\t',header=0,index_col=0)
bigg_metabolites = pd.read_csv(os.path.join(resources_bigg, 'bigg_models_metabolites.txt'),
                               sep='\t',header=0,index_col=0)
bigg_rxns = pd.read_csv(os.path.join(resources_bigg,'bigg_models_reactions.txt'),
                        sep='\t',header=0,index_col=0)
ecocyc_metabolite_results = pd.read_csv(os.path.join(resources_ecocyc, 'metabolite_translation_results.txt'),
                                        sep='\t',header=0,index_col=0)


#%%
biocyc_names = ecocyc_metabolite_results['BioCyc Common-Name'].values

biocyc_id = {}

for name in biocyc_names:
    url = f'https://websvc.biocyc.org/ECOLI/name-search?object={name}&class=Compounds&fmt=json'
    r = s.get(url)
    if r.status_code == 200:
        biocyc_id[name] = r.json()['RESULTS'][0]['OBJECT-ID']

