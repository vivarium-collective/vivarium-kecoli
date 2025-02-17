
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



    results_all = {}

    results_all['baseline'] = {}

    results_all['baseline']['result'] = result_default
    results_all['baseline']['sp_perturb'] = sp_name
    results_all['baseline']['sp_val'] = sp_ic_default

    results_all['low'] = {}
    results_all['low']['result'] = result_low
    results_all['low']['sp_perturb'] = sp_name
    results_all['low']['sp_val'] = sp_ic_default/10

    results_all['high'] = {}
    results_all['high']['result'] = result_high
    results_all['high']['sp_perturb'] = sp_name
    results_all['high']['sp_val'] = sp_ic_default*10


    return results_all