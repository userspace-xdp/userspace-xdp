#!/bin/bash
# sudo systemctl stop irqbalance
# sudo systemctl disable irqbalance
# sudo ethtool --offload enp24s0f1np1  lro off
# sudo ethtool --offload enp24s0f1np1  gro off
# /proc/sys/net/core/rps_sock_flow_entries 0 # not related, increase will make it worse
#

sudo ethtool -c enp24s0f1np1
sudo ethtool -C enp24s0f1np1 rx-usecs 0
sudo ethtool -C enp24s0f1np1 rx-frames 0
sudo ethtool -C enp24s0f1np1 tx-usecs 0
sudo ethtool -C enp24s0f1np1 tx-frames 0
sudo ethtool -C enp24s0f1np1 adaptive-rx off adaptive-tx off
sudo ethtool -L enp24s0f1np1 combined 1
sudo sh -c 'FREQ=3400000 && for i in /sys/devices/system/cpu/cpu[0-9]*; do echo performance > $i/cpufreq/scaling_governor; echo $FREQ > $i/cpufreq/scaling_setspeed; done'
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_governors