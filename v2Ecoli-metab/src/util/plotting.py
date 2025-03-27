
import os

import matplotlib.pyplot as plt


# ==============================================================================

def plot_pathway(results,sp_plot,labels,output_plots):
  fig, axs = plt.subplots(nrows=1, ncols=len(results), figsize=(12, 4))
  for ax_idx in range(len(results)):
    result = results[list(results.keys())[ax_idx]]['result']
    for sp in sp_plot:
      axs[ax_idx].plot(result.index, result.loc[:, sp].values, label=sp)
    axs[ax_idx].set_xlabel('Time (s)')
    axs[ax_idx].set_title(labels[ax_idx])
  axs[ax_idx].legend(loc='best')
  sp_perturb = results[list(results.keys())[ax_idx]]['sp_perturb'].replace('_e','')
  plt.savefig(os.path.join(output_plots,str(sp_perturb)+'_perturb.png'))


def plot_aa(results,labels,output_plots):
  sp_count = 0
  sp_aa = ["Ala", "Arg", "Asn", "Asp", "Cys",
           "Glu", "Gln", "Gly", "His", "Ile",
           "Leu", "Lys", "Met", "Phe", "Pro",
           "Ser", "Thr", "Trp", "Tyr", "Val"]
  colors = ['blue', 'red', 'green']
  fig, axs_aa = plt.subplots(nrows=4, ncols=5, figsize=(20, 15))
  for ax_row in range(4):
    for ax_col in range(5):
      sp = sp_aa[sp_count]
      for idx, res_dict in enumerate(results.values()):
        res = res_dict['result']
        sp_traj = res.loc[:, sp].values
        axs_aa[ax_row, ax_col].plot(
            res.index, sp_traj, label=labels[idx], color=colors[idx])
      axs_aa[ax_row, ax_col].set_xlabel('Time (s)')
      axs_aa[ax_row, ax_col].set_ylabel(sp)
      sp_count += 1
  axs_aa[ax_row, ax_col].legend(loc='best')
  plt.subplots_adjust(wspace=0.35)
  sp_perturb = results[list(results.keys())[idx]]['sp_perturb'].replace('_e', '')
  plt.savefig(os.path.join(output_plots,str(sp_perturb)+'_perturb_aa.png'))
