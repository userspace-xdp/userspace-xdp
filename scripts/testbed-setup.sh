#!/bin/bash

set -xe

part_mac="DE:AD:BE:EF:00:"

create_bridge () {
  if ! ip link show $1 &> /dev/null; then
    brctl addbr $1
    ip link set dev $1 up
  fi
}

create_pair () {
  if ! ip link show $1 &> /dev/null; then
    ip link add name $1 type veth peer name $2
    ip link set $1 address "$part_mac""$5"
    ip addr add $3 brd + dev $1
    brctl addif $4 $2
    ip link set dev $1 up
    ip link set dev $2 up
  fi
}

create_pair_ns () {
  if ! ip link show $2 &> /dev/null; then
    ip link add name $1 type veth peer name $2
    brctl addif $4 $2
    ip link set dev $2 up

    ip netns add $5
    ip link set $1 netns $5
    ip netns exec $5 ip addr add $3 brd + dev $1
    ip netns exec $5 ip link set $1 address "$part_mac""$6"
    ip netns exec $5 ip link set dev $1 up
  fi
}

create_bridge br0

create_pair veth0 veth1 "10.0.0.1/24" br0 01

create_pair_ns veth2 veth3 "10.0.0.2/24" br0 h2 02
create_pair_ns veth4 veth5 "10.0.0.3/24" br0 h3 03

if [ -n "$1" ]; then
  # Add an extra veth for the eBPF load balancer
  echo "Add extra veth for the eBPF load balancer"
  create_pair_ns veth6 veth7 "10.0.0.10/24" br0 lb 10
fi
