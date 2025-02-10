import requests
import json

s = requests.Session()

with open('biocyc_credentials.json','r') as f:
    credentials = json.load(f)

s.post('https://websvc.biocyc.org/credentials/login/',
       data={'email': credentials['email'], 'password': credentials['password']})

#%%
name_a = 'trpA'
class_a ='Genes'
fmt_a = 'json'

r = s.get(f'https://websvc.biocyc.org/ECOLI/name-search?object={name_a}&class={class_a}&fmt={fmt_a}')

if r.status_code == 200:
    print(r.json())

#%%


rr=s.get('http://bigg.ucsd.edu/api/v2/universal/metabolites/akg').json()

#%%

#%%