.PHONY: build dpdk dpdk-ebpf bench-bin bench-clean

ROOTDIR=$(shell git rev-parse --show-toplevel)
DPDK_DIR=$(ROOTDIR)/external/dpdk

BPFTIME_DIR_UBPF=$(ROOTDIR)/build-bpftime-ubpf/
BPFTIME_DIR_LLVM=$(ROOTDIR)/build-bpftime-llvm/

BENCH_EXEC=afxdp/l2fwd/xdpsock_ubpf afxdp/l2fwd/xdpsock_llvm dpdk_l2fwd/dpdk_l2fwd_ubpf dpdk_l2fwd/dpdk_l2fwd_llvm

dpdk:
	cd external/dpdk && meson --prefix /home/yunwei/install-dir -Dplatform=generic build && cd build && ninja && ninja install

dpdk-ebpf:
	make -C build distclean
	make -C build

build-bench-lib: dpdk $(BPFTIME_DIR_LLVM) $(BPFTIME_DIR_UBPF)

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
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_UBPF) LTO_FLAG=$(LTO_FLAG) make -C afxdp/l2fwd
	mv afxdp/l2fwd/xdpsock afxdp/l2fwd/xdpsock_ubpf

afxdp/l2fwd/xdpsock_llvm: $(BPFTIME_DIR_LLVM)
	rm -f afxdp/l2fwd/xdpsock
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_LLVM) LTO_FLAG=$(LTO_FLAG) make -C afxdp/l2fwd
	mv afxdp/l2fwd/xdpsock afxdp/l2fwd/xdpsock_llvm

dpdk_l2fwd/dpdk_l2fwd_ubpf: $(BPFTIME_DIR_UBPF) dpdk
	rm -rf dpdk_l2fwd/build
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_UBPF) \
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig LTO_FLAG=$(LTO_FLAG) \
	make -C dpdk_l2fwd
	mv dpdk_l2fwd/build/l2fwd-static dpdk_l2fwd/dpdk_l2fwd_ubpf

dpdk_l2fwd/dpdk_l2fwd_llvm: $(BPFTIME_DIR_LLVM) dpdk
	rm -rf dpdk_l2fwd/build
	BPFTIME_LIB_DIR=$(BPFTIME_DIR_LLVM) \
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig LTO_FLAG=$(LTO_FLAG) \
	make -C dpdk_l2fwd
	mv dpdk_l2fwd/build/l2fwd-static dpdk_l2fwd/dpdk_l2fwd_llvm

pktgen:
	# need to download dpdk v23.11 and build in $(ROOTDIR)/../install-dir/
	PKG_CONFIG_PATH=$(ROOTDIR)/../install-dir/lib/x86_64-linux-gnu/pkgconfig \
	make -C Pktgen-DPDK clean && \
	PKG_CONFIG_PATH=$(ROOTDIR)/../install-dir/lib/x86_64-linux-gnu/pkgconfig \
	make -C Pktgen-DPDK  buildlua 

bench-clean:
	rm -rf $(BPFTIME_DIR_UBPF) $(BPFTIME_DIR_LLVM)
	rm -f $(BENCH_EXEC)
	PKG_CONFIG_PATH=$(ROOTDIR)/external/dpdk/install-dir/lib/x86_64-linux-gnu/pkgconfig \
	make -C dpdk_l2fwd/  clean
	make -C afxdp/l2fwd/ clean
	make clean

bench-examples:
	make -C xdp_progs

clean:
	make -C build distclean
