# SPDX-License-Identifier: BSD-3-Clause
# Copyright(c) 2010-2014 Intel Corporation

# binary name
APP = l2fwd

# all source are stored in SRCS-y
SRCS-y := main.c

PKGCONF ?= pkg-config

# Build using pkg-config variables if possible
ifneq ($(shell $(PKGCONF) --exists libdpdk && echo 0),0)
$(error "no installation of DPDK found")
endif

all: static
.PHONY: shared static
shared: build/$(APP)-shared
	ln -sf $(APP)-shared build/$(APP)
static: build/$(APP)-static
	ln -sf $(APP)-static build/$(APP)

PC_FILE := $(shell $(PKGCONF) --path libdpdk 2>/dev/null)
CFLAGS += -O3 $(shell $(PKGCONF) --cflags libdpdk) -I$(ROOTDIR)/module
# Add flag to allow experimental API as l2fwd uses rte_ethdev_set_ptype API
CFLAGS += -DALLOW_EXPERIMENTAL_API
ROOTDIR=$(shell git rev-parse --show-toplevel)
LD_FLAGS_EBPF = -L$(ROOTDIR)/build-bpftime/bpftime/runtime  \
			-L$(ROOTDIR)/build-bpftime \
			-L$(ROOTDIR)/build-bpftime/bpftime/vm \
			-L$(ROOTDIR)/build-bpftime/bpftime/third_party/spdlog \
			-L$(ROOTDIR)/build-bpftime/bpftime/FridaGum-prefix/src/FridaGum/ \
			-L$(ROOTDIR)/build-bpftime/bpftime/attach/base_attach_impl \
			-L$(ROOTDIR)/build-bpftime/bpftime/attach/frida_uprobe_attach_impl \
			-L$(ROOTDIR)/build-bpftime/bpftime/attach/syscall_trace_attach_impl \
			-L$(ROOTDIR)/build-bpftime/bpftime/libbpf \
			-L$(ROOTDIR)/afxdp/lib/xdp-tools/lib/libxdp \
			-lruntime -lxdp-bpftime  -lxdp \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lbpftime_frida_uprobe_attach_impl \
			-lbpftime_syscall_trace_attach_impl \
			-lvm-bpf \
			$(shell /usr/bin/llvm-config-15 --ldflags --link-static) \
			$(shell /usr/bin/llvm-config-15 --libs --link-static) \
			$(shell /usr/bin/llvm-config-15 --system-libs --link-static) \
			-lspdlog -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf 
LDFLAGS_SHARED = $(shell $(PKGCONF) --libs libdpdk) $(LD_FLAGS_EBPF)
LDFLAGS_STATIC = $(shell $(PKGCONF) --static --libs libdpdk) $(LD_FLAGS_EBPF)

ifeq ($(MAKECMDGOALS),static)
# check for broken pkg-config
ifeq ($(shell echo $(LDFLAGS_STATIC) | grep 'whole-archive.*l:lib.*no-whole-archive'),)
$(warning "pkg-config output list does not contain drivers between 'whole-archive'/'no-whole-archive' flags.")
$(error "Cannot generate statically-linked binaries with this version of pkg-config")
endif
endif

build/$(APP)-shared: $(SRCS-y) Makefile $(PC_FILE) | build
	$(CC) $(CFLAGS) $(SRCS-y) -o $@ $(LDFLAGS) $(LDFLAGS_SHARED)

build/$(APP)-static: $(SRCS-y) Makefile $(PC_FILE) | build
	$(CC) $(CFLAGS) $(SRCS-y) -o $@ $(LDFLAGS) $(LDFLAGS_STATIC)

build:
	@mkdir -p $@

.PHONY: clean
clean:
	rm -f build/$(APP) build/$(APP)-static build/$(APP)-shared
	test -d build && rmdir -p build || true
