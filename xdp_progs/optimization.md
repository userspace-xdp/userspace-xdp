# optimizations

The tools for optimizations can be found in:

- [tools](tools): python scripts for optimizations
- [aot-header](aot-header): C header and python scripts for AOT build

## Install deps

```sh
python3 -m venv xdp_progs/tools/venv
source xdp_progs/tools/venv/bin/activate
pip3 install -r xdp_progs/tools/requirements.txt
```

## Inline the LLVM IR

First, you need to generate the LLVM IR and JSON definition of maps in bpftime.

For example, in the bpftime project:

```sh
# load the eBPF program with bpftime
LD_PRELOAD=build/runtime/syscall-server/libbpftime-syscall-server.so example/xdp-counter/xdp-counter example/xdp-counter/.output/xdp-counter.bpf.o veth1
# dump the map and eBPF bytecode define
./build/tools/bpftimetool/bpftimetool export res.json
# build the eBPF program into llvm IR
./build/tools/aot/bpftime-aot compile --emit_llvm 1>xdp-counter.ll
```

Then, we use the `UXOPT` tool to inline the helper and map defines:

```sh
python3 xdp_progs/tools/uxopt.py xdp-counter.ll export res.json -o xdp-counter.inline.ll
```

## UXCC

`uxcc` is a drop-in replacement for `clang` in the eBPF compilation toolchain. It first generates unoptimized LLVM IR using `clang`, then applies optimizations to produce efficient eBPF bytecode. The tool ensures correct stack layout and helper name mangling, making the bytecode suitable for bpftime runtime.

`uxcc` packages the optimized eBPF bytecode and LLVM IR into a single signed ELF file, ensuring secure distribution and deployment.

```sh
python3 xdp_progs/tools/uxcc.py -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O2 -target bpf -g lib/bpf/balancer.bpf.c -c -o balancer.bpf.o
```

When deployed, You can use `package.py` to extract the content and optimize with `uxopt`.

### Extract the LLVM IR from elf file

The `package.py` script is a custom tool designed to package and extract files within ELF binaries, primarily for the purpose of embedding auxiliary data (such as LLVM IR or metadata) into eBPF-related ELF files. The script supports two main operations:

- **Package**: This command allows you to embed a file into an existing ELF binary. The file content is appended to the ELF file along with a cryptographic signature and metadata, ensuring the integrity and authenticity of the embedded data.
- **Extract**: This command verifies the embedded data within an ELF file, checking the integrity against the stored signature. If the verification is successful, the script extracts the embedded file back to the file system.

Example:

```sh
# package
python3 xdp_progs/tools/package.py package xdp_progs/.llvm_ir/xdp_adjust_tail.aot.ll xdp_progs/.output/xdp_adjust_tail.bpf.o
# extract
python3 xdp_progs/tools/package.py extract xdp_progs/.output/xdp_adjust_tail.bpf.o
```
