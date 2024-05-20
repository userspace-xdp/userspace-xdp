NETDEV ?= enp24s0f1np1

ROOTDIR=$(shell git rev-parse --show-toplevel)
BPFTIME_DIR_UBPF=$(ROOTDIR)/build-bpftime-ubpf/
BPFTIME_DIR_LLVM=$(ROOTDIR)/build-bpftime-llvm/
DPDK_DIR=$(ROOTDIR)/external/dpdk
LIBXDP_PATH=$(ROOTDIR)/afxdp/lib/xdp-tools/lib/libxdp
NETDEV ?= enp24s0f1np1
IFINDEX = $(shell ip link show $(NETDEV) | awk '{print $1}' | grep -oE '^[0-9]+')

.PHONY: remove-xdp
remove-xdp:
	sudo ip link set dev $(NETDEV) xdp off
	sudo ip link set dev $(NETDEV) xdpgeneric off

TRAFFICGEN ?= remote64to1024tcp

.PHONY: remote64to1024tcp
remote64to1024tcp:
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/size-64.txt tcp 0
	python3 pktgen/remote.py 128 ./tmp-pktgen-res/size-128.txt tcp 0
	python3 pktgen/remote.py 256 ./tmp-pktgen-res/size-256.txt tcp 0
	python3 pktgen/remote.py 512 ./tmp-pktgen-res/size-512.txt tcp 0
	python3 pktgen/remote.py 1024 ./tmp-pktgen-res/size-1024.txt tcp 0

.PHONY: remote64tcp
remote64tcp:
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/size-64.txt tcp 0

.PHONY: remote256icmp
remote256icmp:
	python3 pktgen/remote.py 256 ./tmp-pktgen-res/size-256.txt icmp 0

.PHONY: remote64range
remote64range:
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/range-0.txt range_tcp 0
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/range-1000.txt range_tcp 1000
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/range-2000.txt range_tcp 2000
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/range-6000.txt range_tcp 6000
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/range-8000.txt range_tcp 8000
	python3 pktgen/remote.py 64 ./tmp-pktgen-res/range-8000.txt range_tcp 16000

tmp-pktgen-res:
	mkdir -p ./tmp-pktgen-res
	$(MAKE) $(TRAFFICGEN)

