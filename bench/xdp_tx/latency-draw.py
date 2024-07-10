# import json
# import matplotlib.pyplot as plt
# import numpy as np

# # Reading the JSON data
# with open('/home/yunwei/ebpf-xdp-dpdk/bench/xdp_tx/latency.json', 'r') as file:
#     data = json.load(file)

# # Extracting the data
# labels = list(data.keys())
# nbPkts = [data[label]['nbPkts'] for label in labels]
# minCycles = [data[label]['minCycles'] for label in labels]
# avgCycles = [data[label]['avgCycles'] for label in labels]
# maxCycles = [data[label]['maxCycles'] for label in labels]
# min_us = [data[label]['min_us'] for label in labels]
# avg_us = [data[label]['avg_us'] for label in labels]
# max_us = [data[label]['max_us'] for label in labels]

# # Bar width
# bar_width = 0.2

# # Bar positions
# r1 = np.arange(len(labels))
# r2 = [x + bar_width for x in r1]
# r3 = [x + bar_width for x in r2]

# # Plotting the data
# fig, ax = plt.subplots(figsize=(12, 8))

# # Creating bars
# ax.bar(r1, min_us, color='b', width=bar_width, edgecolor='grey', label='min_us')
# ax.bar(r2, avg_us, color='g', width=bar_width, edgecolor='grey', label='avg_us')
# ax.bar(r3, max_us, color='r', width=bar_width, edgecolor='grey', label='max_us')

# # Adding xticks
# ax.set_xlabel('Modes', fontweight='bold')
# ax.set_ylabel('Latency (us)', fontweight='bold')
# # ax.set_title('Latency Comparison')
# ax.set_xticks([r + bar_width for r in range(len(labels))])
# ax.set_xticklabels(labels)

# # Adding legend
# ax.legend()

# # Display the plot
# plt.savefig('latency.png')

import json
import matplotlib.pyplot as plt
import numpy as np

# Reading the JSON data
with open('latency.json', 'r') as file:
    data = json.load(file)

# Extracting the data
labels = list(data.keys())
avg_us = [data[label]['avg_us'] for label in labels]

# Colors for each configuration
colors = ['b', 'g', 'r', 'orange']

# Plotting the data
fig, ax = plt.subplots(figsize=(6, 3))

# Creating bars
ax.bar(labels, avg_us, color=colors, width=0.6, edgecolor='grey')

# Adding labels and title
ax.set_xlabel('Configurations', fontsize=14)
ax.set_ylabel('Average Latency (us)', fontsize=14)
# ax.set_title('Latency Comparison')

# Display the plot
plt.tight_layout()
plt.savefig('latency_comparison.pdf')

