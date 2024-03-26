ROOTDIR=$(shell git rev-parse --show-toplevel)
OBJDIR =./
SRCDIR ?= $(ROOTDIR)/dpdk/
DPDK_DIR = $(ROOTDIR)/external/dpdk

TARGETS=base-server

all: $(TARGETS)

OBJS_C := $(patsubst $(SRCDIR)%.c,$(OBJDIR)%.o,$(wildcard $(SRCDIR)*.c))

CFLAGS += -g -O3 -I$(ROOTDIR)/inc -I$(DPDK_DIR)/install-dir/include -I$(ROOTDIR)/ -I$(ROOTDIR)/module -I$(SRCDIR)  -march=native
WERROR_FLAGS := -W -Wall -Wstrict-prototypes -Wmissing-prototypes
WERROR_FLAGS += -Wmissing-declarations -Wold-style-definition -Wpointer-arith
WERROR_FLAGS += -Wcast-align -Wnested-externs -Wcast-qual
WERROR_FLAGS += -Wformat-nonliteral -Wformat-security
WERROR_FLAGS += -Wundef -Wwrite-strings

#CFLAGS += $(WERROR_FLAGS) -mavx2

DPDK_LIBS := $(shell pkg-config --libs --static libdpdk)
BPFTIME_LIB_DIR ?= $(ROOTDIR)/build-bpftime/
LDFLAGS =   -L$(BPFTIME_LIB_DIR)bpftime/runtime  \
			-L$(ROOTDIR)/build-bpftime \
			-L$(BPFTIME_LIB_DIR)bpftime/vm \
			-L$(BPFTIME_LIB_DIR)bpftime/third_party/spdlog \
			-L$(BPFTIME_LIB_DIR)bpftime/FridaGum-prefix/src/FridaGum/ \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/base_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/frida_uprobe_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/attach/syscall_trace_attach_impl \
			-L$(BPFTIME_LIB_DIR)bpftime/libbpf \
			-L$(ROOTDIR)/afxdp/lib/xdp-tools/lib/libxdp \
			$(DPDK_LIBS) -lruntime -lxdp-bpftime  -lxdp \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lbpftime_base_attach_impl \
			-lbpftime_frida_uprobe_attach_impl \
			-lbpftime_syscall_trace_attach_impl \
			-lvm-bpf -lspdlogd -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf 

$(info $(SRCDIR))
$(info $(OBJS_C))

$(OBJDIR)%.o: $(SRCDIR)%.c
	cc $(CFLAGS) -c -o $@ $<

#### Applications ####

base-server: $(OBJS_C) $(BPFTIME_LIB_DIR)bpftime/runtime/libruntime.a #netstack.a $(OBJDIR)/base-server.o
	cc -o $@ $^ $(LDFLAGS)

clean:
	rm -rf *.o *.a

distclean:
	make clean
	rm -rf $(TARGETS)
