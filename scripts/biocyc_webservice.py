import requests

s = requests.Session()
s.post('https://websvc.biocyc.org/credentials/login/',
       data={'email': 'mutsuddy@uchc.edu', 'password': 'FX##uhsVdpiTK7X'})

#%%
name_a = 'trpA'
class_a ='Genes'
fmt_a = 'json'

r = s.get(f'https://websvc.biocyc.org/ECOLI/name-search?object={name_a}&class={class_a}&fmt={fmt_a}')

if r.status_code == 200:
    print(r.json())