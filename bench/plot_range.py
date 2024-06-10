import os
import re
import matplotlib.pyplot as plt

# Base directory and specific subdirectory to analyze
name = os.environ.get('NAME', 'katran-range')
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

def collect_data_single_directory(directory, file_pattern='range-\d+\.txt'):
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
            print(f"File: {filename}, Packet Range: {size}, Ipackets: {ipackets}")
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
            all_data[dirname] = data
            plot_data(data, dir_full_path, title='Ipackets by Packet Range in ' + root_dir + ' ' + name,
              xlabel='Packet Range (Bytes)', ylabel='Pkt/s')

collect_data(root_dir)
print(all_data)

def plot_all_data(data):
    """
    Plots the provided data in a line plot.
    
    Parameters:
    - data (dict): A dictionary where keys are dataset names and values are dictionaries of data points.
    """
    labels = ['0', '1000', '2000', '6000', '8000']
    allow_list = ['dpdk_inline', 'afxdp_inline', 'drv_mode', 'skb_mode']

    plt.figure(figsize=(7, 5))

    for key, values in data.items():
        if key not in allow_list:
            continue
        # Ensure that values are in the correct order based on labels
        sorted_values = [values.get(label, None) for label in labels]
        plt.plot(labels, sorted_values, marker='o', label=key)

    plt.xlabel('Src Port range', fontsize=18)
    plt.ylabel('Pkt/s', fontsize=18)
    plt.legend()
    plt.grid(True)
    plt.savefig('katran-range/line.png')
    
plot_all_data(all_data)