################################################################################################
BASIC_XDP_NAME ?= xdp_tx
RUN_XDP_BASIC_COMMAND ?= $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) $(ROOTDIR)/xdp_progs/.output/$(BASIC_XDP_NAME).bpf.o $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND ?= DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND ?= SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND ?= $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
ifeq ($(BASIC_XDP_NAME),xdp_tx)
else ifeq ($(BASIC_XDP_NAME),xdp_map_access)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) -N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) -S
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = $(ROOTDIR)/xdp_progs/.output/xdp_map_access.aot.o
else ifeq ($(BASIC_XDP_NAME),xdp_hash_sum)
RURUN_XDP_BASIC_COMMAND ?= $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) $(ROOTDIR)/xdp_progs/.output/$(BASIC_XDP_NAME).bpf.o $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND ?= DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND ?= SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND ?= $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = $(ROOTDIR)/xdp_progs/.output/xdp_hash_sum.aot.o
else ifeq ($(BASIC_XDP_NAME),xdp_map)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp-maps/target/release/xdp $(IFINDEX)
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) S
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_KERNEL_SKB_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME ?= $(ROOTDIR)/xdp_progs/.output/xdp_map.aot.o
TRAFFICGEN = remote64tcp
else ifeq ($(BASIC_XDP_NAME),xdp_csum)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) -N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) -S
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = $(ROOTDIR)/xdp_progs/.output/xdp_csum.aot.o
else ifeq ($(BASIC_XDP_NAME),xdp_csum_only)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) -N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) -S
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME ?= $(ROOTDIR)/xdp_progs/.output/xdp_csum_only.inline.aot.o
else ifeq ($(BASIC_XDP_NAME),xdping)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) -s -I  $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) -N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) -S
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = .
TRAFFICGEN = remote256icmp
else ifeq ($(BASIC_XDP_NAME),xdping_no_check)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) -s -I  $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) -N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) -S
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = .
TRAFFICGEN = remote256icmp
else ifeq ($(BASIC_XDP_NAME),xdp_lb)
RUN_XDP_BASIC_COMMAND = BASIC_TEST_BENCH_CONFIG=1 $(ROOTDIR)/xdp-ebpf-new/xdp_lb $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = DRV_MODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND = SKB_MODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = .
else ifeq ($(BASIC_XDP_NAME),xdp_adjust_tail)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME) -i $(NETDEV) -P 128
RUN_XDP_KERNEL_DRV_COMMAND = $(RUN_XDP_BASIC_COMMAND) -N
RUN_XDP_KERNEL_SKB_COMMAND = $(RUN_XDP_BASIC_COMMAND) -S
RUN_XDP_USERSPACE_COMMAND = CUSTOM_BTF_PATH=$(ROOTDIR)/xdp-ebpf-new/base.btf $(RUN_XDP_BASIC_COMMAND)
BASIC_XDP_AOT_RES_NAME = .
TRAFFICGEN = remote256icmp
else ifeq ($(BASIC_XDP_NAME),xdp_firewall)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp-firewall/xdp_firewall $(ROOTDIR)/xdp-firewall/.output/xdp_firewall.bpf.o $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND ?= DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND ?= SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
BASIC_XDP_AOT_RES_NAME = $(ROOTDIR)/xdp-firewall/.output/xdp_firewall.aot.o
TRAFFICGEN = remote64to1024tcp
else ifeq ($(BASIC_XDP_NAME),xdp-observer)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp-observer/main $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND = SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
TRAFFICGEN = remote64tcp
else ifeq ($(BASIC_XDP_NAME),xdp-tcpclassify)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp-tcpclassify/main $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND = SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND = $(RUN_XDP_BASIC_COMMAND) $(ROOTDIR)/xdp-ebpf-new/base.btf
TRAFFICGEN = remote64tcp
BASIC_XDP_AOT_RES_NAME = $(ROOTDIR)/xdp_progs/.output/tcpclassify.aot.o
else ifeq ($(BASIC_XDP_NAME),katran-range)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/xdp_tx /home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer.bpf.o $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND = SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND = BPFTIME_ALLOW_EXTERNAL_MAPS=true $(ROOTDIR)/xdp_progs/xdp_tx \
	/home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer_user.bpf.o $(NETDEV)
TRAFFICGEN = remote64range
else ifeq ($(BASIC_XDP_NAME),katran-size)
RUN_XDP_BASIC_COMMAND = $(ROOTDIR)/xdp_progs/xdp_tx /home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer.bpf.o $(NETDEV)
RUN_XDP_KERNEL_DRV_COMMAND = DRVMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_KERNEL_SKB_COMMAND = SKBMODE=1 $(RUN_XDP_BASIC_COMMAND)
RUN_XDP_USERSPACE_COMMAND = BPFTIME_ALLOW_EXTERNAL_MAPS=true $(ROOTDIR)/xdp_progs/xdp_tx \
	/home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer_user.bpf.o $(NETDEV)
TRAFFICGEN = remote64to1024tcp
else
$(error Unsupported BASIC_XDP_NAME $(BASIC_XDP_NAME))
endif

################################################################################################

$(BASIC_XDP_NAME):
	mkdir -p $(BASIC_XDP_NAME)

.PHONY: all_kernel_test
all_kernel_test: $(BASIC_XDP_NAME)/drv_mode $(BASIC_XDP_NAME)/skb_mode

.PHONY: all_dpdk_test
all_dpdk_test: 
	$(MAKE) $(BASIC_XDP_NAME)/dpdk_intepreter || true
	$(MAKE) $(BASIC_XDP_NAME)/dpdk_ubpf_jit || true
	$(MAKE) $(BASIC_XDP_NAME)/dpdk_llvm_jit || true

