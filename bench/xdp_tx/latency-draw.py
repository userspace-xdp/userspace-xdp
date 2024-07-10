import json
import matplotlib.pyplot as plt
import numpy as np

# Reading the JSON data
with open('latency.json', 'r') as file:
    data = json.load(file)

# Extracting the data
labels = list(data.keys())
avg_us = [data[label]['min_us'] for label in labels]

# Colors for each configuration
colors = ['b', 'g', 'r', 'orange']

# Plotting the data
fig, ax = plt.subplots(figsize=(6, 1.5))

# Creating horizontal bars
ax.barh(labels, avg_us, color=colors, edgecolor='grey')

# Adding labels and title
ax.set_ylabel('Configurations', fontsize=10)
ax.set_xlabel('Min Latency (us)', fontsize=10)

# Display the plot
plt.tight_layout()
plt.savefig('latency_comparison.pdf')
