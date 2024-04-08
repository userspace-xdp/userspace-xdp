
xxhash64.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <xxhash64>:
   0:	55                   	push   %rbp
   1:	41 57                	push   %r15
   3:	41 56                	push   %r14
   5:	41 55                	push   %r13
   7:	41 54                	push   %r12
   9:	53                   	push   %rbx
   a:	49 89 f9             	mov    %rdi,%r9
   d:	49 ba 4f eb d4 27 3d 	movabs $0xc2b2ae3d27d4eb4f,%r10
  14:	ae b2 c2 
  17:	49 bb 87 ca eb 85 b1 	movabs $0x9e3779b185ebca87,%r11
  1e:	79 37 9e 
  21:	49 b8 63 ae b2 c2 77 	movabs $0x85ebca77c2b2ae63,%r8
  28:	ca eb 85 
  2b:	48 bd c5 67 56 16 2f 	movabs $0x27d4eb2f165667c5,%rbp
  32:	eb d4 27 
  35:	48 83 fe 20          	cmp    $0x20,%rsi
  39:	0f 82 1c 01 00 00    	jb     15b <xxhash64+0x15b>
  3f:	49 bd d6 b5 c0 ad ee 	movabs $0x60ea27eeadc0b5d6,%r13
  46:	27 ea 60 
  49:	49 01 d5             	add    %rdx,%r13
  4c:	4e 8d 24 12          	lea    (%rdx,%r10,1),%r12
  50:	49 be 79 35 14 7a 4e 	movabs $0x61c8864e7a143579,%r14
  57:	86 c8 61 
  5a:	49 01 d6             	add    %rdx,%r14
  5d:	48 89 f5             	mov    %rsi,%rbp
  60:	4c 89 cf             	mov    %r9,%rdi
  63:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  6a:	00 00 00 
  6d:	0f 1f 00             	nopl   (%rax)
  70:	48 83 c5 e0          	add    $0xffffffffffffffe0,%rbp
  74:	48 8b 0f             	mov    (%rdi),%rcx
  77:	49 0f af ca          	imul   %r10,%rcx
  7b:	4c 01 e9             	add    %r13,%rcx
  7e:	48 c1 c1 1f          	rol    $0x1f,%rcx
  82:	49 89 cd             	mov    %rcx,%r13
  85:	48 8b 5f 08          	mov    0x8(%rdi),%rbx
  89:	49 0f af da          	imul   %r10,%rbx
  8d:	4c 01 e3             	add    %r12,%rbx
  90:	48 c1 c3 1f          	rol    $0x1f,%rbx
  94:	4d 0f af eb          	imul   %r11,%r13
  98:	49 89 dc             	mov    %rbx,%r12
  9b:	4d 0f af e3          	imul   %r11,%r12
  9f:	4c 8b 7f 10          	mov    0x10(%rdi),%r15
  a3:	4d 0f af fa          	imul   %r10,%r15
  a7:	49 01 d7             	add    %rdx,%r15
  aa:	49 c1 c7 1f          	rol    $0x1f,%r15
  ae:	4c 89 fa             	mov    %r15,%rdx
  b1:	48 8b 47 18          	mov    0x18(%rdi),%rax
  b5:	49 0f af c2          	imul   %r10,%rax
  b9:	4c 01 f0             	add    %r14,%rax
  bc:	48 c1 c0 1f          	rol    $0x1f,%rax
  c0:	49 0f af d3          	imul   %r11,%rdx
  c4:	49 89 c6             	mov    %rax,%r14
  c7:	4d 0f af f3          	imul   %r11,%r14
  cb:	48 83 c7 20          	add    $0x20,%rdi
  cf:	48 83 fd 1f          	cmp    $0x1f,%rbp
  d3:	77 9b                	ja     70 <xxhash64+0x70>
  d5:	49 d1 c5             	rol    %r13
  d8:	49 c1 c4 07          	rol    $0x7,%r12
  dc:	4d 01 ec             	add    %r13,%r12
  df:	48 c1 c2 0c          	rol    $0xc,%rdx
  e3:	4c 01 e2             	add    %r12,%rdx
  e6:	49 c1 c6 12          	rol    $0x12,%r14
  ea:	49 01 d6             	add    %rdx,%r14
  ed:	48 ba a9 6c 79 0f 01 	movabs $0xdef35b010f796ca9,%rdx
  f4:	5b f3 de 
  f7:	48 0f af ca          	imul   %rdx,%rcx
  fb:	48 c1 c1 1f          	rol    $0x1f,%rcx
  ff:	49 0f af cb          	imul   %r11,%rcx
 103:	4c 31 f1             	xor    %r14,%rcx
 106:	49 0f af cb          	imul   %r11,%rcx
 10a:	4c 01 c1             	add    %r8,%rcx
 10d:	48 0f af da          	imul   %rdx,%rbx
 111:	48 c1 c3 1f          	rol    $0x1f,%rbx
 115:	49 0f af db          	imul   %r11,%rbx
 119:	48 31 cb             	xor    %rcx,%rbx
 11c:	49 0f af db          	imul   %r11,%rbx
 120:	4c 0f af fa          	imul   %rdx,%r15
 124:	49 c1 c7 1f          	rol    $0x1f,%r15
 128:	4c 01 c3             	add    %r8,%rbx
 12b:	4d 0f af fb          	imul   %r11,%r15
 12f:	49 31 df             	xor    %rbx,%r15
 132:	4d 0f af fb          	imul   %r11,%r15
 136:	4d 01 c7             	add    %r8,%r15
 139:	48 0f af c2          	imul   %rdx,%rax
 13d:	48 c1 c0 1f          	rol    $0x1f,%rax
 141:	49 0f af c3          	imul   %r11,%rax
 145:	4c 31 f8             	xor    %r15,%rax
 148:	49 0f af c3          	imul   %r11,%rax
 14c:	4c 01 c0             	add    %r8,%rax
 14f:	48 bd c5 67 56 16 2f 	movabs $0x27d4eb2f165667c5,%rbp
 156:	eb d4 27 
 159:	eb 06                	jmp    161 <xxhash64+0x161>
 15b:	48 01 ea             	add    %rbp,%rdx
 15e:	48 89 d0             	mov    %rdx,%rax
 161:	48 ba f9 79 37 9e b1 	movabs $0x165667b19e3779f9,%rdx
 168:	67 56 16 
 16b:	48 01 f0             	add    %rsi,%rax
 16e:	48 89 f1             	mov    %rsi,%rcx
 171:	48 83 e1 e0          	and    $0xffffffffffffffe0,%rcx
 175:	49 01 c9             	add    %rcx,%r9
 178:	83 e6 1f             	and    $0x1f,%esi
 17b:	eb 2d                	jmp    1aa <xxhash64+0x1aa>
 17d:	0f 1f 00             	nopl   (%rax)
 180:	41 8b 19             	mov    (%r9),%ebx
 183:	49 0f af db          	imul   %r11,%rbx
 187:	48 31 c3             	xor    %rax,%rbx
 18a:	48 c1 c3 17          	rol    $0x17,%rbx
 18e:	49 0f af da          	imul   %r10,%rbx
 192:	48 01 d3             	add    %rdx,%rbx
 195:	48 c7 c1 fc ff ff ff 	mov    $0xfffffffffffffffc,%rcx
 19c:	bf 04 00 00 00       	mov    $0x4,%edi
 1a1:	48 89 d8             	mov    %rbx,%rax
 1a4:	49 01 f9             	add    %rdi,%r9
 1a7:	48 01 ce             	add    %rcx,%rsi
 1aa:	48 83 fe 08          	cmp    $0x8,%rsi
 1ae:	73 30                	jae    1e0 <xxhash64+0x1e0>
 1b0:	48 83 fe 04          	cmp    $0x4,%rsi
 1b4:	73 ca                	jae    180 <xxhash64+0x180>
 1b6:	48 85 f6             	test   %rsi,%rsi
 1b9:	74 50                	je     20b <xxhash64+0x20b>
 1bb:	41 0f b6 19          	movzbl (%r9),%ebx
 1bf:	48 0f af dd          	imul   %rbp,%rbx
 1c3:	48 31 c3             	xor    %rax,%rbx
 1c6:	48 c1 c3 0b          	rol    $0xb,%rbx
 1ca:	49 0f af db          	imul   %r11,%rbx
 1ce:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
 1d5:	bf 01 00 00 00       	mov    $0x1,%edi
 1da:	eb c5                	jmp    1a1 <xxhash64+0x1a1>
 1dc:	0f 1f 40 00          	nopl   0x0(%rax)
 1e0:	49 8b 19             	mov    (%r9),%rbx
 1e3:	49 0f af da          	imul   %r10,%rbx
 1e7:	48 c1 c3 1f          	rol    $0x1f,%rbx
 1eb:	49 0f af db          	imul   %r11,%rbx
 1ef:	48 31 c3             	xor    %rax,%rbx
 1f2:	48 c1 c3 1b          	rol    $0x1b,%rbx
 1f6:	49 0f af db          	imul   %r11,%rbx
 1fa:	4c 01 c3             	add    %r8,%rbx
 1fd:	48 c7 c1 f8 ff ff ff 	mov    $0xfffffffffffffff8,%rcx
 204:	bf 08 00 00 00       	mov    $0x8,%edi
 209:	eb 96                	jmp    1a1 <xxhash64+0x1a1>
 20b:	48 89 c1             	mov    %rax,%rcx
 20e:	48 c1 e9 21          	shr    $0x21,%rcx
 212:	48 31 c1             	xor    %rax,%rcx
 215:	49 0f af ca          	imul   %r10,%rcx
 219:	48 89 ce             	mov    %rcx,%rsi
 21c:	48 c1 ee 1d          	shr    $0x1d,%rsi
 220:	48 31 ce             	xor    %rcx,%rsi
 223:	48 0f af f2          	imul   %rdx,%rsi
 227:	48 89 f0             	mov    %rsi,%rax
 22a:	48 c1 e8 20          	shr    $0x20,%rax
 22e:	48 31 f0             	xor    %rsi,%rax
 231:	5b                   	pop    %rbx
 232:	41 5c                	pop    %r12
 234:	41 5d                	pop    %r13
 236:	41 5e                	pop    %r14
 238:	41 5f                	pop    %r15
 23a:	5d                   	pop    %rbp
 23b:	c3                   	ret    
