
xdp_tx.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <batch_xdp_pass>:
   0:	31 c0                	xor    %eax,%eax
   2:	eb 16                	jmp    1a <batch_xdp_pass+0x1a>
   4:	66 2e 0f 1f 84 00 00 	cs nopw 0x0(%rax,%rax,1)
   b:	00 00 00 
   e:	66 90                	xchg   %ax,%ax
  10:	48 83 c0 01          	add    $0x1,%rax
  14:	48 83 f8 10          	cmp    $0x10,%rax
  18:	74 2f                	je     49 <batch_xdp_pass+0x49>
  1a:	48 8b 14 c7          	mov    (%rdi,%rax,8),%rdx
  1e:	48 8b 0a             	mov    (%rdx),%rcx
  21:	48 8d 71 0e          	lea    0xe(%rcx),%rsi
  25:	48 3b 72 08          	cmp    0x8(%rdx),%rsi
  29:	77 e5                	ja     10 <batch_xdp_pass+0x10>
  2b:	44 8b 01             	mov    (%rcx),%r8d
  2e:	0f b7 71 04          	movzwl 0x4(%rcx),%esi
  32:	0f b7 51 06          	movzwl 0x6(%rcx),%edx
  36:	66 89 11             	mov    %dx,(%rcx)
  39:	8b 51 08             	mov    0x8(%rcx),%edx
  3c:	89 51 02             	mov    %edx,0x2(%rcx)
  3f:	44 89 41 06          	mov    %r8d,0x6(%rcx)
  43:	66 89 71 0a          	mov    %si,0xa(%rcx)
  47:	eb c7                	jmp    10 <batch_xdp_pass+0x10>
  49:	b8 03 00 00 00       	mov    $0x3,%eax
  4e:	c3                   	ret    
