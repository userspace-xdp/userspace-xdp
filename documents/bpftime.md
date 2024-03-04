# bpftime load

```console
$ cd /home/yunwei37/ebpf-xdp-dpdk/xdp-tutorial/basic01-xdp-pass
$ sudo SPDLOG_LEVEL=Debug LD_PRELOAD=/home/yunwei37/bpftime/build/runtime/syscall-server/libbpftime-syscall-server.so /home/yunwei37/ebpf-xdp-dpdk/xdp-tutorial/basic01-xdp-pass/xdp_pass_user  --dev lo
[2024-01-28 21:44:59.153] [info] [syscall_context.hpp:84] manager constructed
[2024-01-28 21:44:59.154] [info] [syscall_server_utils.cpp:24] Initialize syscall server
[2024-01-28 21:44:59][info][142964] Global shm constructed. shm_open_type 0 for bpftime_maps_shm
[2024-01-28 21:44:59][info][142964] Enabling helper groups ufunc, kernel, shm_map by default
[2024-01-28 21:44:59][info][142964] bpftime-syscall-server started
libbpf: elf: skipping unrecognized data section(7) xdp_metadata
libxdp: couldn't get program info: Unknown error -1libbpf: elf: skipping unrecognized data section(7) xdp_metadata
libxdp: couldn't get program info: Unknown error -1libxdp: Failed to load dispatcher: Operation not permitted
libxdp: Falling back to loading single prog without dispatcher
libbpf: elf: skipping unrecognized data section(7) xdp_metadata
libxdp: couldn't get program info: Unknown error -1libxdp: couldn't get program info: Unknown error -1Couldn't attach XDP program on iface 'lo' : Operation not permitted (1)
INFO [142964]: Global shm destructed
yunwei37@yunwei-server:~/dpdk-startingpoint/xdp-tutorial/basic01-xdp-pass$ sudo SPDLOG_LEVEL=Debug LD_PRELOAD=/home/yu
nwei37/bpftime/build/runtime/syscall-server/libbpftime-syscall-server.so /home/yunwei37/ebpf-xdp-dpdk/xdp-tutoria
l/basic01-xdp-pass/xdp_pass_user  --dev lo
[2024-01-28 21:45:43.701] [info] [syscall_context.hpp:84] manager constructed
[2024-01-28 21:45:43.701] [info] [syscall_server_utils.cpp:24] Initialize syscall server
[2024-01-28 21:45:43][debug][143005] start: bpftime_shm for server setup
[2024-01-28 21:45:43][debug][143005] done: bpftime_shm for server setup: remove installed segment
[2024-01-28 21:45:43][debug][143005] mmap 0
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] done: bpftime_shm for server setup: segment
[2024-01-28 21:45:43][debug][143005] done: bpftime_shm for server setup: manager
[2024-01-28 21:45:43][debug][143005] done: bpftime_shm for server setup: syscall_pid_set
[2024-01-28 21:45:43][debug][143005] done: bpftime_shm for server setup: agent_config
[2024-01-28 21:45:43][debug][143005] done: bpftime_shm for server setup.
[2024-01-28 21:45:43][info][143005] Global shm constructed. shm_open_type 0 for bpftime_maps_shm
[2024-01-28 21:45:43][info][143005] Enabling helper groups ufunc, kernel, shm_map by default
[2024-01-28 21:45:43][debug][143005] Set environment variable BPFTIME_USED
[2024-01-28 21:45:43][info][143005] bpftime-syscall-server started
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
libbpf: elf: skipping unrecognized data section(7) xdp_metadata
[2024-01-28 21:45:43][debug][143005] mmap64 0
[2024-01-28 21:45:43][debug][143005] Calling mocked mmap64
[2024-01-28 21:45:43][debug][143005] Calling original mmap64: addr=0x0, length=4096, prot=3, flags=33, fd=-1, offset=0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053405952 116 4294967294 0 687194767493
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860017904 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 3 to bpf_prog_handler, name , prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053406016 144 2 0 2
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860018432 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 3 to bpf_prog_handler, name , prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405824 32 -112 64 14873989736
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405792 32 140357224996234 0 140737053406160
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405792 32 140357224996234 0 140737053406160
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405824 32 140357224996234 0 89
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405792 32 140357224996234 0 140737053406168
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405792 32 140357224996234 0 140737053406168
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405808 32 140357224996234 0 94580082303824
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405824 32 140357224996234 0 94580082296208
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405872 32 140357224996234 0 0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053405696 64 1 140737053406128 140737053405616
[2024-01-28 21:45:43][debug][143005] Loading program `libbpf_nametest` license `GPL` prog_type `1` attach_type 3860017648 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 4 to bpf_prog_handler, name libbpf_nametest, prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `libbpf_nametest` id=4
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] SYS_BPF 0 140737053405904 72 140357224996234 0 17179869186
[2024-01-28 21:45:43][debug][143005] Creating map
[2024-01-28 21:45:43][debug][143005] Create map with type 2
[2024-01-28 21:45:43][debug][143005] Created map 4, type=2, name=libbpf_mmap, key_size=4, value_size=4
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] SYS_BPF 0 140737053405408 72 1 0 17179869186
[2024-01-28 21:45:43][debug][143005] Creating map
[2024-01-28 21:45:43][debug][143005] Create map with type 2
[2024-01-28 21:45:43][debug][143005] Created map 4, type=2, name=libbpf_global, key_size=4, value_size=32
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053405408 144 5 0 5
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860017600 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 5 to bpf_prog_handler, name , prog_type 1, insn_cnt 5
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=5
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] Closing fd 5
[2024-01-28 21:45:43][debug][143005] SYS_BPF 0 140737053405392 72 1 140737053405632 17179869186
[2024-01-28 21:45:43][debug][143005] Creating map
[2024-01-28 21:45:43][debug][143005] Create map with type 2
[2024-01-28 21:45:43][debug][143005] Created map 4, type=2, name=xdp_disp.rodata, key_size=4, value_size=124
[2024-01-28 21:45:43][debug][143005] SYS_BPF 2 140737053405712 32 140357224996234 0 4
[2024-01-28 21:45:43][debug][143005] Updating map
[2024-01-28 21:45:43][debug][143005] SYS_BPF 22 140737053405712 4 1 1 4
[2024-01-28 21:45:43][debug][143005] Calling bpf map freeze, but we didn't implement this
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403360 144 2 140737053403584 2
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `9` attach_type 3860015664 map_type 9
[2024-01-28 21:45:43][debug][143005] Set handler fd 5 to bpf_prog_handler, name , prog_type 9, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=5
[2024-01-28 21:45:43][debug][143005] Closing fd 5
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403648 144 214 140737053403952 214
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_dispatcher` license `GPL` prog_type `6` attach_type 607499184 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 5 to bpf_prog_handler, name xdp_dispatcher, prog_type 6, insn_cnt 214
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_dispatcher` id=5
[2024-01-28 21:45:43][debug][143005] SYS_BPF 0 140737053403424 72 1 0 17179869186
[2024-01-28 21:45:43][debug][143005] Creating map
[2024-01-28 21:45:43][debug][143005] Create map with type 2
[2024-01-28 21:45:43][debug][143005] Created map 6, type=2, name=libbpf_det_bind, key_size=4, value_size=32
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403424 144 2 0 2
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860015616 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 7 to bpf_prog_handler, name , prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=7
[2024-01-28 21:45:43][debug][143005] SYS_BPF 35 140737053403472 12 140357224996234 0 25769803783
[2024-01-28 21:45:43][debug][143005] Closing fd 6
[2024-01-28 21:45:43][debug][143005] Closing fd 7
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403648 144 2 140737053403952 2
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_pass` license `GPL` prog_type `6` attach_type 607487424 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 6 to bpf_prog_handler, name xdp_pass, prog_type 6, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_pass` id=6
[2024-01-28 21:45:43][debug][143005] SYS_BPF 15 140737053406240 16 94580082212880 7 996432412679
[2024-01-28 21:45:43][debug][143005] Getting info by fd
libxdp: couldn't get program info: Unknown error -1[2024-01-28 21:45:43][debug][143005] Closing fd 7
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] Closing fd 5
[2024-01-28 21:45:43][debug][143005] Closing fd 6
[2024-01-28 21:45:43][debug][143005] Closing fd 3
libbpf: elf: skipping unrecognized data section(7) xdp_metadata
[2024-01-28 21:45:43][debug][143005] mmap64 0
[2024-01-28 21:45:43][debug][143005] Calling mocked mmap64
[2024-01-28 21:45:43][debug][143005] Calling original mmap64: addr=0x0, length=4096, prot=3, flags=33, fd=-1, offset=0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053406048 144 2 0 2
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860018464 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 3 to bpf_prog_handler, name , prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053405904 32 13 0 0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 0 140737053405424 72 1 140737053405664 17179869186
[2024-01-28 21:45:43][debug][143005] Creating map
[2024-01-28 21:45:43][debug][143005] Create map with type 2
[2024-01-28 21:45:43][debug][143005] Created map 4, type=2, name=xdp_disp.rodata, key_size=4, value_size=124
[2024-01-28 21:45:43][debug][143005] SYS_BPF 2 140737053405744 32 140357224996234 0 4
[2024-01-28 21:45:43][debug][143005] Updating map
[2024-01-28 21:45:43][debug][143005] SYS_BPF 22 140737053405744 4 1 1 4
[2024-01-28 21:45:43][debug][143005] Calling bpf map freeze, but we didn't implement this
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403680 144 214 140737053403984 214
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_dispatcher` license `GPL` prog_type `6` attach_type 607508368 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 5 to bpf_prog_handler, name xdp_dispatcher, prog_type 6, insn_cnt 214
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_dispatcher` id=5
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403680 144 2 140737053403984 2
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_pass` license `GPL` prog_type `6` attach_type 607477008 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 6 to bpf_prog_handler, name xdp_pass, prog_type 6, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_pass` id=6
[2024-01-28 21:45:43][debug][143005] SYS_BPF 15 140737053406272 16 94580082212880 7 996432412679
[2024-01-28 21:45:43][debug][143005] Getting info by fd
libxdp: couldn't get program info: Unknown error -1[2024-01-28 21:45:43][debug][143005] Closing fd 7
libxdp: Failed to load dispatcher: Operation not permitted
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] Closing fd 5
[2024-01-28 21:45:43][debug][143005] Closing fd 6
[2024-01-28 21:45:43][debug][143005] Closing fd 3
libxdp: Falling back to loading single prog without dispatcher
libbpf: elf: skipping unrecognized data section(7) xdp_metadata
[2024-01-28 21:45:43][debug][143005] mmap64 0
[2024-01-28 21:45:43][debug][143005] Calling mocked mmap64
[2024-01-28 21:45:43][debug][143005] Calling original mmap64: addr=0x0, length=4096, prot=3, flags=33, fd=-1, offset=0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053406176 144 2 0 2
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860018592 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 3 to bpf_prog_handler, name , prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053406032 32 13 0 0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 0 140737053405552 72 1 140737053405792 17179869186
[2024-01-28 21:45:43][debug][143005] Creating map
[2024-01-28 21:45:43][debug][143005] Create map with type 2
[2024-01-28 21:45:43][debug][143005] Created map 4, type=2, name=xdp_disp.rodata, key_size=4, value_size=124
[2024-01-28 21:45:43][debug][143005] SYS_BPF 2 140737053405872 32 140357224996234 0 4
[2024-01-28 21:45:43][debug][143005] Updating map
[2024-01-28 21:45:43][debug][143005] SYS_BPF 22 140737053405872 4 1 1 4
[2024-01-28 21:45:43][debug][143005] Calling bpf map freeze, but we didn't implement this
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403808 144 214 140737053404112 214
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_dispatcher` license `GPL` prog_type `6` attach_type 607517040 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 5 to bpf_prog_handler, name xdp_dispatcher, prog_type 6, insn_cnt 214
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_dispatcher` id=5
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403808 144 2 140737053404112 2
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_pass` license `GPL` prog_type `6` attach_type 607485872 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 6 to bpf_prog_handler, name xdp_pass, prog_type 6, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_pass` id=6
[2024-01-28 21:45:43][debug][143005] SYS_BPF 15 140737053406400 16 94580082212880 7 996432412679
[2024-01-28 21:45:43][debug][143005] Getting info by fd
libxdp: couldn't get program info: Unknown error -1[2024-01-28 21:45:43][debug][143005] Closing fd 7
[2024-01-28 21:45:43][debug][143005] Closing fd 4
[2024-01-28 21:45:43][debug][143005] Closing fd 5
[2024-01-28 21:45:43][debug][143005] Closing fd 6
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053406208 144 2 0 2
[2024-01-28 21:45:43][debug][143005] Loading program `` license `GPL` prog_type `1` attach_type 3860018624 map_type 1
[2024-01-28 21:45:43][debug][143005] Set handler fd 3 to bpf_prog_handler, name , prog_type 1, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `` id=3
[2024-01-28 21:45:43][debug][143005] Closing fd 3
[2024-01-28 21:45:43][debug][143005] SYS_BPF 18 140737053406064 32 1 0 0
[2024-01-28 21:45:43][debug][143005] SYS_BPF 5 140737053403840 144 2 140737053404144 2
[2024-01-28 21:45:43][debug][143005] Loading program `xdp_prog_simple` license `GPL` prog_type `6` attach_type 607477968 map_type 6
[2024-01-28 21:45:43][debug][143005] Set handler fd 4 to bpf_prog_handler, name xdp_prog_simple, prog_type 6, insn_cnt 2
[2024-01-28 21:45:43][debug][143005] Loaded program `xdp_prog_simple` id=4
[2024-01-28 21:45:43][debug][143005] SYS_BPF 15 140737053406432 16 140357224996234 4 996432412677
[2024-01-28 21:45:43][debug][143005] Getting info by fd
libxdp: couldn't get program info: Unknown error -1[2024-01-28 21:45:43][debug][143005] Closing fd 5
Couldn't attach XDP program on iface 'lo' : Operation not permitted (1)
INFO [143005]: Global shm destructed
```
