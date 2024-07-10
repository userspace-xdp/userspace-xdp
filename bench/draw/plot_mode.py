import os
import re
import matplotlib.pyplot as plt
import matplotlib.patches as mpatches

# Directory to traverse

run_seconds = 60

def parse_file(file_path):
    """
    Parse the given file to extract the 'ipackets' metric.
    """
    ipackets_pattern = re.compile(r'\["ipackets"\]\s*=\s*(\d+)')
    with open(file_path, 'r') as file:
        content = file.read()
        match = ipackets_pattern.search(content)
        if match:
            ipackets = int(match.group(1))
        else:
            ipackets = 0  # Default to 0 if not found
        ipackets = ipackets / run_seconds
    return ipackets

dir_path_list = ["afxdp_llvm", "dpdk_llvm", "drv_mode", "skb_mode"]

def collect_data(root_dir, target_file):
    """
    Traverse the directory, collect and aggregate data from target files.
    """
    data = {}
    for dirpath, _, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename == target_file:
                dir_name = os.path.basename(dirpath)
                if dir_name not in dir_path_list:
                    continue
                file_path = os.path.join(dirpath, filename)
                data[dir_name] = parse_file(file_path)
    return data

def plot_data(data, target_file, ax, colors):
    """
    Plot the collected data in a bar plot on a given axis.
    """
    # sort the data
    data = dict(sorted(data.items(), key=lambda item: item[0], reverse=True))
    labels = list(data.keys())
    values = list(data.values())

    # Create bars with assigned colors
    bars = ax.bar(labels, values, color=[colors[label] for label in labels])

    # ax.set_xlabel('Configuration', fontsize=18)  # Set font size for x-axis label
    ax.set_ylabel('Pkt/s', fontsize=25)  # Set font size for y-axis label
    ax.set_title(f'{target_file}', fontsize=45)  # Set font size for title
    ax.set_xticks([])  # Remove x-axis ticks
    ax.tick_params(axis='y', labelsize=16)  # Set font size for y-tick labels
    ax.grid(True)
    return bars

# Define a color map for the labels
color_map = {
    "afxdp_llvm": "tab:blue",
    "dpdk_llvm": "tab:orange",
    "drv_mode": "tab:green",
    "skb_mode": "tab:red"
}

# Create subplots
fig, axs = plt.subplots(1, 9, figsize=(6 * 9, 10))
index = 0
all_bars = []

# Iterate over target files and plot each in a subplot
def plot_each(name):
    global index
    root_dir = os.path.join("/home/yunwei", "ebpf-xdp-dpdk/bench/draw", name)
    target_file = 'size-64.txt'
    if name == "xdping" or name == "xdp_adjust_tail":
        target_file = 'size-256.txt'
    if name == "katran-range" or name == "katran-size":
        target_file = 'range-0.txt'

    print("root_dir: %s\n" % root_dir)
    data = collect_data(root_dir, target_file)
    # Plot the data in the corresponding subplot
    bars = plot_data(data, name, axs[index], color_map)
    all_bars.append(bars)
    index += 1

plot_each("xdp_tx")
plot_each("xdping")
plot_each("xdp_adjust_tail")
plot_each("xdp-counter")
plot_each("xdp-length")
plot_each("xdp-load-balancer")
plot_each("xdp_firewall")
plot_each("xdp-httpdump")
plot_each("katran")

# Create a legend at the bottom with colored patches
legend_labels = list(color_map.keys())
legend_colors = [color_map[label] for label in legend_labels]
legend_patches = [mpatches.Patch(color=color, label=label) for label, color in color_map.items()]

# Add legend below the last subplot
fig.legend(legend_patches, legend_labels, loc='lower center', fontsize=50, ncol=4)

save_name = 'imgs/ipackets.pdf'
plt.tight_layout(rect=[0, 0.1, 1, 1])  # Adjust layout to not cut off labels, reserving space for legend
plt.savefig(save_name)
