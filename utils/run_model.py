
import basico


def perturb_env(model_name,sp_name):

    sp_all = basico.get_species(model=model_name).index.to_list()
    IC_all = basico.get_species(model=model_name)["initial_concentration"].values

    sp_idx = sp_all.index(sp_name)

    sp_ic_default = IC_all[sp_idx]

    result_default = basico.run_time_course(model=model_name,duration=300)

    basico.set_species(model=model_name, name=sp_name, initial_concentration=sp_ic_default / 10)

    result_low = basico.run_time_course(model=model_name, duration=300)

    basico.set_species(model=model_name, name=sp_name, initial_concentration=sp_ic_default*10)

    result_high = basico.run_time_course(model=model_name, duration=300)

    basico.set_species(model=model_name, name=sp_name, initial_concentration=sp_ic_default)

    results_all = [result_default, result_low, result_high]

    return results_all