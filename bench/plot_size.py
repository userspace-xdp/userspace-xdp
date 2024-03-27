import os
import re
import matplotlib.pyplot as plt

# Base directory and specific subdirectory to analyze
root_dir = '/home/yunwei/ebpf-xdp-dpdk/bench/xdp_tx'
dpdk_interpreter_dir = os.path.join(root_dir, 'afxdp_llvm_jit_copy')

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
        print(ipackets)
    return ipackets

def collect_data_single_directory(directory, file_pattern='size-\d+\.txt'):
    """
    Collect and aggregate data from files matching the file_pattern within a single directory.
    """
    data = {}
    for filename in os.listdir(directory):
        if re.match(file_pattern, filename):
            file_path = os.path.join(directory, filename)
            size = int(re.search(r'\d+', filename).group())  # Extract size from filename
            ipackets = parse_file(file_path)
            if ipackets is not None:
                data[str(size)] = ipackets
            print(f"File: {filename}, Packet Size: {size}, Ipackets: {ipackets}")
    # sort data by values
    data = dict(sorted(data.items(), key=lambda item: item[1]))
    print(f"Aggregated Data: {data}")
    return data

def plot_data(data, title='Data Plot', xlabel='X-axis', ylabel='Y-axis'):
    """
    Plot the collected data in a bar plot.
    """
    labels = list(data.keys())
    values = list(data.values())

    plt.figure(figsize=(10, 6))
    plt.bar(labels, values, color='skyblue')
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title(title)
    plt.xticks(labels, rotation=45)
    plt.tight_layout()  # Adjust layout to not cut off labels
    plt.savefig(dpdk_interpreter_dir + '/ipackets.png')

# Function to plot ipackets for all sizes in dpdk_interpreter
def plot_dpdk_interpreter():
    data = collect_data_single_directory(dpdk_interpreter_dir)
    plot_data(data, title='Ipackets by Packet Size',
              xlabel='Packet Size (Bytes)', ylabel='Ipackets')

plot_dpdk_interpreter()
