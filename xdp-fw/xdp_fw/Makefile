#
# XDP Firewall
#
# Copyright (C) 2019 Alexandre Cassen, <acassen@keepalived.org>


# XDP program to build
TARGETS := xdp_fw.bpf

# Allows pointing LLC/CLANG to a LLVM backend with bpf support, redefine on cmdline:
#  make samples/bpf/ LLC=~/git/llvm/build/bin/llc CLANG=~/git/llvm/build/bin/clang
LLC ?= llc
CLANG ?= clang
CFLAGS := -g -O2 -Wall

# kbuilddir can be redefined
kbuilddir ?= /lib/modules/$(shell uname -r)/build
KERNEL = $(kbuilddir)
#KERNEL = /usr/src/linux

LINUXINCLUDE := -I$(KERNEL)/tools/include
LINUXINCLUDE := -I$(KERNEL)/tools/include/uapi
LINUXINCLUDE += -I$(KERNEL)/tools/testing/selftests/bpf

all: dependencies $(TARGETS)
.PHONY: dependencies clean $(CLANG) $(LLC)

clean:
	@find . -type f			\
		\( -name '*~'		\
		-o -name '*.ll'		\
		-o -name '*.bc' \)	\
		-exec rm -vf '{}'	\;
	rm -f $(TARGETS)

dependencies: verify_cmds verify_target_bpf
verify_cmds: $(CLANG) $(LLC)
	@for TOOL in $^ ; do \
		if ! (which -- "$${TOOL}" > /dev/null 2>&1); then \
			echo "*** ERROR: Cannot find LLVM tool $${TOOL}" ;\
			exit 1; \
		else true; fi; \
	done
verify_target_bpf: verify_cmds
	@if ! (${LLC} -march=bpf -mattr=help > /dev/null 2>&1); then \
		echo "*** ERROR: LLVM (${LLC}) does not support 'bpf' target" ;\
		echo "   NOTICE: LLVM version >= 3.7.1 required" ;\
		exit 2; \
	else true; fi


# asm/sysreg.h - inline assembly used by it is incompatible with llvm.
# But, there is no easy way to fix it, so just exclude it since it is
# useless for BPF samples.
$(TARGETS): %.bpf: %.c
	@echo "  CLANG-bpf" $@
	@$(CLANG) -S $(NOSTDINC_FLAGS) $(LINUXINCLUDE) \
	    -D__KERNEL__ -D__ASM_SYSREG_H \
	    -D__BPF_TRACING__ \
	    -Wall \
	    -Wno-unused-value -Wno-pointer-sign \
	    -D__TARGET_ARCH_$(ARCH) \
	    -Wno-compare-distinct-pointer-types \
	    -Wno-gnu-variable-sized-type-not-at-end \
	    -Wno-tautological-compare \
	    -Wno-unknown-warning-option \
	    -Wno-address-of-packed-member \
	    -O2 -emit-llvm -c $< -o ${@:.bpf=.ll}
	@$(LLC) -march=bpf -filetype=obj -o $@ ${@:.bpf=.ll}
