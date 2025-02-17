import os
import matplotlib.pyplot as plt
plt.rcParams['figure.dpi'] = 90


def plot_pathway(results,sp_plot,labels,output_plots):


    fig, axs = plt.subplots(nrows=1, ncols=3, figsize=(12, 4))


    for ax_idx in range(3):
        result = results[ax_idx]
        for sp in sp_plot:
            axs[ax_idx].plot(result.index, result.loc[:, sp].values, label=sp)

        axs[ax_idx].set_xlabel('Time (s)')
        axs[ax_idx].set_title(labels[ax_idx])
    axs[ax_idx].legend(loc='best')

    plt.savefig(os.path.join(output_plots,'env_perturb.png'))

