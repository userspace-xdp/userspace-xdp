import matplotlib.pyplot as plt
import numpy as np

# Data from the tables
data_sizes = ['1K', '2K', '4K', '16K', '128K', '256K']
requests_per_sec_kernel = [5344.41, 5880.44, 5620.01, 3688.97, 1925.22, 1242.59]
requests_per_sec_userspace = [9311.06, 9528.57, 9504.57, 6473.85, 2567.10, 1657.66]
requests_per_sec_no_effect = [12302.14, 11328.92, 10883.19, 7263.48, 2869.12, 1757.73]

# Convert string data sizes to numerical values for plotting
x = np.arange(len(data_sizes))

# Create the plot
plt.figure(figsize=(10, 6))

# Plotting the data
plt.bar(x - 0.2, requests_per_sec_kernel, 0.2, label='Kernel Uprobe', color='skyblue')
plt.bar(x, requests_per_sec_userspace, 0.2, label='Userspace Uprobe by bpftime', color='orange')
plt.bar(x + 0.2, requests_per_sec_no_effect, 0.2, label='No Effect', color='lightgreen')

# Adding labels and title
plt.xlabel('Data Size')
plt.ylabel('Requests/sec')
plt.title('Performance of SSL Nginx with Different Probes')
plt.xticks(x, data_sizes)
plt.legend()

plt.savefig('ssl-nginx.png')
# Show the plot
plt.show()
