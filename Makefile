.PHONY: build dpdk

ROOTDIR=$(shell git rev-parse --show-toplevel)
DPDK_DIR=$(ROOTDIR)/external/dpdk

dpdk:
	cd external/dpdk && meson --prefix $(DPDK_DIR)/install-dir -Dplatform=generic build && cd build && ninja && ninja install

dpdk-ebpf:
	make -C build-bpftime
	make -C build distclean
	make -C build

clean:
	make -C build distclean