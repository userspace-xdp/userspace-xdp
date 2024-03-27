#!/bin/bash

BASIC_XDP_NAME="$1"

# Define a function to execute commands with trap
execute_with_trap() {
    cmd=$1
    cwd=$(pwd)
    sudo bash -c "
        trap 'exit' INT TERM ERR
        trap 'kill 0' EXIT
        cd \"$cwd\" &&
        $cmd
    "
}

# Commands to execute
commands=(
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/afxdp_llvm_jit_copy'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/afxdp_llvm_jit_zero_copy'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/afxdp_ubpf_jit'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/dpdk_llvm_jit'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/dpdk_ubpf_jit'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/dpdk_intepreter'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/drv_mode'
    'BASIC_XDP_NAME=$BASIC_XDP_NAME make $BASIC_XDP_NAME/skb_mode'
)

# Iterate over the commands array and execute each command with trap
for cmd in "${commands[@]}"; do
    execute_with_trap "$cmd"
done
