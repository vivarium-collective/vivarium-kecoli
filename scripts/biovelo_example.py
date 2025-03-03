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