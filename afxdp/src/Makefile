# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
ROOTDIR=$(shell git rev-parse --show-toplevel)
BPFTIME_LIB_DIR ?= $(ROOTDIR)/build-bpftime/
XDP_TARGETS  := af_xdp_kern
USER_TARGETS := af_xdp_user
LDLIBS+= -lpthread  -L$(BPFTIME_LIB_DIR)bpftime/runtime  \
			-L$(ROOTDIR)/build-bpftime \
			-L$(BPFTIME_LIB_DIR)bpftime/vm \
			-L$(BPFTIME_LIB_DIR)bpftime/third_party/spdlog \
			-L$(BPFTIME_LIB_DIR)bpftime/FridaGum-prefix/src/FridaGum/ \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/base_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/frida_uprobe_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/syscall_trace_attach_impl \
			-lruntime -lxdp-bpftime $(DPDK_LIBS) \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lbpftime_frida_uprobe_attach_impl \
			-lbpftime_syscall_trace_attach_impl \
			-lvm-bpf -lspdlogd -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf 
CFLAGS += -I$(ROOTDIR)/ -I$(ROOTDIR)/module
COMMON_DIR = ../

include $(COMMON_DIR)/common.mk

