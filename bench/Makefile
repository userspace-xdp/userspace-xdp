NETDEV ?= enp24s0f1np1

ROOTDIR=$(shell git rev-parse --show-toplevel)

NETDEV ?= enp24s0f1np1

# commands
RUN_XDP_TX_COMMAND = $(ROOTDIR)/xdp_progs/xdp_tx $(ROOTDIR)/xdp_progs/.output/xdp_tx.bpf.o $(NETDEV)

.PHONY: remove-xdp
remove-xdp:
	sudo ip link set dev $(NETDEV) xdp off
	sudo ip link set dev $(NETDEV) xdpgeneric off

tmp-pktgen-res:
	mkdir -p ./tmp-pktgen-res
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/size-64.txt
	python3 pktgen/remote.py 128 ./tmp-pktgen-res/size-128.txt
	python3 pktgen/remote.py 256 ./tmp-pktgen-res/size-256.txt
	python3 pktgen/remote.py 512 ./tmp-pktgen-res/size-512.txt
	python3 pktgen/remote.py 1024 ./tmp-pktgen-res/size-1024.txt

xdp-tx/drv_mode:
	mkdir -p xdp_tx
	$(MAKE) remove-xdp
	# Start the process in the background
	sudo -E DRVMODE=1 $(RUN_XDP_TX_COMMAND) &
	rm -rf ./tmp-pktgen-res
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res xdp_tx/drv_mode
	pgrep -f '$(ROOTDIR)/xdp_progs/xdp_tx' | xargs kill || true


xdp-tx/skb_mode:
	mkdir -p xdp_tx
	$(MAKE) remove-xdp
	# Start the process in the background
	sudo -E SKBMODE=1 $(RUN_XDP_TX_COMMAND) &
	rm -rf ./tmp-pktgen-res
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res xdp_tx/skb_mode
	pgrep -f '$(ROOTDIR)/xdp_progs/xdp_tx' | xargs kill || true

xdp-tx/dpdk_intepreter:
	mkdir -p xdp_tx
	$(MAKE) remove-xdp
	# Start the process in the background
	