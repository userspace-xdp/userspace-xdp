NETDEV ?= enp24s0f1np1

ROOTDIR=$(shell git rev-parse --show-toplevel)
BPFTIME_DIR_UBPF=$(ROOTDIR)/build-bpftime-ubpf/
BPFTIME_DIR_LLVM=$(ROOTDIR)/build-bpftime-llvm/
DPDK_DIR=$(ROOTDIR)/external/dpdk
LIBXDP_PATH=$(ROOTDIR)/afxdp/lib/xdp-tools/lib/libxdp
NETDEV ?= enp24s0f1np1

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
BASIC_XDP_AOT_RES_NAME = $(ROOTDIR)/xdp_progs/.output/xdp_csum_only.aot.o

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
	sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
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
	sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9  || true
	sudo pgrep -f 'xdpsock_llvm' | xargs kill -9  || true

$(BASIC_XDP_NAME)/afxdp_ubpf_jit: $(BASIC_XDP_NAME)
	mkdir -p $(BASIC_XDP_NAME)
	$(MAKE) remove-xdp
	# Start the process in the background
	LD_PRELOAD=$(BPFTIME_DIR_UBPF)/bpftime/runtime/syscall-server/libbpftime-syscall-server.so \
	$(RUN_XDP_USERSPACE_COMMAND) &
	rm -rf ./tmp-pktgen-res
	cd $(ROOTDIR)/afxdp/l2fwd && sudo ./xdpsock_ubpf --l2fwd -i enp24s0f1np1 &
	$(MAKE) tmp-pktgen-res
	mv ./tmp-pktgen-res $(BASIC_XDP_NAME)/afxdp_ubpf_jit
	sudo pgrep -f '$(BASIC_XDP_NAME)' | xargs kill || true
	sudo pgrep -f 'xdpsock_ubpf' | xargs kill -9 || true
	sudo pgrep -f 'xdpsock_ubpf' | xargs kill -9 || true
