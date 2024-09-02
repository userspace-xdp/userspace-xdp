XDP FW: eXpress Data Path FireWall module
=========================================

This repo contains source code implementing a basic layer3 filtering
using Linux fast-path XDP design. This code is an experiment in order
to extend current Keepalvied/VRRP framework to support high-performance
filtering.

This code operate in stand-alone mode with no extra lib dependencies.
In order to make it properly working you need to use a recent toolchain.
This code has been implemented and tested on Ubuntu bionic with Ubuntu
provided kernel 4.20.3. It implements BPF object pinning in order to
manipulate filtering rules and keep them persistent.

Experiments have been made using a KVM/Qemu env. In order to get it
working following configurations has been done to Qemu conf :

	$ tail -2 /etc/libvirt/qemu.conf
	rx_queue_size = 1024
	tx_queue_size = 1024

	$ virsh edit node1
	    ...
	    <interface type='network'>
	      <mac address='52:50:00:40:30:37'/>
	      <source network='netdev'/>
	      <model type='virtio'/>
	      <driver queues='8' rx_queue_size='1024' tx_queue_size='1024'>
	        <host csum='off' gso='off' tso4='off' tso6='off' ecn='off' ufo='off' mrg_rxbuf='off'/>
	        <guest csum='off' tso4='off' tso6='off' ecn='off' ufo='off'/>
	      </driver>
	      <address type='pci' domain='0x0000' bus='0x00' slot='0x03' function='0x0'/>
	    </interface>
	    ...


# Content

2 directories are available :

	* xdp_fw   : 'Kernel' eBPF code
	* xdpfwadm : Userspace XDP/eBPF handling code


# 'Kernel' eBPF code

	$ cd xdp_fw
	$ make
	  CLANG-bpf xdp_fw.bpf
	$ ls
	Makefile  xdp_fw.bpf  xdp_fw.c  xdp_fw.ll

	try loading with iproute2 :
	$ ip link set dev ens3 xdp object xdp_fw.bpf section xdp_fw
	$ ip link show dev ens3
	2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 xdp qdisc mq state UP mode DEFAULT group default qlen 1000
	    link/ether 52:50:00:40:30:37 brd ff:ff:ff:ff:ff:ff
	    prog/xdp id 46 tag 128273917ea96a84 jited 
	$ ip link set dev ens3 xdp off


# Userspace XDP/eBPF handling code

	$ cd xdpfwadm
	$ make
	  CC main.o
	  CC bpf_standalone.o

	  Linking xdpfwadm
	$ ./xdpfwadm --help
	Usage: ./xdpfwadm [OPTION...]
	  -l, --load-bpf		Load a BPF prog
	  -u, --unload-bpf		Unload a BPF prog
	  -i, --ifindex		Net device ifindex to bind BPF prog to
	  -a, --rule-add		Add a filtering rule
	  -d, --rule-del		Delete a filtering rule
	  -L, --rule-list		Display Rules list
	  -A, --vrid-add		Add a VRRP VRID
	  -D, --vrid-del		Delete a VRRP VRID
	  -V, --vrid-list		Display VRRP VRID bitmaps
	  -h, --help			Display this help message


# Having fun

	$ ./xdpfwadm --load-bpf xdp_fw.bpf --ifindex 2
	 - Loaded bpf-map:l3_filter                      from file:/sys/fs/bpf/xdpfw_l3_filter
	$ ip link show dev ens3
	2: ens3: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 xdp qdisc mq state UP mode DEFAULT group default qlen 1000
	    link/ether 52:50:00:40:30:37 brd ff:ff:ff:ff:ff:ff
	    prog/xdp id 47 tag 128273917ea96a84 jited 
	$ ./xdpfwadm --rule-add 10.1.1.11
	$ ./xdpfwadm --rule-list
	 * [IPv4] 10.1.1.11
	$ ./xdpfwadm --rule-del 10.1.1.11
	...


Enjoy,
Alexandre

