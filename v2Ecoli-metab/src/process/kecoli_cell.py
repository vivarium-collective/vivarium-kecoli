
from typing import Optional

from vivarium.core.process import Process
from vivarium.core.types import State
from basico import *

from v2Ecoli.metab.util.basico_helper import \
  _set_initial_concentrations, _get_transient_concentration
from v2Ecoli.metab.util.updater import \
  bulk_numpy_updater, get_bulk_counts, divide_bulk


custom_dtype = np.dtype([
  ('id', '<U100'),  # String (Unicode, max 100 characters)
  ('count', '<f8'),  # Float (64-bit)
  ('rRNA_submass', '<f8'),  # Float (64-bit)
  ('tRNA_submass', '<f8'),
  ('mRNA_submass', '<f8'),
  ('miscRNA_submass', '<f8'),
  ('nonspecific_RNA_submass', '<f8'),
  ('protein_submass', '<f8'),
  ('metabolite_submass', '<f8'),
  ('water_submass', '<f8'),
  ('DNA_submass', '<f8')
])


class KecoliCell(Process):
  defaults = {
    'time_step': 1.0,
    'env_perturb': ["Gluc_e"],
    'env_conc': [1.0],
  }

  def __init__(self, parameters=None):
    super().__init__(parameters)
    self.copasi_model_object = load_model(self.parameters['model_file'])
    assert self.copasi_model_object is not None

    self.all_species = get_species(
        model=self.copasi_model_object).index.tolist()
    self.ic_default = get_species(
        model=self.copasi_model_object)["initial_concentration"].values
    for sp_idx,sp_name in enumerate(self.parameters['env_perturb']):
      self.ic_default[self.all_species.index(sp_name)] = \
          self.parameters['env_conc'][sp_idx]

  def initial_state(self, config=None):
    num_species = len(self.all_species)
    # Create an empty array with default values of 0
    species_array = np.zeros(num_species, dtype=custom_dtype)
    # Fill in the 'id' and 'count' fields
    species_array['id'] = self.all_species  # Assign species names
    species_array['count'] = self.ic_default  # Assign initial counts
    return {'species':species_array }

  def ports_schema(self):
    ports = {
      'species': {
        '_default':[],
        '_updater': bulk_numpy_updater,
        '_emit': True,
        "_divider": divide_bulk
      }
    }
    return ports

  def next_update(self, endtime, states):
    species_levels = states['species'][['id', 'count']]
    _set_initial_concentrations(species_levels,self.copasi_model_object)
    timecourse = run_time_course(
      duration=endtime, intervals=1, update_model=True,
      model=self.copasi_model_object)
    results = [
      (mol_id, _get_transient_concentration(
          name=mol_id, dm=self.copasi_model_object))
      for mol_id in self.all_species]
    del_value = []
    species_levels_values = states['species']['count']

    for idx,(mol_id,value_new) in enumerate(results):
      value = species_levels_values[idx]
      del_value.append((idx,value_new - value))
    return {'species':del_value}
