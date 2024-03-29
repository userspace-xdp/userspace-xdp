# AF_XDP with eBPF

## run in Afxdp Advanced 03:

** Assignment 1: Run the example program to eat all packets
First, you need to set up the test lab environment and start an infinite
ping. You do this by running the following:

```sh
eval $(../testenv/testenv.sh alias)
t setup --name veth-adv03
t ping
```

Now you can start the af_xdp_user application and see all the pings being
eaten by it:

```sh
$ sudo ./af_xdp_user -d veth-adv03
AF_XDP RX:             2 pkts (         1 pps)           0 Kbytes (     0 Mbits/s) period:2.000185
       TX:             0 pkts (         0 pps)           0 Kbytes (     0 Mbits/s) period:2.000185

AF_XDP RX:             4 pkts (         1 pps)           0 Kbytes (     0 Mbits/s) period:2.000152
       TX:             0 pkts (         0 pps)           0 Kbytes (     0 Mbits/s) period:2.000152
```
