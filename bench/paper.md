# Running NFs in userspace

## Motivation

We have observed two main reasons to do that:

1. Write once and run everywhere NFs
2. We find that Modern eBPF XDP NFs is complex and taking long time to exec in kernel space, because of the safety requirements, the generic nature of the eBPF runtime. In a single core, the difference of average time of fetching and redirect a packet between kernel Driver with XDP, and DPDK with userspace eBPF is about 10-30ns, but it might take 100-500ns for complex NFs like firewall, load balancer to exec.
   
## Contibution

- A new system allow various kinds of eBPF XDP based NFs to run in userspace with DPDK or AF_XDP, provide full compatibility with kernel and performance better than in kernel space.
- Explore different ways to optimize userspace eBPF runtimes for NFs.

## use cases

- Pre-stack filtering / processing, Flow sampling, monitoring. 
- traffic redirects, load balancers and firewalls

## Optimize approaches and results

With these approaches, even AF_XDP in userspace can perform better than kernel XDP.

### SIMD - can work

Case: xdp_hash_sum

Calc the sum for the fist 60 bytes of the packet, and calc the xxhash value for the sum. This is a comman patern for people want to implement load-balance and need hash, and the hash code is from paper `Fast In-kernel Traffic Sketching in eBPF`.

![xdp_hash_sum](xdp_hash_sum/ipackets.png)

### Inline maps - can work

Case: xdp_map

Using BPF_MAP_TYPE_HASH to summarize the incoming packets length.

- kernel hash map is slow, we can have better performance with inline userspace hash map.
- The results is better from:
  - avoid the cost of map lookup and enabled better optimizaion from LLVM. Changing from map lookup helpers to directly access global variables.
  - using better or simpler hash algorithm
  - using lock-free hash map instead of kernel lock hash map

> Our userspace eBPF hash map implementation in shared memory is slow. (Can optimize, engineering work, but it's off topic.)

![xdp_map](xdp_map/ipackets.png)

and using array map:

![xdp_map_access](xdp_map_access/ipackets.png)

## Inline helpers



## Avoid checks

Case: xdping

(Kernel example) use xdp as ping(ICMP) server.

- Can work in cases the xdp program is short and the traffic pattern is already known.
- Since there is not running in kernel, the safety verification is not need so much.

