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
			-lbpftime_base_attach_impl \
			-lbpftime_frida_uprobe_attach_impl \
			-lbpftime_syscall_trace_attach_impl \
			-lvm-bpf -lspdlogd -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf 
CFLAGS += -I$(ROOTDIR)/ -I$(ROOTDIR)/module
LIB_DIR = ../lib

include $(LIB_DIR)/common.mk
