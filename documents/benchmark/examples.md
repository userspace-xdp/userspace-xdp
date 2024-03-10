# examples and test-bed

## Table of Contents

- [examples and test-bed](#examples-and-test-bed)
  - [Table of Contents](#table-of-contents)
  - [experiments1: 2 machines](#experiments1-2-machines)
    - [Testbed Configuration for NF Benchmarking](#testbed-configuration-for-nf-benchmarking)
    - [System Settings](#system-settings)
    - [Experiment Procedure](#experiment-procedure)
  - [experiments2: 3 machine](#experiments2-3-machine)
    - [Testbed Configuration](#testbed-configuration)
    - [Network Setup Details](#network-setup-details)
  - [examples list](#examples-list)
    - [1. **xdp\_drop**](#1-xdp_drop)
    - [2. **xdp\_tx**](#2-xdp_tx)
    - [3. **xdp\_map\_access**](#3-xdp_map_access)
    - [4. **xdp\_csum**](#4-xdp_csum)
    - [5. **xdping (server)**](#5-xdping-server)
    - [6. **xdp\_fw**](#6-xdp_fw)
    - [7. **tx\_ip\_tunnel**](#7-tx_ip_tunnel)
    - [8. **xdp\_adjust\_tail**](#8-xdp_adjust_tail)
    - [xdp-acl](#xdp-acl)
    - [xdp\_maps](#xdp_maps)
    - [xdp-loadbalancer](#xdp-loadbalancer)
    - [xdp-observer](#xdp-observer)
    - [xdp-firewall](#xdp-firewall)

There are 2 possible setups maybe used for running the examples:

## proposal experiments1: 2 machines

exp1: with 2 machines, one for the traffic generator and the other for the device under test (DUT).

### Testbed Configuration for NF Benchmarking

To benchmark the Network Functions (NFs), a standard testbed topology was employed, connecting a traffic generator (TG) and a device under test (DUT), with the following setup:

```txt
+--------+    +-----+    +--------+
|  DUT   |----| TOR |----|   TG   |
|   NF   |----|     |----| Pktgen |
+--------+    +-----+    +--------+
              #rx, #tx
```

- **DUT NF**: Device Under Test with Network Functionality.
- **TOR**: Top-Of-Rack switch.
- **TG Pktgen**: Traffic Generator using Pktgen software.

Both the TG and DUT are connected through the TOR switch. Packet counters are collected from the TOR at the end of each experiment to measure packet loss and throughput.

### System Settings

Maybe: Turbo Boost, Hyper-Threading, and power-saving features were disabled for optimal performance, following DPDK recommendations.

### Experiment Procedure

- The Traffic Generator (TG) replays a traffic sample (a PCAP file) in a loop at a predetermined rate for 10 seconds per experiment through the outbound cable.
- The Device Under Test (DUT) processes this incoming traffic and sends it back through the return cable, enabling the TG to measure latency.
- Packet loss at the DUT is inferred via the TOR switch, with additional checks to identify any packet loss within the TG itself.
- DPDK-Pktgen on the TG is used to determine the maximum traffic rate that results in less than 0.1% packet loss.
- Runs where loss occurred within the TG, rather than the DUT, were excluded and repeated.
- Scalability tests involve varying the number of CPU cores the NF can utilize, with 10 measurements taken per experimental condition to ensure statistical relevance.
- Error bars indicating minimum and maximum values were used to represent variability.
- All experiments accounted for NUMA considerations and indirection table rebalancing.

## proposal experiments2: 3 machine

In our network function (NF) benchmarking setup, we utilized 3 machines, 2 acting as a traffic generator and the other as the device under test (DUT).

### Testbed Configuration

The configuration is as follows:

```plaintext
+------------+          +------------+
|            |          |            |
|   Machine  |          |  Machine   |
|     1      |          |     2      |
|            |          |            |
|  MoonGen   |          |  MoonGen   |
|            |          |            |
| TX packets |---+  +---| RX packets |
+------------+   |  |   +------------+
                 |  |
                 |  |
            +------------+
            |            |
            |  Machine   |
            |     3      |
            |    DUT     |
            |  Firewall  |
            +------------+
```

- **Machine 1**: Equipped with MoonGen, generates and sends packets, collecting transmission (TX) statistics.
- **Machine 2**: Equipped with MoonGen, receives packets and collects reception (RX) statistics.
- **Machine 3 (DUT)**: The device under test, running a firewall network function.

### Network Setup Details

- Machine 1 uses MoonGen to generate packets and collect TX statistics.
- Machine 2 uses MoonGen server to receive packets and collect RX statistics.
- Machine 3, the DUT, processes the packets based on the NFs rules and forwards them to Machine 2.
- The testbed is designed to measure the throughput and efficiency of the DUT in a controlled environment with specific packet sizes and ACL rules.

## examples list

In the context of eXpress Data Path (XDP) and the Linux kernel's BPF (Berkeley Packet Filter) capabilities, each of these example applications serves to illustrate different aspects and potential uses of XDP for high-performance packet processing directly on the network driver level.

Here's a detailed description of each Linux example application:

### 1. **xdp_drop**

- **Purpose**: This program is designed to efficiently drop TCP packets directly at the XDP layer. By parsing packet headers up to the TCP layer, it identifies valid TCP packets and applies the `XDP_DROP` action, effectively filtering these packets before they reach the kernel stack.
- **Use Case**: Useful in scenarios where you want to prevent specific TCP traffic from consuming system resources or reaching user-space applications, enhancing security or performance by reducing unnecessary load.

### 2. **xdp_tx**

- **Purpose**: Implements a packet reflection mechanism by swapping the source and destination MAC addresses of incoming packets and immediately transmitting them back out on the same interface using the `XDP_TX` action.
- **Use Case**: Can be used for network testing, diagnostics, and in certain network protocols or services that require packet reflection or echoing without further processing by the network stack.

### 3. **xdp_map_access**

- **Purpose**: Demonstrates the use of XDP with BPF maps by incrementing a counter for incoming packets stored in an basic array map(`global variable in bss section`). This example shows how to track packet flow statistics directly at the XDP layer.
- **Use Case**: Useful as a building block for more complex packet processing and tracking applications.

### 4. **xdp_csum**

- **Purpose**: Calculates the checksum of IP packets and records the checksum values in a BPF_MAP_TYPE_PERCPU_ARRAY map. This example showcases how to perform checksum calculations and use per cpu maps for storage at the XDP layer.
- **Use Case**: Can be part of a larger system for monitoring data integrity, detecting packet corruption, or implementing custom routing or load balancing solutions that require checksum validation.

### 5. **xdping (server)**

- **Purpose**: Uses XDP to implement the server-side functionality of a ping (ICMP echo) service. It responds to ICMP echo requests directly from the XDP layer, minimizing latency and resource usage.
- **Use Case**: For high-performance network appliances and systems where minimizing the ICMP echo response time is critical, such as in latency-sensitive networking environments.

### 6. **xdp_fw**

- **Purpose**: Functions as a simple packet forwarding (firewall-like) mechanism by redirecting packets from one interface to another specified interface using XDP.
- **Use Case**: Suitable for creating high-speed packet filters, firewalls, or routers that require minimal processing delay and high throughput.

### 7. **tx_ip_tunnel**

- **Purpose**: The `tx_ip_tunnel` application showcases the advanced packet manipulation capabilities of XDP by parsing incoming packets up to Layer 4 (L4), encapsulating them according to a specified IP tunneling protocol, and then transmitting them out of the same or a different network interface using the `XDP_TX` action. This process involves adding an outer IP header (and possibly other headers, depending on the tunneling protocol) to each packet to route it through a tunnel to its destination.
- **Use Case**: `tx_ip_tunnel` is particularly useful in scenarios requiring high-throughput, low-latency network tunneling, such as in the creation of Virtual Private Networks (VPNs), overlay networks, or in cloud data center environments where traffic needs to be efficiently routed between different tenants or services. Its ability to quickly encapsulate packets makes it an ideal choice for network functions virtualization (NFV) infrastructure, where multiple network functions are dynamically instantiated and run as software on general-purpose hardware.

### 8. **xdp_adjust_tail**

- **Purpose**: This application demonstrates the flexibility of XDP for on-the-fly packet transformation by receiving generic packets, modifying their payload or structure to convert them into ICMP echo reply packets, and transmitting them back using `XDP_TX`. This involves adjusting the packet size (using the `bpf_xdp_adjust_tail` helper function) to make room for or remove data, and then rewriting the packet contents to match the ICMP protocol specifications.
- **Use Case**: The utility of `xdp_adjust_tail` extends to scenarios such as network diagnostics and monitoring, where generating ICMP messages in response to network events can provide immediate feedback to monitoring systems or network administrators. It can also be used in test environments to simulate network conditions or responses, or in dynamic network applications where responding to traffic with modified packets is required, such as in certain types of network-based redirection, load balancing, or security applications. This example highlights the potential of XDP for developing highly responsive and adaptive network functions capable of real-time packet processing and modification.
Each of these applications highlights the versatility and efficiency of XDP for various network functions, from basic packet filtering and forwarding to more complex operations like checksumming, packet reflection, and encapsulation, all executed with minimal overhead directly at the driver level.

more examples:

### xdp-acl

- **Purpose**: The `xdp-acl` application demonstrates the use of Longest Prefix Match (LPM) trie maps in XDP for implementing an Access Control List (ACL). This technique allows for efficient packet filtering based on IP prefixes, making it possible to quickly determine whether packets should be allowed or blocked based on their source or destination IP addresses.
- **Implementation Details**: Utilizing LPM tries, `xdp-acl` matches IP addresses against a set of predefined rules with varying prefix lengths. This is particularly efficient for hierarchical IP-based rule sets where broader network ranges can be specified alongside more specific ones. The application evaluates incoming packets against the ACL, applying the `XDP_DROP` action to packets that match deny rules, thereby preventing them from proceeding up the stack.
- **Use Case**: Ideal for high-speed network environments where rapid packet filtering based on IP addresses is required. It can serve as a foundational element for building more complex firewall solutions, edge routers, or as part of a security layer in cloud data centers and enterprise networks to enforce network segmentation and access policies.

### xdp_maps

- **Purpose**: The `xdp_maps` example showcases the use of hash maps in XDP to aggregate and summarize the length of incoming packets. This application tracks the total volume of traffic, categorized by packet attributes such as source or destination IP, directly within the XDP layer.
- **Implementation Details**: By leveraging hash maps, `xdp_maps` efficiently accumulates packet lengths for each unique identifier (e.g., IP address), allowing for real-time monitoring of network traffic volumes. The use of hash maps ensures high performance and low lookup times, crucial for maintaining throughput in high-speed networking environments.
- **Use Case**: This example is particularly useful for network monitoring and analytics, providing a mechanism for gathering detailed traffic statistics at the network's edge. It can be used in network probes, traffic analyzers, or within network appliances to offer immediate insights into traffic patterns, helping with capacity planning, anomaly detection, or network optimization efforts.

### xdp-loadbalancer

- **Purpose**: `xdp-loadbalancer` is a simple yet efficient load balancer implemented using XDP. It demonstrates how XDP can be used to distribute incoming network traffic across multiple backend servers or services, based on predefined rules or hashing algorithms.
- **Implementation Details**: This application typically operates by hashing packet headers (such as source and destination IP addresses and ports) to select a backend server. It then modifies the packet's destination IP address to that of the selected server and forwards the packet using `XDP_TX` or `XDP_REDIRECT`.
- **Use Case**: Suitable for high-performance load balancing in front of web servers, databases, or other network services where minimizing latency and maximizing throughput are critical. It offers an alternative to traditional user-space load balancers by operating at the kernel level, closer to the network hardware.

### xdp-observer

- **Purpose**: [xdp-observer](https://github.com/hamidrezakhosroabadi/xdp-observer) is a simple application designed to monitor TCP connections and visualize TCP header information in userspace. It parses TCP headers from packets captured at the XDP layer and relays this information to userspace via a ring buffer for analysis or logging.
- **Implementation Details**: Leveraging the high-performance packet processing capabilities of XDP, `xdp-observer` inspects packets for TCP header data, which it then passes to userspace through a ring buffer mechanism. This allows for minimal performance impact while providing detailed insights into TCP traffic.
- **Use Case**: Useful for developers, network administrators, and security professionals needing real-time visibility into TCP connections. It can aid in troubleshooting, network performance monitoring, or security analysis by providing a low-level view of TCP traffic patterns and behaviors.

### xdp-firewall

- **Purpose**: The [xdp-firewall](https://github.com/acassen/xdp-fw) project implements a firewall using XDP, offering a high-performance packet filtering solution that operates at the earliest possible point in the software network stack.
- **Implementation Details**: `xdp-firewall` utilizes XDP to inspect incoming packets and apply filtering rules defined by the administrator. These rules can be based on various packet attributes, such as IP addresses, port numbers, or protocol types, with actions to drop, pass, or redirect traffic according to policy.
- **Use Case**: Ideal for securing network perimeters, protecting against DDoS attacks, or enforcing network policies in environments where traditional firewall solutions may introduce unacceptable latency or throughput bottlenecks. It demonstrates the potential for building robust, kernel-level network security mechanisms with XDP.
