.PHONY: build dpdk dpdk-ebpf bench-bin bench-clean

ROOTDIR=$(shell git rev-parse --show-toplevel)
DPDK_DIR=$(ROOTDIR)/external/dpdk

BPFTIME_DIR_UBPF=$(ROOTDIR)/build-bpftime-ubpf/
BPFTIME_DIR_LLVM=$(ROOTDIR)/build-bpftime-llvm/

BENCH_EXEC=afxdp/l2fwd/xdpsock_ubpf afxdp/l2fwd/xdpsock_llvm dpdk/dpdk_ubpf dpdk/dpdk_llvm dpdk/dpdk_batch

dpdk:
	cd external/dpdk && meson --prefix $(ROOTDIR)/external/dpdk/install-dir -Dplatform=generic build && cd build && ninja && ninja install

build-bench-lib: dpdk $(BPFTIME_DIR_LLVM) $(BPFTIME_DIR_UBPF)

base.btf: base.c
	gcc -g base.c -c -o base.o
	pahole --btf_encode_detached base.btf base.o 

bench-bin: $(BENCH_EXEC)

LTO_FLAG ?= -flto

$(BPFTIME_DIR_UBPF):
	cmake -B $(BPFTIME_DIR_UBPF) .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo  -DBPFTIME_LLVM_JIT=0
	make -C  $(BPFTIME_DIR_UBPF) -j

$(BPFTIME_DIR_LLVM):
	cmake -B $(BPFTIME_DIR_LLVM) .  -DBUILD_BPFTIME_DAEMON=0 -DCMAKE_BUILD_TYPE:STRING=RelWithDebInfo  -DBPFTIME_LLVM_JIT=1
	make -C  $(BPFTIME_DIR_LLVM) -j

afxdp/l2fwd/xdpsock_ubpf: $(BPFTIME_DIR_UBPF)
	rm -f afxdp/l2fwd/xdpsock
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_UBPF) LTO_FLAG=$(LTO_FLAG) \
	make -C afxdp/l2fwd
	mv afxdp/l2fwd/xdpsock afxdp/l2fwd/xdpsock_ubpf

afxdp/l2fwd/xdpsock_llvm: $(BPFTIME_DIR_LLVM)
	rm -f afxdp/l2fwd/xdpsock
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_LLVM) LTO_FLAG=$(LTO_FLAG) \
	BPFTIME_VM_LIBRARY=-lbpftime_llvm_jit_vm \
	make -C afxdp/l2fwd
	mv afxdp/l2fwd/xdpsock afxdp/l2fwd/xdpsock_llvm

dpdk/dpdk_ubpf: $(BPFTIME_DIR_UBPF) dpdk
	rm -rf dpdk/build
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_UBPF) \
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig LTO_FLAG=$(LTO_FLAG) \
	make -C dpdk
	mv dpdk/build/l2fwd-static dpdk/dpdk_ubpf

dpdk/dpdk_llvm: $(BPFTIME_DIR_LLVM) dpdk
	rm -rf dpdk/build
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_LLVM) \
	BPFTIME_VM_LIBRARY=-lbpftime_llvm_jit_vm \
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig LTO_FLAG=$(LTO_FLAG) \
	make -C dpdk
	mv dpdk/build/l2fwd-static dpdk/dpdk_llvm

dpdk/dpdk_batch: $(BPFTIME_DIR_LLVM) dpdk
	rm -rf dpdk/build
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_LLVM) \
	BPFTIME_VM_LIBRARY=-lbpftime_llvm_jit_vm \
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig LTO_FLAG=$(LTO_FLAG) \
	BATCH_FLAG=-DPROCESS_BATCH_PACKET \
	make -C dpdk
	mv dpdk/build/l2fwd-static dpdk/dpdk_batch

pktgen:
	git clone https://github.com/pktgen/Pktgen-DPDK
	# need to download dpdk v23.11 and build in $(ROOTDIR)/../install-dir/
	PKG_CONFIG_PATH=$(ROOTDIR)/../install-dir/lib/x86_64-linux-gnu/pkgconfig \
	make -C Pktgen-DPDK clean && \
	PKG_CONFIG_PATH=$(ROOTDIR)/../install-dir/lib/x86_64-linux-gnu/pkgconfig \
	make -C Pktgen-DPDK  buildlua 

bench-clean:
	rm -rf $(BPFTIME_DIR_UBPF) $(BPFTIME_DIR_LLVM)
	rm -f $(BENCH_EXEC)
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig \
	make -C dpdk/  clean
	make -C afxdp/l2fwd/ clean

bench-examples:
	make -C xdp_progs

