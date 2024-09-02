build:
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O2 -target bpf -g lib/bpf/balancer.bpf.c -c -o balancer.bpf.o

llvm-aot:
	# /home/yunwei/ebpf-xdp-dpdk/build-bpftime-llvm/bpftime/tools/aot/bpftime-aot build  balancer.bpf.o --emit_llvm 2> balancer.bpf.ll
	clang -S -emit-llvm -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 lib-aot/bpf/balancer.bpf.c -o .llvm_ir/balancer.aot.opt.ll
	clang -S -emit-llvm -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 lib-inline/bpf/balancer.bpf.c -o .llvm_ir/balancer.aot.inline.ll
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 -g lib-inline/bpf/balancer.bpf.c -c -o balancer.inline.aot.o
	clang -I./usr/include -I../ -DDEBUG -D__KERNEL__ -Wno-unused-value -Wno-pointer-sign -Wno-compare-distinct-pointer-types -O3 -g lib-aot/bpf/balancer.bpf.c -c -o balancer.aot.o

llvm-bpf:
	opt -O3 -S -opaque-pointers -o .llvm_ir/balancer.bpf.opt.ll .llvm_ir/balancer.bpf.ll
	clang -O3 -mllvm -opaque-pointers -c .llvm_ir/balancer.bpf.opt.ll -o balancer.base.aot.o
	clang -O3 -S -emit-llvm -mllvm -opaque-pointers -c .llvm_ir/balancer.bpf.inline.ll -o opt.ll
	clang -O3 -mllvm -opaque-pointers -c .llvm_ir/balancer.bpf.inline.ll -o balancer.bpf.inline.o

