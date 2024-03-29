#
# XDP Firewall
#
# Copyright (C) 2019 Alexandre Cassen, <acassen@keepalived.org>

EXEC= xdpfwadm
CC= gcc
CFLAGS= -Wall -Wstrict-prototypes -Wpointer-arith -O3 -fomit-frame-pointer -fexpensive-optimizations

# kbuilddir can be redefined
kbuilddir ?= /lib/modules/$(shell uname -r)/build
KERNEL = $(kbuilddir)
#KERNEL = /usr/src/linux

LINUXINCLUDE := -I$(KERNEL)/tools/include
LINUXINCLUDE += -I$(KERNEL)/tools/lib
LINUXINCLUDE += -I$(KERNEL)/tools/include/uapi
LINUXINCLUDE += -I$(KERNEL)/tools/testing/selftests/bpf

LDLIBS= -lelf
OBJECTS= main.o bpf_standalone.o
.c.o:
	@echo "  CC $@"
	@$(CC) -o $@ $(CFLAGS) $(LINUXINCLUDE) -c $*.c

all:	$(EXEC)

$(EXEC):	$(OBJECTS)
	@echo ""
	@echo "  Linking $(EXEC)"
	@$(CC) -o $(EXEC) $(CFLAGS) $(OBJECTS) $(LDLIBS)

clean:
	-rm -f *.o $(EXEC) 

