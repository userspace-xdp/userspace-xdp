ROOTDIR=$(shell git rev-parse --show-toplevel)
OBJDIR=./
SRCDIR=$(ROOTDIR)/dpdk-lb/src/
DPDK_DIR=$(ROOTDIR)/external/dpdk

TARGETS=base-server

all: $(TARGETS)

OBJS_C := $(addprefix $(OBJDIR), $(patsubst %.c, %.o, $(shell ls $(SRCDIR))))

CFLAGS += -g -O3 -I$(ROOTDIR)/dpdk-lb/inc -I$(DPDK_DIR)/install-dir/include -march=native
WERROR_FLAGS := -W -Wall -Wstrict-prototypes -Wmissing-prototypes
WERROR_FLAGS += -Wmissing-declarations -Wold-style-definition -Wpointer-arith
WERROR_FLAGS += -Wcast-align -Wnested-externs -Wcast-qual
WERROR_FLAGS += -Wformat-nonliteral -Wformat-security
WERROR_FLAGS += -Wundef -Wwrite-strings

#CFLAGS += $(WERROR_FLAGS) -mavx2

# location of the installed pkgconfig file could be different based on your execution platform (e.g., mac, linux etc)
# change the PKG_CONFIG_PATH to the correct relative path that the dpdk installation moved the pkgconfig file based on your environment 
DPDK_LIBS := $(shell PKG_CONFIG_PATH=$(DPDK_DIR)/install-dir/lib64/pkgconfig/  pkg-config --libs --static libdpdk)

LDFLAGS = $(DPDK_LIBS) -lrt -lpthread -lm -ldl -lconfig -lnuma -lgcov

$(info $(SRCDIR))
$(info $(OBJS_C))

$(OBJDIR)%.o: $(SRCDIR)%.c
	cc $(CFLAGS) -c -o $@ $<

#### Applications ####

base-server: $(OBJS_C)
	cc -o $@ $^ $(LDFLAGS)

clean:
	rm -rf *.o *.a

distclean:
	make clean
	rm -rf $(TARGETS)
