NETDEV ?= enp24s0f1np1

.PHONY: remove-xdp
remove-xdp:
	sudo ip link set dev $(NETDEV) xdp off
	sudo ip link set dev $(NETDEV) xdpgeneric off


