# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a research prototype for running eBPF XDP (eXpress Data Path) programs in userspace using kernel bypassing techniques (DPDK and AF_XDP). The project enables unmodified kernel XDP programs to run in userspace with superior performance.

## Build Commands

### Initial Setup
```bash
# Initialize submodules
git submodule update --init --recursive

# Set up development environment
scripts/testbed-setup.sh        # For DPDK
scripts/testbed-setup.sh ebpf   # For eBPF

# Configure hugepages for DPDK
sudo scripts/hugepages.sh
```

### Building the Project
```bash
# Build DPDK library
make dpdk

# Build all benchmark binaries (recommended)
make bench-bin

# Build example XDP programs
make -C xdp_progs

# Generate BTF file (required for some examples)
make base.btf
```

### Building Specific Configurations
```bash
# Build with LLVM backend
cmake -B build-bpftime-llvm . -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo -DBPFTIME_LLVM_JIT=1
make -C build-bpftime-llvm

# Build AF_XDP runtime with LLVM
BPFTIME_LIB_DIR=build-bpftime-llvm BPFTIME_VM_LIBRARY=-lbpftime_llvm_jit_vm make -C afxdp/l2fwd

# Build DPDK runtime with LLVM
BPFTIME_LIB_DIR=build-bpftime-llvm BPFTIME_VM_LIBRARY=-lbpftime_llvm_jit_vm PKG_CONFIG_PATH=/path/to/dpdk/pkgconfig make -C dpdk
```

### Clean Build
```bash
make bench-clean
make -C xdp_progs clean
```

## Running Tests and Examples

### Basic Workflow
1. Load eBPF program in userspace:
```bash
LD_PRELOAD=build/bpftime/runtime/syscall-server/libbpftime-syscall-server.so SPDLOG_LEVEL=debug xdp_progs/xdp-observer/main veth6 base.btf
```

2. Run with DPDK backend:
```bash
sudo dpdk/dpdk_llvm -l 1 --socket-mem=512 -a 0000:18:00.1 -- -p 0x1
```

3. Or run with AF_XDP backend:
```bash
cd afxdp/l2fwd
sudo ./xdpsock_llvm --l2fwd -i veth6
```

### Environment Setup
```bash
# Source network namespace aliases
source scripts/aliases.sh

# Common environment variables
export LD_LIBRARY_PATH=:/usr/lib64/:build/bpftime/libbpf/:afxdp/lib/xdp-tools/lib/libxdp/
```

## Architecture Overview

### Core Components

1. **bpftime**: Userspace eBPF runtime (submodule) providing JIT/AOT compilation
2. **module/**: Core XDP runtime implementation
   - `xdp-runtime.h/cpp`: Central runtime interface for packet processing
   - `helpers.c`: XDP-specific eBPF helper implementations
   - `maps.cpp`: Userspace eBPF map implementations
3. **afxdp/**: AF_XDP backend for zero-copy packet processing
4. **dpdk/**: DPDK backend for high-performance packet I/O
5. **xdp_progs/**: Example XDP programs (drop, tx, firewall, load balancer, etc.)

### Key Design Principles

- **No Modification Required**: Runs unmodified kernel XDP programs
- **Multiple Backends**: Supports both LLVM JIT and uBPF for flexibility
- **Performance Optimizations**: Inline helpers, LLVM IR optimizations, AOT compilation
- **Compatibility**: Works with existing eBPF control-plane applications

### Development Workflow

1. Write standard XDP programs in `xdp_progs/`
2. Compile with clang to eBPF bytecode
3. Load with bpftime loader (using LD_PRELOAD)
4. Run DPDK/AF_XDP runtime to process packets

### Important Files and Directories

- `module/xdp-runtime.h`: Core runtime interface
- `module/bpf_module.hpp`: eBPF module management
- `afxdp/l2fwd/`: AF_XDP layer 2 forwarding implementation
- `dpdk/dpdk_llvm.cpp`: DPDK integration with LLVM backend
- `bench/`: Performance benchmarking scripts and configurations
- `documents/`: Detailed documentation for specific use cases

### Common Development Tasks

- **Adding new XDP programs**: Place in `xdp_progs/` and follow existing examples
- **Testing optimizations**: Use AOT compilation with `AOT_OBJECT_NAME` environment variable
- **Debugging**: Set `SPDLOG_LEVEL=debug` for verbose logging
- **Performance testing**: Use scripts in `bench/` directory

### Troubleshooting

- Ensure hugepages are configured for DPDK: `sudo scripts/hugepages.sh`
- Check submodules are initialized: `git submodule update --init --recursive`
- Verify LD_LIBRARY_PATH includes all required libraries
- For AF_XDP issues, ensure kernel has XDP support and interface is up