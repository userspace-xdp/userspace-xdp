build:
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O2 -target bpf -g lib/bpf/balancer.bpf.c -c -o balancer.bpf.o

build-aot:
	clang -S -emit-llvm -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 lib-aot/bpf/balancer.bpf.c -o katran.bpf.ll
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 -g lib-aot/bpf/balancer.bpf.c -c -o balancer.aot.o

build-inline:
	clang -S -emit-llvm -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 lib-inline/bpf/balancer.bpf.c -o katran.inline.bpf.ll
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 -g lib-inline/bpf/balancer.bpf.c -c -o balancer.inline.aot.o

llvm-bpf:
	/home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/tools/aot/bpftime-aot build  balancer.bpf.o --emit_llvm 2> balancer.bpf.ll
	opt -O3 -S balancer.bpf.ll -opaque-pointers  -o balancer.opt.ll
