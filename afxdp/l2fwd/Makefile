# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
BPFTIME_LIB_DIR ?= $(ROOTDIR)/build/
USER_TARGETS   := xdpsock
BPF_TARGETS    := xdpsock_kern
ROOTDIR=$(shell git rev-parse --show-toplevel)
LTO_FLAG ?=  -flto
BPFTIME_VM_LIBRARY ?= -lubpf -lbpftime_ubpf_vm
LDLIBS += -lpthread -L$(BPFTIME_LIB_DIR)bpftime/runtime/  \
			-L$(BPFTIME_LIB_DIR) \
			-L$(BPFTIME_LIB_DIR)bpftime/vm \
			-L$(BPFTIME_LIB_DIR)bpftime/third_party/spdlog \
			-L$(BPFTIME_LIB_DIR)bpftime/FridaGum-prefix/src/FridaGum/ \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/base_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/frida_uprobe_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/syscall_trace_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/vm/vm-core \
			-L$(BPFTIME_LIB_DIR)bpftime/vm/ubpf-vm/ubpf/lib \
			-L$(BPFTIME_LIB_DIR)bpftime/vm/ubpf-vm \
			-lruntime -lxdp-bpftime $(DPDK_LIBS) \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lbpftime_frida_uprobe_attach_impl \
			-lbpftime_syscall_trace_attach_impl \
			-lbpftime_vm \
			$(BPFTIME_VM_LIBRARY) \
			$(shell /usr/bin/llvm-config-15 --ldflags --link-static) \
			$(shell /usr/bin/llvm-config-15 --libs --link-static engine orcjit x86 jitlink linker mcjit) \
			$(shell /usr/bin/llvm-config-15 --system-libs --link-static) \
			-lspdlog -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf $(LTO_FLAG)
CFLAGS += -I$(ROOTDIR)/ -I$(ROOTDIR)/module $(shell /usr/bin/llvm-config-15 --cflags) -g -O3 $(LTO_FLAG)
LIB_DIR = ../lib

include $(LIB_DIR)/common.mk