.PHONY: all_afxdp_test
all_afxdp_test:
	$(MAKE) $(BASIC_XDP_NAME)/afxdp_llvm_jit_zero_copy || true
	$(BASIC_XDP_NAME)/afxdp_llvm_jit_copy || true
	$(BASIC_XDP_NAME)/afxdp_ubpf_jit || true

$(BASIC_XDP_NAME)/drv_mode: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	sudo -E $(RUN_XDP_KERNEL_DRV_COMMAND) &
	rm -rf ./tmp-pktgen-res
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/drv_mode
	sudo pgrep -f '$(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME)' | xargs kill || true

# $(KATRAN_XDP_NAME)/katran_kernel: $(KATRAN_XDP_NAME)
# 	$(MAKE) remove-xdp
# 	# Start the process in the background
# 	sudo /home/yunwei/katran/_build/build/example_grpc/katran_server_grpc\
# 		-balancer_prog \
# 		/home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer.bpf.o\
# 		-default_mac b8:3f:d2:2a:e5:11 -forwarding_cores=0 \
# 		-intf=$(NETDEV) -hc_forwarding=false &
# 	/home/yunwei/katran/example_grpc/goclient/bin/main \
# 						   -A -t 192.168.1.13:5678
# 	/home/yunwei/katran/example_grpc/goclient/bin/main \
# 						   -a -t 192.168.1.13:5678 -r 192.168.1.11
# 	rm -rf ./tmp-pktgen-res
# 	$(MAKE) tmp-pktgen-res
# 	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/katran_kernel
# 	sudo pgrep -f 'katran_server_grpc' | xargs kill || true

$(BASIC_XDP_NAME)/skb_mode: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	sudo -E $(RUN_XDP_KERNEL_SKB_COMMAND) &
	rm -rf ./tmp-pktgen-res
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/skb_mode
	sudo pgrep -f '$(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME)' | xargs kill || true

$(BASIC_XDP_NAME)/dpdk_intepreter: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_UBPF)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	sleep 2
	sudo -E LD_LIBRARY_PATH=$(DPDK_DIR)/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:$(BPFTIME_DIR_UBPF)/bpftime/libbpf/:$(LIBXDP_PATH):$(BPFTIME_DIR_UBPF)/bpftime/libbpf/libbpf \
	DISABLE_JIT=1 \
	$(ROOTDIR)/dpdk_l2fwd/dpdk_l2fwd_ubpf \
	-l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1 &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/dpdk_intepreter
	pgrep -f '$(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'dpdk_l2fwd_ubpf' | xargs kill || true

$(BASIC_XDP_NAME)/dpdk_ubpf_jit: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_UBPF)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	sleep 2
	sudo -E LD_LIBRARY_PATH=$(DPDK_DIR)/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:$(BPFTIME_DIR_UBPF)/bpftime/libbpf/:$(LIBXDP_PATH):$(BPFTIME_DIR_UBPF)/bpftime/libbpf/libbpf \
	$(ROOTDIR)/dpdk_l2fwd/dpdk_l2fwd_ubpf \
	-l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1 &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/dpdk_ubpf_jit
	pgrep -f '$(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'dpdk_l2fwd_ubpf' | xargs kill || true
	sudo pgrep -f 'dpdk_l2fwd_ubpf' | xargs kill || true

$(BASIC_XDP_NAME)/dpdk_llvm_jit: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_LLVM)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	sleep 2
	sudo -E LD_LIBRARY_PATH=$(DPDK_DIR)/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:$(BPFTIME_DIR_LLVM)/bpftime/libbpf/:$(LIBXDP_PATH):$(BPFTIME_DIR_LLVM)/bpftime/libbpf/libbpf \
	$(ROOTDIR)/dpdk_l2fwd/dpdk_l2fwd_llvm \
	-l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1 &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/dpdk_llvm_jit
	pgrep -f '$(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'dpdk_l2fwd_llvm' | xargs kill -9 || true
	sudo pgrep -f 'dpdk_l2fwd_llvm' | xargs kill -9  || true

