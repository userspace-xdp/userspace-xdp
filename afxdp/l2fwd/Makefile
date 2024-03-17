# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)

USER_TARGETS   := xdpsock
BPF_TARGETS    := xdpsock_kern
ROOTDIR=$(shell git rev-parse --show-toplevel)
LDLIBS += -lpthread -L$(ROOTDIR)/build-bpftime/bpftime/runtime  \
			-L$(ROOTDIR)/build-bpftime \
			-L$(ROOTDIR)/build-bpftime/bpftime/vm \
			-L$(ROOTDIR)/build-bpftime/bpftime/third_party/spdlog \
			-L$(ROOTDIR)/build-bpftime/bpftime/FridaGum-prefix/src/FridaGum/ \
			-L$(ROOTDIR)/build-bpftime/bpftime/attach/base_attach_impl \
			-L$(ROOTDIR)/build-bpftime/bpftime/attach/frida_uprobe_attach_impl \
			-L$(ROOTDIR)/build-bpftime/bpftime/attach/syscall_trace_attach_impl \
			-lruntime -lxdp-bpftime $(DPDK_LIBS) \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lbpftime_frida_uprobe_attach_impl \
			-lbpftime_syscall_trace_attach_impl \
			-lvm-bpf \
			$(shell /usr/bin/llvm-config-15 --ldflags --link-static) \
			$(shell /usr/bin/llvm-config-15 --libs --link-static) \
			$(shell /usr/bin/llvm-config-15 --system-libs --link-static) \
			-lspdlog -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf
CFLAGS += -I$(ROOTDIR)/ -I$(ROOTDIR)/module $(shell /usr/bin/llvm-config-15 --cflags)
LIB_DIR = ../lib

include $(LIB_DIR)/common.mk
