import re
from pathlib import Path
from collections import defaultdict

# Data structure to store the results
results = defaultdict(lambda: defaultdict(list))

# Regular expressions to match the data size, requests per second, and transfer per second
data_size_pattern = re.compile(r"/data/example(\d+)([kKmM])\.txt")
req_sec_pattern = re.compile(r"Requests/sec:\s+(\d+\.\d+)")
transfer_sec_pattern = re.compile(r"Transfer/sec:\s+(\d+\.\d+)([kKmM])B")

# Path to the directory containing the data
data_dir = Path('./')  # <-- Update this path

# Function to calculate the average of a list
def average(lst):
    return sum(lst) / len(lst) if lst else 0

def process_globs(patterns):
    # Process the files
    for file_path in data_dir.glob(patterns):
        with open(file_path, 'r') as file:
            file_content = file.read()

            # Find all matches for data size, requests/sec, and transfer/sec in the file
            for match in re.finditer(data_size_pattern, file_content):
                data_size = match.group(1) + match.group(2).upper()  # Normalize data size to upper case
                data_block = file_content[match.start():].split("\n\n")[0]  # Get block of data for this size

                # Extract and store the requests/sec and transfer/sec values
                req_sec_match = req_sec_pattern.search(data_block)
                transfer_sec_match = transfer_sec_pattern.search(data_block)
                if req_sec_match and transfer_sec_match:
                    req_sec = float(req_sec_match.group(1))
                    transfer_sec = float(transfer_sec_match.group(1))
                    transfer_unit = transfer_sec_match.group(2).upper()

                    # Normalize transfer rates to MB/sec
                    if transfer_unit == 'K':
                        transfer_sec /= 1024
                    elif transfer_unit == 'G':
                        transfer_sec *= 1024

                    results[data_size]['req_sec'].append(req_sec)
                    results[data_size]['transfer_sec'].append(transfer_sec)

    # Calculate averages and prepare the Markdown table
    markdown_table = "| Data Size | Requests/sec  | Transfer/sec  |\n|-----------|--------------|--------------|\n"
    for size in sorted(results.keys(), key=lambda s: int(s[:-1])):
        avg_req_sec = average(results[size]['req_sec'])
        avg_transfer_sec = average(results[size]['transfer_sec'])
        # markdown_table += f"| {size.ljust(9)} | {avg_req_sec:13.2f}  |\n"
        markdown_table += f"| {size.ljust(9)} | {avg_req_sec:13.2f} | {avg_transfer_sec:12.2f}MB |\n"


    print(markdown_table)

print("## SSL Nginx no effect\n")
results = defaultdict(lambda: defaultdict(list))
process_globs("no-effect-log/test-log-*.txt")

print("##kernel uprobe\n")
results = defaultdict(lambda: defaultdict(list))
process_globs("kernel-log/test-log-*.txt")

print("##userspace uprobe bpftime JIT basic\n")
results = defaultdict(lambda: defaultdict(list))
process_globs("bpftime-log/test-log-*.txt")

print("##userspace uprobe bpftime AOT basic\n")
results = defaultdict(lambda: defaultdict(list))
process_globs("basic-aot-log/test-log-*.txt")
