# Benchmark Visualization Directory

This directory contains benchmark results and Python scripts for visualizing the performance comparison of different userspace XDP implementations across various test programs.

## Directory Structure

### Python Scripts

- **`plot_mode.py`** - Generates performance comparison charts across different execution modes
  - Compares: AF_XDP LLVM, DPDK LLVM, kernel driver mode, and SKB mode
  - Output: `imgs/ipackets.pdf` - Packets per second comparison

- **`plot_optimize.py`** - Visualizes optimization impact on DPDK performance
  - Compares: AOT base, BPF inline, LLVM IR, and LLVM IR with inlining
  - Output: `imgs/optimize.pdf` and `imgs/optimize.png`

### Benchmark Results

Each subdirectory contains performance test results for different XDP programs:

#### Test Programs
- **`xdp_tx/`** - Simple packet transmission (swap MAC and TX)
- **`xdping/`** - ICMP ping server implementation
- **`xdp_adjust_tail/`** - Packet size adjustment tests
- **`xdp-counter/`** - Packet counter with map access
- **`xdp-length/`** - Packet length filtering
- **`xdp-load-balancer/`** - Simple load balancer
- **`xdp_firewall/`** - Firewall with rule matching
- **`xdp-httpdump/`** - HTTP packet parser
- **`katran/`** - Facebook's Katran L4 load balancer

#### Result Organization

Each test program directory contains subdirectories for different execution modes:

- **`afxdp_llvm/`** - AF_XDP with LLVM JIT
- **`dpdk_llvm/`** - DPDK with LLVM JIT
- **`dpdk_llvm_base/`** - DPDK with AOT (Ahead-of-Time) compilation
- **`dpdk_llvm_jit/`** - DPDK with LLVM JIT (detailed results)
- **`dpdk_inline/`** - DPDK with LLVM IR and inlining optimizations
- **`dpdk_add_type/`** - DPDK with LLVM IR type information
- **`dpdk_bpf_inline/`** - DPDK with BPF-level inlining
- **`dpdk_intepreter/`** - DPDK with interpreter mode
- **`dpdk_ubpf/`** - DPDK with uBPF JIT
- **`drv_mode/`** - Kernel driver mode (native XDP)
- **`skb_mode/`** - SKB mode (generic XDP)

### Result Files

Each mode directory contains:
- **`size-*.txt`** - Performance results for different packet sizes (64, 128, 256, 512, 1024 bytes)
- **`ipackets.png`** - Per-directory performance visualization

## Data Format

Result files contain Lua-style tables with metrics:
```lua
["ipackets"] = 12345678  -- Input packets processed
["opackets"] = 12345678  -- Output packets transmitted
["ibytes"] = 789012345   -- Input bytes
["obytes"] = 789012345   -- Output bytes
```

## Usage

### Generating Visualizations

1. Ensure matplotlib is installed:
   ```bash
   pip install matplotlib
   ```

2. Run the plotting scripts:
   ```bash
   python plot_mode.py      # Compare execution modes
   python plot_optimize.py  # Compare optimization levels
   ```

### Understanding Results

- **Packets/s (Pkt/s)**: Primary performance metric showing packets processed per second
- **Execution Modes**:
  - `drv_mode`: Highest performance baseline (kernel XDP)
  - `dpdk_llvm`: DPDK with LLVM optimizations
  - `afxdp_llvm`: AF_XDP with LLVM optimizations
  - `skb_mode`: Generic XDP (lowest performance)

### Optimization Levels (DPDK)

1. **dpdk_aot_base**: Baseline AOT compilation
2. **dpdk_bpf_inline**: BPF helper function inlining
3. **dpdk_llvm_ir**: LLVM IR optimizations with type information
4. **dpdk_llvm_ir_inline**: Full LLVM IR optimizations with inlining

## Name Conversions

- `dpdk_llvm` and `dpdk_llvm_inline` represent the same configuration in different figures
- `afxdp_llvm` and `afxdp_llvm_inline` similarly represent the same AF_XDP configuration

## Adding New Benchmarks

1. Create a new directory for your XDP program
2. Run benchmarks for each execution mode
3. Store results in `size-*.txt` files following the existing format
4. Update the plotting scripts to include your new benchmark

## Notes

- Default test duration: 60 seconds (configurable in plotting scripts)
- Packet sizes tested: 64, 128, 256, 512, 1024 bytes
- Some tests (xdping, xdp_adjust_tail) use 256-byte packets as default