
loop1.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <add_arrays>:
   0:	8b 57 08             	mov    0x8(%rdi),%edx
   3:	48 8b 0f             	mov    (%rdi),%rcx
   6:	29 ca                	sub    %ecx,%edx
   8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
   d:	83 fa 40             	cmp    $0x40,%edx
  10:	7c 54                	jl     66 <add_arrays+0x66>
  12:	f3 0f 6f 01          	movdqu (%rcx),%xmm0
  16:	66 0f 76 c9          	pcmpeqd %xmm1,%xmm1
  1a:	66 0f f8 c1          	psubb  %xmm1,%xmm0
  1e:	66 0f 7f 44 24 b8    	movdqa %xmm0,-0x48(%rsp)
  24:	f3 0f 6f 51 10       	movdqu 0x10(%rcx),%xmm2
  29:	66 0f f8 d1          	psubb  %xmm1,%xmm2
  2d:	66 0f 7f 54 24 c8    	movdqa %xmm2,-0x38(%rsp)
  33:	f3 0f 6f 59 20       	movdqu 0x20(%rcx),%xmm3
  38:	66 0f f8 d9          	psubb  %xmm1,%xmm3
  3c:	66 0f 7f 5c 24 d8    	movdqa %xmm3,-0x28(%rsp)
  42:	f3 0f 6f 61 30       	movdqu 0x30(%rcx),%xmm4
  47:	66 0f f8 e1          	psubb  %xmm1,%xmm4
  4b:	66 0f 7f 64 24 e8    	movdqa %xmm4,-0x18(%rsp)
  51:	f3 0f 7f 61 30       	movdqu %xmm4,0x30(%rcx)
  56:	f3 0f 7f 59 20       	movdqu %xmm3,0x20(%rcx)
  5b:	f3 0f 7f 51 10       	movdqu %xmm2,0x10(%rcx)
  60:	f3 0f 7f 01          	movdqu %xmm0,(%rcx)
  64:	31 c0                	xor    %eax,%eax
  66:	c3                   	ret    
