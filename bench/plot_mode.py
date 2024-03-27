import os
import re
import matplotlib.pyplot as plt

# Directory to traverse
root_dir = '/home/yunwei/ebpf-xdp-dpdk/bench/xdp_csum/'
target_file = 'size-64.txt'
save_name = 'ipackets.png'

seconds = 10

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
        ipackets = ipackets / seconds
    return ipackets

def collect_data(root_dir, target_file):
    """
    Traverse the directory, collect and aggregate data from target files.
    """
    data = {}
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for filename in filenames:
            if filename == target_file:
                dir_name = os.path.basename(dirpath)
                file_path = os.path.join(dirpath, filename)
                data[dir_name] = parse_file(file_path)
    return data

def plot_data(data):
    """
    Plot the collected data in a bar plot.
    """
    labels = list(data.keys())
    values = list(data.values())

    plt.figure(figsize=(10, 6))
    plt.bar(labels, values, color='skyblue')
    plt.xlabel('Configuration')
    plt.ylabel('Ipackets')
    plt.title('Ipackets by Configuration for size-64 in ' + root_dir)
    plt.xticks(rotation=45)
    plt.tight_layout()  # Adjust layout to not cut off labels
    plt.savefig(root_dir + save_name)

# Collect the data
data = collect_data(root_dir, target_file)
# Plot the data
plot_data(data)
