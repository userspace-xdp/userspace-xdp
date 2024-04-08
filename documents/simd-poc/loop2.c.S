
loop2.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <add_arrays>:
   0:	f3 0f 6f 47 40       	movdqu 0x40(%rdi),%xmm0
   5:	f3 0f 6f 4f 50       	movdqu 0x50(%rdi),%xmm1
   a:	f3 0f 6f 57 60       	movdqu 0x60(%rdi),%xmm2
   f:	f3 0f 6f 5f 70       	movdqu 0x70(%rdi),%xmm3
  14:	66 0f 76 e4          	pcmpeqd %xmm4,%xmm4
  18:	66 0f f8 c4          	psubb  %xmm4,%xmm0
  1c:	f3 0f 7f 07          	movdqu %xmm0,(%rdi)
  20:	66 0f f8 cc          	psubb  %xmm4,%xmm1
  24:	f3 0f 7f 4f 10       	movdqu %xmm1,0x10(%rdi)
  29:	66 0f f8 d4          	psubb  %xmm4,%xmm2
  2d:	f3 0f 7f 57 20       	movdqu %xmm2,0x20(%rdi)
  32:	66 0f f8 dc          	psubb  %xmm4,%xmm3
  36:	f3 0f 7f 5f 30       	movdqu %xmm3,0x30(%rdi)
  3b:	31 c0                	xor    %eax,%eax
  3d:	c3                   	ret    
