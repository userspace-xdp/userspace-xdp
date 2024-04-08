
loop.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <add_arrays>:
   0:	48 8b 07             	mov    (%rdi),%rax
   3:	48 8b 57 08          	mov    0x8(%rdi),%rdx
   7:	48 29 c2             	sub    %rax,%rdx
   a:	85 d2                	test   %edx,%edx
   c:	0f 8e ab 00 00 00    	jle    bd <add_arrays+0xbd>
  12:	89 d1                	mov    %edx,%ecx
  14:	48 83 f9 08          	cmp    $0x8,%rcx
  18:	73 07                	jae    21 <add_arrays+0x21>
  1a:	31 f6                	xor    %esi,%esi
  1c:	e9 8f 00 00 00       	jmp    b0 <add_arrays+0xb0>
  21:	83 f9 20             	cmp    $0x20,%ecx
  24:	73 04                	jae    2a <add_arrays+0x2a>
  26:	31 f6                	xor    %esi,%esi
  28:	eb 48                	jmp    72 <add_arrays+0x72>
  2a:	41 89 d0             	mov    %edx,%r8d
  2d:	41 83 e0 1f          	and    $0x1f,%r8d
  31:	48 89 ce             	mov    %rcx,%rsi
  34:	4c 29 c6             	sub    %r8,%rsi
  37:	31 ff                	xor    %edi,%edi
  39:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  3d:	0f 1f 00             	nopl   (%rax)
  40:	f3 0f 6f 0c 38       	movdqu (%rax,%rdi,1),%xmm1
  45:	f3 0f 6f 54 38 10    	movdqu 0x10(%rax,%rdi,1),%xmm2
  4b:	66 0f f8 c8          	psubb  %xmm0,%xmm1
  4f:	66 0f f8 d0          	psubb  %xmm0,%xmm2
  53:	f3 0f 7f 0c 38       	movdqu %xmm1,(%rax,%rdi,1)
  58:	f3 0f 7f 54 38 10    	movdqu %xmm2,0x10(%rax,%rdi,1)
  5e:	48 83 c7 20          	add    $0x20,%rdi
  62:	48 39 fe             	cmp    %rdi,%rsi
  65:	75 d9                	jne    40 <add_arrays+0x40>
  67:	4d 85 c0             	test   %r8,%r8
  6a:	74 51                	je     bd <add_arrays+0xbd>
  6c:	41 83 f8 08          	cmp    $0x8,%r8d
  70:	72 3e                	jb     b0 <add_arrays+0xb0>
  72:	48 89 f7             	mov    %rsi,%rdi
  75:	83 e2 07             	and    $0x7,%edx
  78:	48 89 ce             	mov    %rcx,%rsi
  7b:	48 29 d6             	sub    %rdx,%rsi
  7e:	66 0f 76 c0          	pcmpeqd %xmm0,%xmm0
  82:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
  89:	00 00 00 
  8c:	0f 1f 40 00          	nopl   0x0(%rax)
  90:	f3 0f 7e 0c 38       	movq   (%rax,%rdi,1),%xmm1
  95:	66 0f f8 c8          	psubb  %xmm0,%xmm1
  99:	66 0f d6 0c 38       	movq   %xmm1,(%rax,%rdi,1)
  9e:	48 83 c7 08          	add    $0x8,%rdi
  a2:	48 39 fe             	cmp    %rdi,%rsi
  a5:	75 e9                	jne    90 <add_arrays+0x90>
  a7:	48 85 d2             	test   %rdx,%rdx
  aa:	74 11                	je     bd <add_arrays+0xbd>
  ac:	0f 1f 40 00          	nopl   0x0(%rax)
  b0:	80 04 30 01          	addb   $0x1,(%rax,%rsi,1)
  b4:	48 83 c6 01          	add    $0x1,%rsi
  b8:	48 39 f1             	cmp    %rsi,%rcx
  bb:	75 f3                	jne    b0 <add_arrays+0xb0>
  bd:	31 c0                	xor    %eax,%eax
  bf:	c3                   	ret    
