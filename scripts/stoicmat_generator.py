import numpy as np
import pandas as pd
import libsbml
import os


# Load SBML model

reader = libsbml.SBMLReader()

model = reader.readSBMLFromFile(os.path.join("models","k-ecoli74.xml")).getModel()

#%%



# Create empty stoichiometric matrix

# stoichiometric_matrix = [[0 for _ in range(model.getNumReactions())] for _ in range(model.getNumSpecies())]

species_all = [sp.getName() for sp in model.getListOfSpecies()]
rxn_all = [rxn.id for rxn in model.getListOfReactions()]

rxn_mapping = pd.DataFrame(data=np.zeros((len(species_all),len(rxn_all))), index=species_all, columns=rxn_all)



#%%

# Populate the matrix

for reaction in model.getListOfReactions():

    for reactant in reaction.getListOfReactants():

        species_name = str(model.getSpecies(reactant.species).name)
        rxn_mapping.loc[species_name,reaction.id] = -1
        # species_index = species_all.index(model.getSpecies(reactant.species).name)

        # stoichiometric_matrix[species_index][rxn_all.index(reaction.id)] -= 1
        # stoichiometric_matrix[rxn_all.index(reaction.id)][species_index] -= 1

    for product in reaction.getListOfProducts():

        species_name = str(model.getSpecies(product.species).name)
        rxn_mapping.loc[species_name,reaction.id] = 1

        # species_index = species_all.index(model.getSpecies(product.species).name)

        # stoichiometric_matrix[species_index][rxn_all.index(reaction.id)] += 1
        # stoichiometric_matrix[rxn_all.index(reaction.id)][species_index]

# stoichiometric_matrix = np.array(stoichiometric_matrix)

#%%
def rxn_mapping(sbml_model):



    return(rxn_map)