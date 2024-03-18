
xdp_tx.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <batch_xdp_pass>:
   0:	85 f6                	test   %esi,%esi
   2:	7e 43                	jle    47 <batch_xdp_pass+0x47>
   4:	41 89 f0             	mov    %esi,%r8d
   7:	31 c9                	xor    %ecx,%ecx
   9:	eb 0d                	jmp    18 <batch_xdp_pass+0x18>
   b:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)
  10:	48 ff c1             	inc    %rcx
  13:	49 39 c8             	cmp    %rcx,%r8
  16:	74 2f                	je     47 <batch_xdp_pass+0x47>
  18:	48 8b 34 cf          	mov    (%rdi,%rcx,8),%rsi
  1c:	48 8b 16             	mov    (%rsi),%rdx
  1f:	48 8d 42 0e          	lea    0xe(%rdx),%rax
  23:	48 3b 46 08          	cmp    0x8(%rsi),%rax
  27:	77 e7                	ja     10 <batch_xdp_pass+0x10>
  29:	44 0f b7 4a 04       	movzwl 0x4(%rdx),%r9d
  2e:	8b 72 06             	mov    0x6(%rdx),%esi
  31:	0f b7 42 0a          	movzwl 0xa(%rdx),%eax
  35:	66 89 42 04          	mov    %ax,0x4(%rdx)
  39:	8b 02                	mov    (%rdx),%eax
  3b:	89 32                	mov    %esi,(%rdx)
  3d:	89 42 06             	mov    %eax,0x6(%rdx)
  40:	66 44 89 4a 0a       	mov    %r9w,0xa(%rdx)
  45:	eb c9                	jmp    10 <batch_xdp_pass+0x10>
  47:	b8 03 00 00 00       	mov    $0x3,%eax
  4c:	c3                   	ret    
