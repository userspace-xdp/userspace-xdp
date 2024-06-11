import os
import re
import matplotlib.pyplot as plt

# Base directory and specific subdirectory to analyze
name = os.environ.get('NAME', 'xdp_tx')
root_dir = os.path.join("/home/yunwei", "ebpf-xdp-dpdk/bench", name)

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
    data = dict(sorted(data.items(), key=lambda item: int(item[0])))
    print(f"Aggregated Data: {data}")
    return data

def plot_data(data, dirname, title='Data Plot', xlabel='X-axis', ylabel='Y-axis'):
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
    plt.savefig(dirname + '/ipackets.png')

all_data = {}
plot_list = ["skb_mode", "drv_mode", "dpdk_llvm", "afxdp_llvm_zero_copy", "afxdp_llvm_copy"]

def collect_data(root_dir):
    """
    Traverse the directory, collect and aggregate data from target files.
    """
    data = {}
    for dirpath, dirnames, filenames in os.walk(root_dir):
        for dirname in dirnames:
            dir_full_path = os.path.join(dirpath, dirname)
            print(f"Processing directory: {dir_full_path}")
            data = collect_data_single_directory(dir_full_path)
            if dirname in plot_list:
                all_data[dirname] = data
            plot_data(data, dir_full_path, title='Ipackets by Packet Size in ' + root_dir + ' ' + name,
              xlabel='Packet Size (Bytes)', ylabel='Pkt/s')

collect_data(root_dir)
print(all_data)

def plot_all_data(data):
    """
    Plots the provided data in a line plot.
    
    Parameters:
    - data (dict): A dictionary where keys are dataset names and values are dictionaries of data points.
    """
    labels = ['64', '128', '256', '512', '1024']

    plt.figure(figsize=(7, 5))

    for key, values in data.items():
        # Ensure that values are in the correct order based on labels
        sorted_values = [values.get(label, None) for label in labels]
        plt.plot(labels, sorted_values, marker='o', label=key)

    plt.xlabel('Pkt size', fontsize=18)
    plt.ylabel('Pkt/s', fontsize=18)
    plt.legend()
    plt.grid(True)
    plt.savefig(name + '/line.png')
    
plot_all_data(all_data)