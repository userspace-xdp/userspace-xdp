# optimizations

## The tools for optimizations

## Install deps

```sh
python3 -m venv xdp_progs/tools/venv
source xdp_progs/tools/venv/bin/activate
pip3 install -r xdp_progs/tools/requirements.txt
```

## Inline the LLVM IR

```sh
llvm-link -S -o a.ll xdp_progs/tools/helpers_ir/inline_hash_map.ll /home/yunwei37/userspace-xdp/xdp_progs/.llvm_ir/xdp_lb.bpf.ll
```

## UXCC

`uxcc` is a drop-in replacement for `clang` in the eBPF compilation toolchain. It first generates unoptimized LLVM IR using `clang`, then applies optimizations to produce efficient eBPF bytecode. The tool ensures correct stack layout and helper name mangling, making the bytecode suitable for bpftime runtime.

`uxcc` packages the optimized eBPF bytecode and LLVM IR into a single signed ELF file, ensuring secure distribution and deployment.



### Package and extract the LLVM IR from elf file

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
