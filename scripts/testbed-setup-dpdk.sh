#!/bin/bash

set -xe

bridge=br0
inf0=veth0
inf1=veth1
inf0ip="10.1.0.1/24"
mac="DE:AD:BE:EF:7B:15"
infdpdk=tapdpdk

### Create a bridge
if ! ip link show $bridge &> /dev/null; then
	brctl addbr $bridge
	ip link set dev $bridge up
fi

### Create a veth pair
### Add the one end on the bridge and give an IP address to the other end
if ! ip link show $inf0 &> /dev/null; then
	ip link add name $inf0 type veth peer name $inf1
	ip addr add $inf0ip brd + dev $inf0
	ip link set $inf0 address $mac
	brctl addif $bridge $inf1
	ip link set dev $inf0 up
	ip link set dev $inf1 up
fi


### Attach dpdk tap to the bridge
brctl addif $bridge $infdpdk
