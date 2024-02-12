ROOTDIR=$(shell git rev-parse --show-toplevel)
OBJDIR=./
SRCDIR=$(ROOTDIR)/dpdk/
DPDK_DIR=$(ROOTDIR)/external/dpdk

TARGETS=base-server

all: $(TARGETS)

OBJS_C := $(patsubst $(SRCDIR)%.c,$(OBJDIR)%.o,$(wildcard $(SRCDIR)*.c))

CFLAGS += -g -O3 -I$(ROOTDIR)/inc -I$(DPDK_DIR)/install-dir/include -I$(ROOTDIR)/ -I$(ROOTDIR)/module
WERROR_FLAGS := -W -Wall -Wstrict-prototypes -Wmissing-prototypes
WERROR_FLAGS += -Wmissing-declarations -Wold-style-definition -Wpointer-arith
WERROR_FLAGS += -Wcast-align -Wnested-externs -Wcast-qual
WERROR_FLAGS += -Wformat-nonliteral -Wformat-security
WERROR_FLAGS += -Wundef -Wwrite-strings

#CFLAGS += $(WERROR_FLAGS) -mavx2

DPDK_LIBS := $(shell pkg-config --libs --static libdpdk)

LDFLAGS =   -L$(ROOTDIR)/build-bpftime/bpftime/runtime  \
			-L$(ROOTDIR)/build-bpftime \
			-L$(ROOTDIR)/build-bpftime/bpftime/vm \
			-L$(ROOTDIR)/build-bpftime/bpftime/third_party/spdlog \
			-L$(ROOTDIR)/build-bpftime/bpftime/FridaGum-prefix/src/FridaGum/ \
			-lruntime -lxdp-bpftime $(DPDK_LIBS) \
			-lpthread -lm -ldl -lconfig -lnuma -lgcov -lstdc++ -lruntime \
			-lvm-bpf -lspdlogd -lbpf \
			-lfrida-gum -lpthread -lm -ldl -lz -lelf 

$(info $(SRCDIR))

$(OBJDIR)%.o: $(SRCDIR)%.c
	cc $(CFLAGS) -c -o $@ $<

#### Applications ####

base-server: $(OBJS_C) $(ROOTDIR)/build-bpftime/bpftime/runtime/libruntime.a #netstack.a $(OBJDIR)/base-server.o
	cc -o $@ $^ $(LDFLAGS)

clean:
	rm -rf *.o *.a

distclean:
	make clean
	rm -rf $(TARGETS)
