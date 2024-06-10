#!/bin/bash

BASIC_XDP_NAME="$1"
ADDITIONAL_PARAM="$2"

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

# Function to run the primary commands
run_primary_commands() {
    # Commands to execute
    commands=(
        'make $BASIC_XDP_NAME/dpdk_llvm_jit'
        'make $BASIC_XDP_NAME/dpdk_ubpf_jit'
        'make $BASIC_XDP_NAME/dpdk_intepreter'
        'make $BASIC_XDP_NAME/drv_mode'
        'make $BASIC_XDP_NAME/skb_mode'
        'make $BASIC_XDP_NAME/afxdp_ubpf_jit'
        'make $BASIC_XDP_NAME/afxdp_llvm_jit_copy'
        'make $BASIC_XDP_NAME/afxdp_llvm_jit_zero_copy'
    )

    # Iterate over the commands array and execute each command with trap
    for cmd in "${commands[@]}"; do
        execute_with_trap "$cmd"
    done
}

# Function to run alternative commands
run_alternative_commands() {
    # Example alternative commands, modify as needed
    if [ "$BASIC_XDP_NAME" == "xdp_tx" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_tx.base.aot.o make xdp_tx/afxdp_llvm_aot'
            'mv -f xdp_tx/afxdp_llvm_aot/ xdp_tx/afxdp_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_tx.base.aot.o make xdp_tx/dpdk_llvm_aot'
            'mv -f xdp_tx/dpdk_llvm_aot/ xdp_tx/dpdk_llvm_aot_base/'            
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_tx.aot.o make xdp_tx/afxdp_llvm_aot'
            'mv -f xdp_tx/afxdp_llvm_aot/ xdp_tx/afxdp_add_type/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_tx.aot.o make xdp_tx/dpdk_llvm_aot'
            'mv -f xdp_tx/dpdk_llvm_aot/ xdp_tx/dpdk_add_type/'
        )
    fi
    if [ "$BASIC_XDP_NAME" == "xdping" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdping.base.aot.o make xdping/afxdp_llvm_aot'
            'mv -f xdping/afxdp_llvm_aot/ xdping/afxdp_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdping.base.aot.o make xdping/dpdk_llvm_aot'
            'mv -f xdping/dpdk_llvm_aot/ xdping/dpdk_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdping.aot.o make xdping/afxdp_llvm_aot'
            'mv -f xdping/afxdp_llvm_aot/ xdping/afxdp_add_type/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdping.aot.o make xdping/dpdk_llvm_aot'
            'mv -f xdping/dpdk_llvm_aot/ xdping/dpdk_add_type/'
        )
    fi
    if [ "$BASIC_XDP_NAME" == "xdp_map" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp-maps.base.aot.o make xdp_map/afxdp_llvm_aot'
            'mv -f xdp_map/afxdp_llvm_aot/ xdp_map/afxdp_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp-maps.base.aot.o make xdp_map/dpdk_llvm_aot'
            'mv -f xdp_map/dpdk_llvm_aot/ xdp_map/dpdk_llvm_aot_base/'
            # 'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp-maps.inline.aot.o make xdp_map/afxdp_llvm_aot'
            # 'mv -f xdp_map/afxdp_llvm_aot/ xdp_map/afxdp_inline_map/'
            # 'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp-maps.inline.aot.o make xdp_map/dpdk_llvm_aot'
            # 'mv -f xdp_map/dpdk_llvm_aot/ xdp_map/dpdk_inline_map/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp-maps.aot.o make xdp_map/afxdp_llvm_aot'
            'mv -f xdp_map/afxdp_llvm_aot/ xdp_map/afxdp_add_type/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp-maps.aot.o make xdp_map/dpdk_llvm_aot'
            'mv -f xdp_map/dpdk_llvm_aot/ xdp_map/dpdk_add_type/'
        )
    fi
    if [ "$BASIC_XDP_NAME" == "xdp_map_access" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_map_access.base.aot.o make xdp_map_access/afxdp_llvm_aot'
            'mv -f xdp_map_access/afxdp_llvm_aot/ xdp_map_access/afxdp_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_map_access.base.aot.o make xdp_map_access/dpdk_llvm_aot'
            'mv -f xdp_map_access/dpdk_llvm_aot/ xdp_map_access/dpdk_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_map_access.inline.aot.o make xdp_map_access/afxdp_llvm_aot'
            'mv -f xdp_map_access/afxdp_llvm_aot/ xdp_map_access/afxdp_inline_map/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_map_access.inline.aot.o make xdp_map_access/dpdk_llvm_aot'
            'mv -f xdp_map_access/dpdk_llvm_aot/ xdp_map_access/dpdk_inline_map/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_map_access.aot.o make xdp_map_access/afxdp_llvm_aot'
            'mv -f xdp_map_access/afxdp_llvm_aot/ xdp_map_access/afxdp_add_type/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_map_access.aot.o make xdp_map_access/dpdk_llvm_aot'
            'mv -f xdp_map_access/dpdk_llvm_aot/ xdp_map_access/dpdk_add_type/'
        )
    fi
    if [ "$BASIC_XDP_NAME" == "xdp_lb" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_lb.base.aot.o make xdp_lb/afxdp_llvm_aot'
            'mv -f xdp_lb/afxdp_llvm_aot/ xdp_lb/afxdp_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_lb.base.aot.o make xdp_lb/dpdk_llvm_aot'
            'mv -f xdp_lb/dpdk_llvm_aot/ xdp_lb/dpdk_llvm_aot_base/'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_lb.inline.aot.o make xdp_lb/afxdp_llvm_aot'
            'mv xdp_lb/afxdp_llvm_aot xdp_lb/afxdp_inline_optimized'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_lb.inline.aot.o make xdp_lb/dpdk_llvm_aot'
            'mv xdp_lb/dpdk_llvm_aot xdp_lb/dpdk_inline_optimized'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_lb.aot.o make xdp_lb/afxdp_llvm_aot'
            'mv xdp_lb/afxdp_llvm_aot xdp_lb/afxdp_add_type'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/xdp_progs/.output/xdp_lb.aot.o make xdp_lb/dpdk_llvm_aot'
            'mv xdp_lb/dpdk_llvm_aot xdp_lb/dpdk_add_type'
        )
    fi
    if [ "$BASIC_XDP_NAME" == "katran-size" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/katran/balancer.aot.o make katran-size/afxdp_llvm_aot'
            'mv katran-size/afxdp_llvm_aot katran-size/afxdp_add_type'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/katran/balancer.aot.o make katran-size/dpdk_llvm_aot'
            'mv katran-size/dpdk_llvm_aot katran-size/dpdk_add_type'
        )
    fi
    if [ "$BASIC_XDP_NAME" == "katran-range" ]; then
        alt_commands=(
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/katran/balancer.aot.o make katran-range/afxdp_llvm_aot'
            'mv katran-range/afxdp_llvm_aot katran-range/afxdp_add_type'
            'BASIC_XDP_AOT_RES_NAME=/home/yunwei/ebpf-xdp-dpdk/katran/balancer.aot.o make katran-range/dpdk_llvm_aot'
            'mv katran-range/dpdk_llvm_aot katran-range/dpdk_add_type'
        )
    fi
    # Iterate over the alternative commands array and execute each command with trap
    for cmd in "${alt_commands[@]}"; do
        execute_with_trap "$cmd"
    done
}

# Check if ADDITIONAL_PARAM is provided and call the corresponding function
if [ -z "$ADDITIONAL_PARAM" ]; then
    run_primary_commands
else
    run_alternative_commands
fi
