import os
import json
import urllib.parse
import xml.etree.ElementTree as ET
import sys
#%%

wd = os.getcwd().replace('scripts', '')

sys.path.append(wd)

from utils.mapping import biocyc_credentials
from utils.biovelo import *



dir_credentials = os.path.join(wd,'credentials')

s = biocyc_credentials(dir_credentials)



#%%

substrates_r2x = ['FRUCTOSE-16-DIPHOSPHATE']
products_r2x = ['FRUCTOSE-6P']

expr_r2x = expr_rxns(substrates_r2x,products_r2x,db_name='ECOLI')


#%%

substrates_r28 = ['CARBON-DIOXIDE', 'PHOSPHO-ENOL-PYRUVATE']
products_r28 = ['OXALACETIC_ACID']

expr_r28 = expr_rxns(substrates_r28,products_r28,db_name='ECOLI')

#%%