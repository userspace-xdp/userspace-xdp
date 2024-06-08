import os
import re
import matplotlib.pyplot as plt

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

def plot_data(data, target_file, ax):
    """
    Plot the collected data in a bar plot on a given axis.
    """
    # sort the data
    data = dict(sorted(data.items(), key=lambda item: item[0], reverse=True))
    labels = list(data.keys())
    values = list(data.values())

    ax.bar(labels, values, color='skyblue')
    # ax.set_xlabel('Configuration', fontsize=18)  # Set font size for x-axis label
    ax.set_ylabel('Pkt/s', fontsize=18)  # Set font size for y-axis label
    ax.set_title(f'{target_file}', fontsize=20)  # Set font size for title
    ax.set_xticks(range(len(labels)))  # Set the positions of the ticks
    ax.set_xticklabels(labels, rotation=45, fontsize=16)  # Set font size for x-tick labels
    ax.tick_params(axis='y', labelsize=16)  # Set font size for y-tick labels
    ax.grid(True)

# Create subplots
fig, axs = plt.subplots(1, 7, figsize=(6 * 7, 10))
index = 0
# Iterate over target files and plot each in a subplot
for name in os.listdir("/home/yunwei/ebpf-xdp-dpdk/bench/simple-NFs"):
    if name == "plot_mode.py" or name == "ipackets.png":
        continue
    # Collect the data
    root_dir = os.path.join("/home/yunwei", "ebpf-xdp-dpdk/bench/simple-NFs", name)
    target_file = 'size-64.txt'
    if name == "xdping" or name == "xdp_adjust_tail":
        target_file = 'size-256.txt'
    if name == "katran-range" or name == "katran-size":
        target_file = 'range-0.txt'

    print("root_dir: %s\n" % root_dir)
    data = collect_data(root_dir, target_file)
    # Plot the data in the corresponding subplot
    plot_data(data, name, axs[index])
    index += 1

save_name = 'ipackets.png'
plt.tight_layout()  # Adjust layout to not cut off labels
plt.savefig(save_name)
