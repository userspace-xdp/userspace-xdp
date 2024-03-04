
loop.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <add_arrays>:
   0:	48 89 d0             	mov    %rdx,%rax
   3:	48 29 f8             	sub    %rdi,%rax
   6:	48 83 f8 20          	cmp    $0x20,%rax
   a:	72 77                	jb     83 <add_arrays+0x83>
   c:	48 89 d0             	mov    %rdx,%rax
   f:	48 29 f0             	sub    %rsi,%rax
  12:	48 83 f8 20          	cmp    $0x20,%rax
  16:	72 6b                	jb     83 <add_arrays+0x83>
  18:	31 c0                	xor    %eax,%eax
  1a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)
  20:	f3 0f 6f 04 87       	movdqu (%rdi,%rax,4),%xmm0
  25:	f3 0f 6f 4c 87 10    	movdqu 0x10(%rdi,%rax,4),%xmm1
  2b:	f3 0f 6f 14 86       	movdqu (%rsi,%rax,4),%xmm2
  30:	66 0f fe d0          	paddd  %xmm0,%xmm2
  34:	f3 0f 6f 44 86 10    	movdqu 0x10(%rsi,%rax,4),%xmm0
  3a:	66 0f fe c1          	paddd  %xmm1,%xmm0
  3e:	f3 0f 7f 14 82       	movdqu %xmm2,(%rdx,%rax,4)
  43:	f3 0f 7f 44 82 10    	movdqu %xmm0,0x10(%rdx,%rax,4)
  49:	f3 0f 6f 44 87 20    	movdqu 0x20(%rdi,%rax,4),%xmm0
  4f:	f3 0f 6f 4c 87 30    	movdqu 0x30(%rdi,%rax,4),%xmm1
  55:	f3 0f 6f 54 86 20    	movdqu 0x20(%rsi,%rax,4),%xmm2
  5b:	66 0f fe d0          	paddd  %xmm0,%xmm2
  5f:	f3 0f 6f 44 86 30    	movdqu 0x30(%rsi,%rax,4),%xmm0
  65:	66 0f fe c1          	paddd  %xmm1,%xmm0
  69:	f3 0f 7f 54 82 20    	movdqu %xmm2,0x20(%rdx,%rax,4)
  6f:	f3 0f 7f 44 82 30    	movdqu %xmm0,0x30(%rdx,%rax,4)
  75:	48 83 c0 10          	add    $0x10,%rax
  79:	48 3d 00 04 00 00    	cmp    $0x400,%rax
  7f:	75 9f                	jne    20 <add_arrays+0x20>
  81:	eb 46                	jmp    c9 <add_arrays+0xc9>
  83:	31 c0                	xor    %eax,%eax
  85:	66 66 2e 0f 1f 84 00 	data16 cs nopw 0x0(%rax,%rax,1)
  8c:	00 00 00 00 
  90:	8b 0c 86             	mov    (%rsi,%rax,4),%ecx
  93:	03 0c 87             	add    (%rdi,%rax,4),%ecx
  96:	89 0c 82             	mov    %ecx,(%rdx,%rax,4)
  99:	8b 4c 86 04          	mov    0x4(%rsi,%rax,4),%ecx
  9d:	03 4c 87 04          	add    0x4(%rdi,%rax,4),%ecx
  a1:	89 4c 82 04          	mov    %ecx,0x4(%rdx,%rax,4)
  a5:	8b 4c 86 08          	mov    0x8(%rsi,%rax,4),%ecx
  a9:	03 4c 87 08          	add    0x8(%rdi,%rax,4),%ecx
  ad:	89 4c 82 08          	mov    %ecx,0x8(%rdx,%rax,4)
  b1:	8b 4c 86 0c          	mov    0xc(%rsi,%rax,4),%ecx
  b5:	03 4c 87 0c          	add    0xc(%rdi,%rax,4),%ecx
  b9:	89 4c 82 0c          	mov    %ecx,0xc(%rdx,%rax,4)
  bd:	48 83 c0 04          	add    $0x4,%rax
  c1:	48 3d 00 04 00 00    	cmp    $0x400,%rax
  c7:	75 c7                	jne    90 <add_arrays+0x90>
  c9:	c3                   	ret
