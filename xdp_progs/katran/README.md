# source code of katran eBPF

```sh
[sudo] password for yunwei: 
[2024-06-09 22:13:52.952] [info] [syscall_context.hpp:86] manager constructed
libbpf: loading /home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer_user.bpf.o
libbpf: elf: section(3) xdp, size 17984, link 0, flags 6, type=1
libbpf: sec 'xdp': found program 'balancer_ingress' at insn offset 0 (0 bytes), code size 2248 insns (17984 bytes)
libbpf: elf: section(4) .relxdp, size 832, link 21, flags 0, type=9
libbpf: elf: section(5) license, size 4, link 0, flags 3, type=1
libbpf: license of /home/yunwei/ebpf-xdp-dpdk/documents/katran/balancer_user.bpf.o is GPL
libbpf: elf: section(6) .maps, size 600, link 0, flags 3, type=1
libbpf: elf: section(13) .BTF, size 16237, link 0, flags 0, type=1
libbpf: elf: section(15) .BTF.ext, size 15872, link 0, flags 0, type=1
libbpf: elf: section(17) .eh_frame, size 48, link 0, flags 2, type=1
libbpf: elf: skipping unrecognized data section(17) .eh_frame
libbpf: elf: section(18) .rel.eh_frame, size 16, link 21, flags 0, type=9
libbpf: elf: skipping relo section(18) .rel.eh_frame for section(17) .eh_frame
libbpf: elf: section(21) .symtab, size 3624, link 1, flags 0, type=2
libbpf: looking for externs among 151 symbols...
libbpf: collected 0 externs total
libbpf: map 'ctl_array': at sec_idx 6, offset 0.
libbpf: map 'ctl_array': found type = 2.
libbpf: map 'ctl_array': found key [6], sz = 4.
libbpf: map 'ctl_array': found value [9], sz = 8.
libbpf: map 'ctl_array': found max_entries = 16.
libbpf: map 'ctl_array': found map_flags = 0x0.
libbpf: map 'vip_map': at sec_idx 6, offset 40.
libbpf: map 'vip_map': found type = 1.
libbpf: map 'vip_map': found key [25], sz = 20.
libbpf: map 'vip_map': found value [32], sz = 8.
libbpf: map 'vip_map': found max_entries = 512.
libbpf: map 'vip_map': found map_flags = 0x0.
libbpf: map 'fallback_cache': at sec_idx 6, offset 80.
libbpf: map 'fallback_cache': found type = 9.
libbpf: map 'fallback_cache': found key [40], sz = 40.
libbpf: map 'fallback_cache': found value [46], sz = 16.
libbpf: map 'fallback_cache': found max_entries = 1000.
libbpf: map 'fallback_cache': found map_flags = 0x0.
libbpf: map 'lru_mapping': at sec_idx 6, offset 120.
libbpf: map 'lru_mapping': found type = 12.
libbpf: map 'lru_mapping': found key [6], sz = 4.
libbpf: map 'lru_mapping': found value [6], sz = 4.
libbpf: map 'lru_mapping': found max_entries = 128.
libbpf: map 'lru_mapping': found map_flags = 0x0.
libbpf: map 'lru_mapping': found inner map definition.
libbpf: map 'lru_mapping.inner': found type = 9.
libbpf: map 'lru_mapping.inner': found key [40], sz = 40.
libbpf: map 'lru_mapping.inner': found value [46], sz = 16.
libbpf: map 'lru_mapping.inner': found max_entries = 1000.
libbpf: map 'ch_rings': at sec_idx 6, offset 160.
libbpf: map 'ch_rings': found type = 2.
libbpf: map 'ch_rings': found key [6], sz = 4.
libbpf: map 'ch_rings': found value [6], sz = 4.
libbpf: map 'ch_rings': found max_entries = 33554944.
libbpf: map 'ch_rings': found map_flags = 0x0.
libbpf: map 'reals': at sec_idx 6, offset 200.
libbpf: map 'reals': found type = 2.
libbpf: map 'reals': found key [6], sz = 4.
libbpf: map 'reals': found value [65], sz = 20.
libbpf: map 'reals': found max_entries = 4096.
libbpf: map 'reals': found map_flags = 0x0.
libbpf: map 'reals_stats': at sec_idx 6, offset 240.
libbpf: map 'reals_stats': found type = 6.
libbpf: map 'reals_stats': found key [6], sz = 4.
libbpf: map 'reals_stats': found value [74], sz = 16.
libbpf: map 'reals_stats': found max_entries = 4096.
libbpf: map 'reals_stats': found map_flags = 0x0.
libbpf: map 'lru_miss_stats': at sec_idx 6, offset 280.
libbpf: map 'lru_miss_stats': found type = 6.
libbpf: map 'lru_miss_stats': found key [6], sz = 4.
libbpf: map 'lru_miss_stats': found value [6], sz = 4.
libbpf: map 'lru_miss_stats': found max_entries = 4096.
libbpf: map 'lru_miss_stats': found map_flags = 0x0.
libbpf: map 'vip_miss_stats': at sec_idx 6, offset 320.
libbpf: map 'vip_miss_stats': found type = 2.
libbpf: map 'vip_miss_stats': found key [6], sz = 4.
libbpf: map 'vip_miss_stats': found value [25], sz = 20.
libbpf: map 'vip_miss_stats': found max_entries = 1.
libbpf: map 'vip_miss_stats': found map_flags = 0x0.
libbpf: map 'stats': at sec_idx 6, offset 360.
libbpf: map 'stats': found type = 6.
libbpf: map 'stats': found key [6], sz = 4.
libbpf: map 'stats': found value [74], sz = 16.
libbpf: map 'stats': found max_entries = 1024.
libbpf: map 'stats': found map_flags = 0x0.
libbpf: map 'quic_stats_map': at sec_idx 6, offset 400.
libbpf: map 'quic_stats_map': found type = 6.
libbpf: map 'quic_stats_map': found key [6], sz = 4.
libbpf: map 'quic_stats_map': found value [86], sz = 104.
libbpf: map 'quic_stats_map': found max_entries = 1.
libbpf: map 'quic_stats_map': found map_flags = 0x0.
libbpf: map 'decap_vip_stats': at sec_idx 6, offset 440.
libbpf: map 'decap_vip_stats': found type = 6.
libbpf: map 'decap_vip_stats': found key [6], sz = 4.
libbpf: map 'decap_vip_stats': found value [74], sz = 16.
libbpf: map 'decap_vip_stats': found max_entries = 512.
libbpf: map 'decap_vip_stats': found map_flags = 0x0.
libbpf: map 'server_id_map': at sec_idx 6, offset 480.
libbpf: map 'server_id_map': found type = 2.
libbpf: map 'server_id_map': found key [6], sz = 4.
libbpf: map 'server_id_map': found value [6], sz = 4.
libbpf: map 'server_id_map': found max_entries = 16777214.
libbpf: map 'server_id_map': found map_flags = 0x0.
libbpf: map 'tpr_stats_map': at sec_idx 6, offset 520.
libbpf: map 'tpr_stats_map': found type = 6.
libbpf: map 'tpr_stats_map': found key [6], sz = 4.
libbpf: map 'tpr_stats_map': found value [96], sz = 32.
libbpf: map 'tpr_stats_map': found max_entries = 1.
libbpf: map 'tpr_stats_map': found map_flags = 0x0.
libbpf: map 'server_id_stats': at sec_idx 6, offset 560.
libbpf: map 'server_id_stats': found type = 6.
libbpf: map 'server_id_stats': found key [6], sz = 4.
libbpf: map 'server_id_stats': found value [74], sz = 16.
libbpf: map 'server_id_stats': found max_entries = 512.
libbpf: map 'server_id_stats': found map_flags = 0x0.
libbpf: sec '.relxdp': collecting relocation for section(3) 'xdp'
libbpf: sec '.relxdp': relo #0: insn #329 against 'vip_map'
libbpf: prog 'balancer_ingress': found map 1 (vip_map, sec 6, off 40) for insn #329
libbpf: sec '.relxdp': relo #1: insn #337 against 'vip_map'
libbpf: prog 'balancer_ingress': found map 1 (vip_map, sec 6, off 40) for insn #337
libbpf: sec '.relxdp': relo #2: insn #361 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #361
libbpf: sec '.relxdp': relo #3: insn #382 against 'lru_mapping'
libbpf: prog 'balancer_ingress': found map 3 (lru_mapping, sec 6, off 120) for insn #382
libbpf: sec '.relxdp': relo #4: insn #391 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #391
libbpf: sec '.relxdp': relo #5: insn #398 against 'fallback_cache'
libbpf: prog 'balancer_ingress': found map 2 (fallback_cache, sec 6, off 80) for insn #398
libbpf: sec '.relxdp': relo #6: insn #413 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #413
libbpf: sec '.relxdp': relo #7: insn #435 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #435
libbpf: sec '.relxdp': relo #8: insn #503 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #503
libbpf: sec '.relxdp': relo #9: insn #551 against 'vip_map'
libbpf: prog 'balancer_ingress': found map 1 (vip_map, sec 6, off 40) for insn #551
libbpf: sec '.relxdp': relo #10: insn #559 against 'vip_map'
libbpf: prog 'balancer_ingress': found map 1 (vip_map, sec 6, off 40) for insn #559
libbpf: sec '.relxdp': relo #11: insn #579 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #579
libbpf: sec '.relxdp': relo #12: insn #600 against 'lru_mapping'
libbpf: prog 'balancer_ingress': found map 3 (lru_mapping, sec 6, off 120) for insn #600
libbpf: sec '.relxdp': relo #13: insn #609 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #609
libbpf: sec '.relxdp': relo #14: insn #616 against 'fallback_cache'
libbpf: prog 'balancer_ingress': found map 2 (fallback_cache, sec 6, off 80) for insn #616
libbpf: sec '.relxdp': relo #15: insn #630 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #630
libbpf: sec '.relxdp': relo #16: insn #651 against 'quic_stats_map'
libbpf: prog 'balancer_ingress': found map 10 (quic_stats_map, sec 6, off 400) for insn #651
libbpf: sec '.relxdp': relo #17: insn #684 against 'quic_stats_map'
libbpf: prog 'balancer_ingress': found map 10 (quic_stats_map, sec 6, off 400) for insn #684
libbpf: sec '.relxdp': relo #18: insn #749 against 'reals'
libbpf: prog 'balancer_ingress': found map 5 (reals, sec 6, off 200) for insn #749
libbpf: sec '.relxdp': relo #19: insn #760 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #760
libbpf: sec '.relxdp': relo #20: insn #781 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #781
libbpf: sec '.relxdp': relo #21: insn #904 against 'ch_rings'
libbpf: prog 'balancer_ingress': found map 4 (ch_rings, sec 6, off 160) for insn #904
libbpf: sec '.relxdp': relo #22: insn #915 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #915
libbpf: sec '.relxdp': relo #23: insn #926 against 'reals'
libbpf: prog 'balancer_ingress': found map 5 (reals, sec 6, off 200) for insn #926
libbpf: sec '.relxdp': relo #24: insn #934 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #934
libbpf: sec '.relxdp': relo #25: insn #969 against 'vip_miss_stats'
libbpf: prog 'balancer_ingress': found map 8 (vip_miss_stats, sec 6, off 320) for insn #969
libbpf: sec '.relxdp': relo #26: insn #986 against 'lru_miss_stats'
libbpf: prog 'balancer_ingress': found map 7 (lru_miss_stats, sec 6, off 280) for insn #986
libbpf: sec '.relxdp': relo #27: insn #999 against 'ctl_array'
libbpf: prog 'balancer_ingress': found map 0 (ctl_array, sec 6, off 0) for insn #999
libbpf: sec '.relxdp': relo #28: insn #1007 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #1007
libbpf: sec '.relxdp': relo #29: insn #1021 against 'reals_stats'
libbpf: prog 'balancer_ingress': found map 6 (reals_stats, sec 6, off 240) for insn #1021
libbpf: sec '.relxdp': relo #30: insn #1152 against 'server_id_stats'
libbpf: prog 'balancer_ingress': found map 14 (server_id_stats, sec 6, off 560) for insn #1152
libbpf: sec '.relxdp': relo #31: insn #1193 against 'server_id_map'
libbpf: prog 'balancer_ingress': found map 12 (server_id_map, sec 6, off 480) for insn #1193
libbpf: sec '.relxdp': relo #32: insn #1203 against 'reals'
libbpf: prog 'balancer_ingress': found map 5 (reals, sec 6, off 200) for insn #1203
libbpf: sec '.relxdp': relo #33: insn #1253 against 'reals'
libbpf: prog 'balancer_ingress': found map 5 (reals, sec 6, off 200) for insn #1253
libbpf: sec '.relxdp': relo #34: insn #1266 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #1266
libbpf: sec '.relxdp': relo #35: insn #1289 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #1289
libbpf: sec '.relxdp': relo #36: insn #1584 against 'ch_rings'
libbpf: prog 'balancer_ingress': found map 4 (ch_rings, sec 6, off 160) for insn #1584
libbpf: sec '.relxdp': relo #37: insn #1597 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #1597
libbpf: sec '.relxdp': relo #38: insn #1608 against 'reals'
libbpf: prog 'balancer_ingress': found map 5 (reals, sec 6, off 200) for insn #1608
libbpf: sec '.relxdp': relo #39: insn #1617 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #1617
libbpf: sec '.relxdp': relo #40: insn #1646 against 'vip_miss_stats'
libbpf: prog 'balancer_ingress': found map 8 (vip_miss_stats, sec 6, off 320) for insn #1646
libbpf: sec '.relxdp': relo #41: insn #1676 against 'lru_miss_stats'
libbpf: prog 'balancer_ingress': found map 7 (lru_miss_stats, sec 6, off 280) for insn #1676
libbpf: sec '.relxdp': relo #42: insn #1690 against 'ctl_array'
libbpf: prog 'balancer_ingress': found map 0 (ctl_array, sec 6, off 0) for insn #1690
libbpf: sec '.relxdp': relo #43: insn #1698 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #1698
libbpf: sec '.relxdp': relo #44: insn #1713 against 'reals_stats'
libbpf: prog 'balancer_ingress': found map 6 (reals_stats, sec 6, off 240) for insn #1713
libbpf: sec '.relxdp': relo #45: insn #2040 against 'server_id_stats'
libbpf: prog 'balancer_ingress': found map 14 (server_id_stats, sec 6, off 560) for insn #2040
libbpf: sec '.relxdp': relo #46: insn #2081 against 'server_id_map'
libbpf: prog 'balancer_ingress': found map 12 (server_id_map, sec 6, off 480) for insn #2081
libbpf: sec '.relxdp': relo #47: insn #2091 against 'reals'
libbpf: prog 'balancer_ingress': found map 5 (reals, sec 6, off 200) for insn #2091
libbpf: sec '.relxdp': relo #48: insn #2113 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #2113
libbpf: sec '.relxdp': relo #49: insn #2148 against 'server_id_stats'
libbpf: prog 'balancer_ingress': found map 14 (server_id_stats, sec 6, off 560) for insn #2148
libbpf: sec '.relxdp': relo #50: insn #2188 against 'stats'
libbpf: prog 'balancer_ingress': found map 9 (stats, sec 6, off 360) for insn #2188
libbpf: sec '.relxdp': relo #51: insn #2224 against 'server_id_stats'
libbpf: prog 'balancer_ingress': found map 14 (server_id_stats, sec 6, off 560) for insn #2224
[2024-06-09 22:13:52.953] [info] [syscall_server_utils.cpp:24] Initialize syscall server
[2024-06-09 22:13:52][info][1316749] Global shm constructed. shm_open_type 0 for bpftime_maps_shm
[2024-06-09 22:13:52][info][1316749] Global shm initialized
[2024-06-09 22:13:52][info][1316749] Enabling helper groups ufunc, kernel, shm_map by default
[2024-06-09 22:13:52][info][1316749] bpftime-syscall-server started
libbpf: map 'ctl_array': created successfully, fd=4
libbpf: map 'vip_map': created successfully, fd=5
[2024-06-09 22:13:52][info][1316749] non-builtin map type: 9
libbpf: map 'fallback_cache': created successfully, fd=6
[2024-06-09 22:13:52][info][1316749] non-builtin map type: 9
[2024-06-09 22:13:52][error][1316749] Unsupported map type: 9
libbpf: map 'lru_mapping': created successfully, fd=8
[2024-06-09 22:13:52][warning][1316749] Map entries 33554944 is larger than the max entries 1048576. Set to max entries
libbpf: map 'ch_rings': created successfully, fd=7
libbpf: map 'reals': created successfully, fd=9
libbpf: map 'reals_stats': created successfully, fd=10
libbpf: map 'lru_miss_stats': created successfully, fd=11
libbpf: map 'vip_miss_stats': created successfully, fd=12
libbpf: map 'stats': created successfully, fd=13
libbpf: map 'quic_stats_map': created successfully, fd=14
libbpf: map 'decap_vip_stats': created successfully, fd=15
[2024-06-09 22:13:52][warning][1316749] Map entries 16777214 is larger than the max entries 1048576. Set to max entries
libbpf: map 'server_id_map': created successfully, fd=16
libbpf: map 'tpr_stats_map': created successfully, fd=17
libbpf: map 'server_id_stats': created successfully, fd=18
Found vip map
Found ctl array
Found lru mapping
[2024-06-09 22:50:19][info][1334164] non-builtin map type: 9
cache size 2000
lru map fd 20
load prog balancer_ingressXDP native mode
attach maybe error
```