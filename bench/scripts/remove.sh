#!/bin/bash

# Extract program IDs for "xdp_dispatcher" and "xsk_def_prog"
prog_ids=$(bpftool prog list | grep -E 'xdp_dispatcher' | awk '{print $1}' | tr -d ':')

# Loop through each program ID and remove the program
for id in $prog_ids; do
    echo "Removing program with ID: $id"
    sudo bpftool prog detach id $id xdp
done

echo "All specified AF_XDP programs have been removed."