
xxhash32.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <xxhash32>:
   0:	55                   	push   %rbp
   1:	53                   	push   %rbx
   2:	83 fe 10             	cmp    $0x10,%esi
   5:	0f 82 99 00 00 00    	jb     a4 <xxhash32+0xa4>
   b:	44 8d 82 28 44 23 24 	lea    0x24234428(%rdx),%r8d
  12:	44 8d 8a 77 ca eb 85 	lea    -0x7a143589(%rdx),%r9d
  19:	44 8d 92 4f 86 c8 61 	lea    0x61c8864f(%rdx),%r10d
  20:	41 89 f3             	mov    %esi,%r11d
  23:	48 89 f8             	mov    %rdi,%rax
  26:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  2d:	00 00 00 
  30:	69 08 77 ca eb 85    	imul   $0x85ebca77,(%rax),%ecx
  36:	44 01 c1             	add    %r8d,%ecx
  39:	c1 c1 0d             	rol    $0xd,%ecx
  3c:	69 58 04 77 ca eb 85 	imul   $0x85ebca77,0x4(%rax),%ebx
  43:	41 83 c3 f0          	add    $0xfffffff0,%r11d
  47:	44 01 cb             	add    %r9d,%ebx
  4a:	c1 c3 0d             	rol    $0xd,%ebx
  4d:	44 69 c1 b1 79 37 9e 	imul   $0x9e3779b1,%ecx,%r8d
  54:	69 48 08 77 ca eb 85 	imul   $0x85ebca77,0x8(%rax),%ecx
  5b:	01 d1                	add    %edx,%ecx
  5d:	c1 c1 0d             	rol    $0xd,%ecx
  60:	69 68 0c 77 ca eb 85 	imul   $0x85ebca77,0xc(%rax),%ebp
  67:	44 69 cb b1 79 37 9e 	imul   $0x9e3779b1,%ebx,%r9d
  6e:	44 01 d5             	add    %r10d,%ebp
  71:	c1 c5 0d             	rol    $0xd,%ebp
  74:	69 d1 b1 79 37 9e    	imul   $0x9e3779b1,%ecx,%edx
  7a:	44 69 d5 b1 79 37 9e 	imul   $0x9e3779b1,%ebp,%r10d
  81:	48 83 c0 10          	add    $0x10,%rax
  85:	41 83 fb 0f          	cmp    $0xf,%r11d
  89:	77 a5                	ja     30 <xxhash32+0x30>
  8b:	41 d1 c0             	rol    %r8d
  8e:	41 c1 c1 07          	rol    $0x7,%r9d
  92:	45 01 c1             	add    %r8d,%r9d
  95:	c1 c2 0c             	rol    $0xc,%edx
  98:	44 01 ca             	add    %r9d,%edx
  9b:	41 c1 c2 12          	rol    $0x12,%r10d
  9f:	41 01 d2             	add    %edx,%r10d
  a2:	eb 09                	jmp    ad <xxhash32+0xad>
  a4:	81 c2 b1 67 56 16    	add    $0x165667b1,%edx
  aa:	41 89 d2             	mov    %edx,%r10d
  ad:	41 01 f2             	add    %esi,%r10d
  b0:	89 f0                	mov    %esi,%eax
  b2:	83 e0 f0             	and    $0xfffffff0,%eax
  b5:	48 01 c7             	add    %rax,%rdi
  b8:	83 e6 0f             	and    $0xf,%esi
  bb:	eb 25                	jmp    e2 <xxhash32+0xe2>
  bd:	0f 1f 00             	nopl   (%rax)
  c0:	69 07 3d ae b2 c2    	imul   $0xc2b2ae3d,(%rdi),%eax
  c6:	44 01 d0             	add    %r10d,%eax
  c9:	c1 c0 11             	rol    $0x11,%eax
  cc:	44 69 d0 2f eb d4 27 	imul   $0x27d4eb2f,%eax,%r10d
  d3:	b8 fc ff ff ff       	mov    $0xfffffffc,%eax
  d8:	b9 04 00 00 00       	mov    $0x4,%ecx
  dd:	48 01 cf             	add    %rcx,%rdi
  e0:	01 c6                	add    %eax,%esi
  e2:	83 fe 04             	cmp    $0x4,%esi
  e5:	73 d9                	jae    c0 <xxhash32+0xc0>
  e7:	85 f6                	test   %esi,%esi
  e9:	74 22                	je     10d <xxhash32+0x10d>
  eb:	0f b6 07             	movzbl (%rdi),%eax
  ee:	69 c0 b1 67 56 16    	imul   $0x165667b1,%eax,%eax
  f4:	44 01 d0             	add    %r10d,%eax
  f7:	c1 c0 0b             	rol    $0xb,%eax
  fa:	44 69 d0 b1 79 37 9e 	imul   $0x9e3779b1,%eax,%r10d
 101:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 106:	b9 01 00 00 00       	mov    $0x1,%ecx
 10b:	eb d0                	jmp    dd <xxhash32+0xdd>
 10d:	44 89 d0             	mov    %r10d,%eax
 110:	c1 e8 0f             	shr    $0xf,%eax
 113:	44 31 d0             	xor    %r10d,%eax
 116:	69 c0 77 ca eb 85    	imul   $0x85ebca77,%eax,%eax
 11c:	89 c1                	mov    %eax,%ecx
 11e:	c1 e9 0d             	shr    $0xd,%ecx
 121:	31 c1                	xor    %eax,%ecx
 123:	69 c9 3d ae b2 c2    	imul   $0xc2b2ae3d,%ecx,%ecx
 129:	89 c8                	mov    %ecx,%eax
 12b:	c1 e8 10             	shr    $0x10,%eax
 12e:	31 c8                	xor    %ecx,%eax
 130:	5b                   	pop    %rbx
 131:	5d                   	pop    %rbp
 132:	c3                   	ret    
