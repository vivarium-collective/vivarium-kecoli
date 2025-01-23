from vivarium.core.process import Process
from vivarium.core.engine import Engine, pp
from basico import *

import COPASI

DEFAULT_MODEL_FILE = 'SPN_1_d.cps'

def _set_initial_concentrations(changes,dm):
    model = dm.getModel()
    assert(isinstance(model, COPASI.CModel))
    
    references = COPASI.ObjectStdVector()
    
    for name, value in changes:
        species = model.getMetabolite(name)
        assert(isinstance(species, COPASI.CMetab))
        if species is None:
            print(f"Species {name} not found in model")
            continue
        species.setInitialConcentration(value)
        references.append(species.getInitialConcentrationReference())

    model.updateInitialValues(references)

def _get_transient_concentration(name, dm):
    model = dm.getModel()
    assert(isinstance(model, COPASI.CModel))
    species = model.getMetabolite(name)
    assert(isinstance(species, COPASI.CMetab))
    if species is None:
        print(f"Species {name} not found in model")
        return None
    return species.getConcentration()

class SPNcell(Process):
    defaults = {
        'model_file': DEFAULT_MODEL_FILE,
        'boundary_molecules': ['EWG', 'HH', 'PH', 'PTC'],
        'n_sides': 6,
        'time_step': 1.0,
    }

    def __init__(self, parameters=None):
        super().__init__(parameters)

        # Load the single cell model into Basico
        self.copasi_model_object = load_model(self.parameters['model_file'])
        all_species = get_species(model=self.copasi_model_object).index.tolist()
        membrane_species = [
            f'{mol_id}{side_id}' for side_id in range(1, self.parameters['n_sides'] + 1)
            for mol_id in self.parameters['boundary_molecules']]
        external_species = [
            f'{mol_id}{side_id}_ext' for side_id in range(1, self.parameters['n_sides'] + 1)
            for mol_id in self.parameters['boundary_molecules']]
        self.internal_species = [
            mol_id for mol_id in all_species if mol_id not in membrane_species + external_species]


    def ports_schema(self):
        ports = {}
        for side_id in range(1, self.parameters['n_sides'] + 1):
            membrane_species = {
                f'{mol_id}{side_id}': {
                    '_default': _get_transient_concentration(
                        name=f'{mol_id}{side_id}', dm=self.copasi_model_object),
                    '_updater': 'set',
                    '_emit': True,
                    '_output': True
                } for mol_id in self.parameters['boundary_molecules']}
            external_species = {
                f'{mol_id}{side_id}_ext': {
                    '_default': _get_transient_concentration(
                        name=f'{mol_id}{side_id}_ext', dm=self.copasi_model_object),
                    '_updater': 'set',
                    '_emit': True,
                    '_output': False,
                } for mol_id in self.parameters['boundary_molecules']}

            ports[str(side_id)] = {**membrane_species, **external_species}

        ports['internal_species'] = {
                mol_id: {
                    '_default': _get_transient_concentration(
                        name=mol_id, dm=self.copasi_model_object),
                    '_updater': 'set',
                    '_emit': True,
                    '_output': True
                } for mol_id in self.internal_species
        }
        return ports

    def next_update(self, endtime, states):

        # get the new external states (18 states) from the ports
        # and set them in the model
        changes = []
        for side_id, molecules in states.items():
            for mol_id, value in molecules.items():
                if mol_id.endswith('_ext'):
                    changes.append((mol_id, value))

        _set_initial_concentrations(changes, self.copasi_model_object)

        # run model for "endtime" length; we only want the state at the end of endtime, if we need more we can set intervals to a larger value
        timecourse = run_time_course(duration=endtime, intervals=1, update_model=True, model=self.copasi_model_object)

        # extract end values of concentrations from the model and set them in results (18 states)
        results = {}
        for side_id in range(1, self.parameters['n_sides']+1):
            mol_ids = [f'{i}{side_id}' for i in self.parameters['boundary_molecules']]
            # get these values from the copasi model
            results[str(side_id)] = {
                mol_id: _get_transient_concentration(name=mol_id, dm=self.copasi_model_object)
                for mol_id in mol_ids}

        results['internal_species'] = {
            mol_id: _get_transient_concentration(name=mol_id, dm=self.copasi_model_object)
            for mol_id in self.internal_species}

        return results


def test_spn():
    current_dir = os.path.dirname(os.path.abspath(__file__))
    model_path = os.path.join(current_dir, f"../{DEFAULT_MODEL_FILE}")
    total_time = 1000
    config = {
        'model_file': model_path,
        'boundary_molecules': ['EWG', 'HH', 'PH', 'PTC'],
        'n_sides': 6,
        'time_step': 100
    }
    spn_process = SPNcell(config)

    ports = spn_process.ports_schema()
    print('PORTS')
    print(ports)

    sim = Engine(
        processes={'spn': spn_process},
        topology={'spn': {port_id: (port_id,) for port_id in ports.keys()}}
    )

    sim.update(total_time)

    data = sim.emitter.get_timeseries()
    print('RESULTS')
    print(pp(data))


if __name__ == '__main__':
    test_spn()
