#!/bin/bash

BASIC_XDP_NAME="$1"

# Define a function to execute commands with trap
execute_with_trap() {
    cmd=$1
    cwd=$(pwd)
    # Pass the BASIC_XDP_NAME variable explicitly to the sudo environment
    sudo bash -c "
        export BASIC_XDP_NAME='$BASIC_XDP_NAME';
        trap 'exit' INT TERM ERR
        trap 'kill 0' EXIT
        cd \"$cwd\" &&
        $cmd
    "
}

# Commands to execute
commands=(
    'make $BASIC_XDP_NAME/dpdk_llvm_jit'
    'make $BASIC_XDP_NAME/dpdk_ubpf_jit'
    'make $BASIC_XDP_NAME/dpdk_intepreter'
    'make $BASIC_XDP_NAME/drv_mode'
    'make $BASIC_XDP_NAME/skb_mode'
    # 'make $BASIC_XDP_NAME/afxdp_ubpf_jit'
    # 'make $BASIC_XDP_NAME/afxdp_llvm_jit_copy'
    # 'make $BASIC_XDP_NAME/afxdp_llvm_jit_zero_copy'
)

# Iterate over the commands array and execute each command with trap
for cmd in "${commands[@]}"; do
    execute_with_trap "$cmd"
done
