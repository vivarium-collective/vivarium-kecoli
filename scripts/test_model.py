from basico import *
import os
import libsbml
#%%

model_dir = os.path.join('models')

model_kecoli74 = load_model(os.path.join(model_dir,'k-ecoli74.xml'))
model_kecoli307 = load_model(os.path.join(model_dir,'k-ecoli307.xml'))

sbml_reader = libsbml.SBMLReader()

sbml_kecoli74  = sbml_reader.readSBMLFromFile(os.path.join(model_dir,'k-ecoli74.xml')).getModel()

sp1 = get_species(model=model_kecoli74).sbml_id.tolist()
rxn1 = get_reactions(model=model_kecoli74).sbml_id.tolist()

sp2 = get_species(model=model_kecoli307).sbml_id.tolist()
rxn2 = get_reactions(model=model_kecoli307).sbml_id.tolist()

#%%

#sbml_kecoli74.getListOfReactions()[0].reactants[1].getSpecies()

result1 = run_time_course(model=test_model_1, duration=50)

#%%

sp_df = get_species(model=test_model_1)


#%%