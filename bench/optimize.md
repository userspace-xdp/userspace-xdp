# Optimize levels in bpftime

By default, all userspace eBPF runtime or applications are compiled with `-O3` optimization level, and `LTO` is enabled. We found that ubpf may be error-prone when compiled with `LTO` enabled, so some of the data points may be missing.

Accroding to previous test(mannually, see the documents for the numbers), LTO can greatly improve the performance of the eBPF runtime and DPDK, afxdp.

## LLVM JIT

The baseline configuration for LLVM based JIT.

- Generated LLVM IR from eBPF bytecode. We don't add type information to the IR at this level, so some constraints amybe missing, such as the type of the function, loop bounds, pointer layout, etc.
- Optimized with `-O3` level in the JIT compiled.
- load with the same linker as the AOT runtime.

See https://github.com/eunomia-bpf/bpftime/tree/master/vm/llvm-jit

## ubpf JIT

The baseline configuration for ubpf JIT.

This is a port of ubpf JIT in bpftime.

- Generated Native insts from eBPF bytecode.
- No additional optimization is applied.
- The compile process is faster.

See https://github.com/eunomia-bpf/bpftime/tree/master/vm/simple-jit

## LLVM AOT

bpftime AOT engine can compile the LLVM IR from the eBPF bytecode to a `.o` file, or directly load and check a precompiled native object file as the AOT results. It can help us explore better optimization approaches.

The linker(Which help load AOT programs into the runtime) checks:

- The type of the functions and helpers are correct.
- The stack and maps layout are correct.
- All necessary helpers are available in the runtime.

A typical workflow for the AOT process would be:

- The eBPF application create all maps, eBPF prorgams and define which helper set to use. This information is stored in shared memory.
- The relocation of map id or BTF will be performed by the eBPF application with the help of the runtime.
- The verifier checks the eBPF programs, maps, and helpers.
- The AOT compiler `#1` compiles the verified eBPF programs to LLVM IR and Native code, or `#2` based on the type information from the source code, we do some additional process in AST level from the source code with our tools, and compile them to LLVM IR and Native code.
- The AOTed object file is loaded by the runtime with the build-in linker, and can be executed by the runtime as other eBPF programs.

The AOT process will do:

- Compile with `-O3 -fno-stack-protector` and make sure the stack layout is correct.
- Replace the entrance of the eBPF program with function name `bpf_main`.
- All the helpers


