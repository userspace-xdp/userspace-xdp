#!/bin/bash

set -xe
sudo ip netns add testns
sudo ip link add veth0 type veth peer name veth1
sudo ip link set veth1 netns testns

sudo ip addr add 192.168.1.1/24 dev veth0
sudo ip link set veth0 up

sudo ip netns exec testns ip addr add 192.168.1.2/24 dev veth1
sudo ip netns exec testns ip link set veth1 up
sudo ip netns exec testns ip link set lo up

sudo ip netns exec testns ip route add default via 192.168.1.1

