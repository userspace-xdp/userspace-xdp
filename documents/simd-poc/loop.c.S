
loop.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <add_arrays>:
   0:	48 c7 c0 00 fc ff ff 	mov    $0xfffffffffffffc00,%rax
   7:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
   e:	00 00 
  10:	f3 0f 6f 84 87 00 20 	movdqu 0x2000(%rdi,%rax,4),%xmm0
  17:	00 00 
  19:	f3 0f 6f 8c 87 10 20 	movdqu 0x2010(%rdi,%rax,4),%xmm1
  20:	00 00 
  22:	f3 0f 6f 94 87 00 10 	movdqu 0x1000(%rdi,%rax,4),%xmm2
  29:	00 00 
  2b:	66 0f fe d0          	paddd  %xmm0,%xmm2
  2f:	f3 0f 6f 84 87 10 10 	movdqu 0x1010(%rdi,%rax,4),%xmm0
  36:	00 00 
  38:	66 0f fe c1          	paddd  %xmm1,%xmm0
  3c:	f3 0f 6f 8c 87 20 10 	movdqu 0x1020(%rdi,%rax,4),%xmm1
  43:	00 00 
  45:	f3 0f 6f 9c 87 30 10 	movdqu 0x1030(%rdi,%rax,4),%xmm3
  4c:	00 00 
  4e:	f3 0f 7f 94 87 00 30 	movdqu %xmm2,0x3000(%rdi,%rax,4)
  55:	00 00 
  57:	f3 0f 7f 84 87 10 30 	movdqu %xmm0,0x3010(%rdi,%rax,4)
  5e:	00 00 
  60:	f3 0f 6f 84 87 20 20 	movdqu 0x2020(%rdi,%rax,4),%xmm0
  67:	00 00 
  69:	66 0f fe c1          	paddd  %xmm1,%xmm0
  6d:	f3 0f 6f 8c 87 30 20 	movdqu 0x2030(%rdi,%rax,4),%xmm1
  74:	00 00 
  76:	66 0f fe cb          	paddd  %xmm3,%xmm1
  7a:	f3 0f 7f 84 87 20 30 	movdqu %xmm0,0x3020(%rdi,%rax,4)
  81:	00 00 
  83:	f3 0f 7f 8c 87 30 30 	movdqu %xmm1,0x3030(%rdi,%rax,4)
  8a:	00 00 
  8c:	48 83 c0 10          	add    $0x10,%rax
  90:	0f 85 7a ff ff ff    	jne    10 <add_arrays+0x10>
  96:	c3                   	ret
