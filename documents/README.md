# Documents Directory

This directory contains technical documentation, benchmarking results, and research notes for the Userspace XDP project. The documentation covers various aspects of running eBPF XDP programs in userspace using DPDK and AF_XDP.

## Directory Structure

### Core Documentation

- **`userspace-xdp-lb.md`** - Implementation guide for XDP load balancer in userspace
- **`venv-details.md`** - Test environment setup and virtual network configuration
- **`katran.md`** - Guide for running Facebook's Katran L4 load balancer in userspace
- **`katran-bench.md`** - Performance benchmarking results for Katran in userspace

### Benchmark Results (`benchmark/`)

- **`basic_bench_res.md`** - Basic performance benchmarking results
- **`new_basic_bench_res.md`** - Updated benchmark results with optimizations
- **`basic_bench_res_xdp_gen.md`** - Benchmarks using XDP traffic generator
- **`examples.md`** - Performance results for various XDP example programs
- **`pktgen-dpdk.md`** - DPDK packet generator setup and usage
- **`moongen.md`** - MoonGen packet generator configuration

### Research & Development

- **`simd-poc/`** - SIMD (Single Instruction, Multiple Data) proof-of-concept
  - Contains experiments with vectorized packet processing
  - Includes LLVM IR analysis and assembly output
  - See `simd-poc/README.md` for details

- **`old-documents/`** - Historical documentation and early experiments
  - Early AF_XDP and DPDK integration notes
  - Optimization experiments and debug records

### Supporting Files

- **`katran/`** - Katran-specific artifacts
  - Compiled BPF objects
  - Performance flamegraphs
  - Configuration files

- **`pktgen-dpdk/`** - DPDK packet generator patches and configuration

## Key Topics Covered

1. **Performance Benchmarking**
   - Comparison between kernel XDP, DPDK, and AF_XDP backends
   - Throughput and latency measurements
   - CPU usage analysis

2. **Real-World Applications**
   - Katran L4 load balancer integration
   - XDP-based load balancing implementations
   - Firewall and packet filtering examples

3. **Optimization Techniques**
   - LLVM IR optimizations
   - SIMD vectorization experiments
   - JIT compilation strategies

4. **Test Environment Setup**
   - Virtual network configurations
   - Traffic generation tools
   - Benchmarking methodologies

## Getting Started

For new users, we recommend reading in this order:
1. `venv-details.md` - Understanding the test environment
2. `benchmark/basic_bench_res.md` - Basic performance characteristics
3. `userspace-xdp-lb.md` - Example implementation walkthrough
4. `katran.md` - Advanced real-world application

## Prerequisites

Understanding these documents requires familiarity with:
- eBPF and XDP programming
- DPDK and AF_XDP networking
- Linux network stack
- Performance benchmarking concepts

## Contributing

When adding new documentation:
- Place benchmark results in the `benchmark/` subdirectory
- Include configuration details and reproduction steps
- Add performance graphs and analysis where applicable
- Update this README with new document descriptions