$(BASIC_XDP_NAME)/dpdk_llvm_aot: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_LLVM)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	sudo -E LD_LIBRARY_PATH=$(DPDK_DIR)/install-dir/lib/x86_64-linux-gnu/:/usr/lib64/:$(BPFTIME_DIR_LLVM)/bpftime/libbpf/:$(LIBXDP_PATH):$(BPFTIME_DIR_LLVM)/bpftime/libbpf/libbpf \
	AOT_OBJECT_NAME=$(BASIC_XDP_AOT_RES_NAME) \
	$(ROOTDIR)/dpdk_l2fwd/dpdk_l2fwd_llvm \
	-l 1  --socket-mem=512 -a 0000:18:00.1 -- -p 0x1 &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/dpdk_llvm_aot
	pgrep -f '$(ROOTDIR)/xdp_progs/$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'dpdk_l2fwd_llvm' | xargs kill -9 || true
	sudo pgrep -f 'dpdk_l2fwd_llvm' | xargs kill -9  || true

$(BASIC_XDP_NAME)/afxdp_llvm_jit_zero_copy: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_LLVM)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	cd $(ROOTDIR)/afxdp/l2fwd && sudo ./xdpsock_llvm --l2fwd -i enp24s0f1np1 -z &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/afxdp_llvm_jit_zero_copy
	# sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9 || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9 || true

$(BASIC_XDP_NAME)/afxdp_llvm_aot: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_LLVM)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	cd $(ROOTDIR)/afxdp/l2fwd && \
	sudo -E AOT_OBJECT_NAME=$(BASIC_XDP_AOT_RES_NAME) \
	./xdpsock_llvm --l2fwd -i enp24s0f1np1 -z &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/afxdp_llvm_aot
	# sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9 || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9 || true

$(BASIC_XDP_NAME)/afxdp_llvm_jit_copy: $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_LLVM)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	cd $(ROOTDIR)/afxdp/l2fwd && sudo ./xdpsock_llvm --l2fwd -i enp24s0f1np1 -c &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/afxdp_llvm_jit_copy
	# sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9  || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9  || true

$(BASIC_XDP_NAME)/afxdp_ubpf_jit: $(BASIC_XDP_NAME)
	mkdir -p $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_UBPF)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	cd $(ROOTDIR)/afxdp/l2fwd && sudo ./xdpsock_ubpf --l2fwd -i enp24s0f1np1 -z &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/afxdp_ubpf_jit
	# sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'xdpsock_ubpf' | xargs kill -9 || true
	sudo pgrep -f 'xdpsock_ubpf' | xargs kill -9 || true

.PHONY: plot_all_config
plot_all_config:
	NAME=xdp_map_access python3 plot_mode.py
	NAME=xdp_map_access_no_lto python3 plot_mode.py
	NAME=xdp_csum python3 plot_mode.py
	NAME=xdp_csum_only python3 plot_mode.py
	NAME=xdp_tx python3 plot_mode.py
	NAME=xdp_lb python3 plot_mode.py
	NAME=xdp_adjust_tail python3 plot_mode.py
	NAME=xdp_firewall python3 plot_mode.py
	NAME=xdping python3 plot_mode.py
	NAME=xdp_map python3 plot_mode.py
	NAME=xdp_hash_sum python3 plot_mode.py
	NAME=xdp-observer python3 plot_mode.py
	NAME=xdp-tcpclassify python3 plot_mode.py

.PHONY: plot_all_size
plot_all_size:
	NAME=xdp_map_access python3 plot_size.py
	NAME=xdp_map_access_no_lto python3 plot_size.py
	NAME=xdp_csum python3 plot_size.py
	NAME=xdp_csum_only python3 plot_size.py
	NAME=xdp_tx python3 plot_size.py
	NAME=xdp_lb python3 plot_size.py
	NAME=xdp_adjust_tail python3 plot_size.py
	NAME=xdp_firewall python3 plot_size.py
	NAME=xdping python3 plot_size.py
	NAME=xdp_map python3 plot_size.py
	NAME=xdp_hash_sum python3 plot_size.py
