
xdp_tx.o:     file format elf64-x86-64


Disassembly of section .text:

0000000000000000 <batch_xdp_pass>:
   0:	48 8b 0f             	mov    (%rdi),%rcx
   3:	48 8b 01             	mov    (%rcx),%rax
   6:	48 8d 50 0e          	lea    0xe(%rax),%rdx
   a:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
   e:	77 1a                	ja     2a <batch_xdp_pass+0x2a>
  10:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
  14:	8b 50 06             	mov    0x6(%rax),%edx
  17:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
  1b:	66 89 70 04          	mov    %si,0x4(%rax)
  1f:	8b 30                	mov    (%rax),%esi
  21:	89 10                	mov    %edx,(%rax)
  23:	89 70 06             	mov    %esi,0x6(%rax)
  26:	66 89 48 0a          	mov    %cx,0xa(%rax)
  2a:	48 8b 4f 08          	mov    0x8(%rdi),%rcx
  2e:	48 8b 01             	mov    (%rcx),%rax
  31:	48 8d 50 0e          	lea    0xe(%rax),%rdx
  35:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
  39:	77 1a                	ja     55 <batch_xdp_pass+0x55>
  3b:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
  3f:	8b 50 06             	mov    0x6(%rax),%edx
  42:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
  46:	66 89 70 04          	mov    %si,0x4(%rax)
  4a:	8b 30                	mov    (%rax),%esi
  4c:	89 10                	mov    %edx,(%rax)
  4e:	89 70 06             	mov    %esi,0x6(%rax)
  51:	66 89 48 0a          	mov    %cx,0xa(%rax)
  55:	48 8b 4f 10          	mov    0x10(%rdi),%rcx
  59:	48 8b 01             	mov    (%rcx),%rax
  5c:	48 8d 50 0e          	lea    0xe(%rax),%rdx
  60:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
  64:	77 1a                	ja     80 <batch_xdp_pass+0x80>
  66:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
  6a:	8b 50 06             	mov    0x6(%rax),%edx
  6d:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
  71:	66 89 70 04          	mov    %si,0x4(%rax)
  75:	8b 30                	mov    (%rax),%esi
  77:	89 10                	mov    %edx,(%rax)
  79:	89 70 06             	mov    %esi,0x6(%rax)
  7c:	66 89 48 0a          	mov    %cx,0xa(%rax)
  80:	48 8b 4f 18          	mov    0x18(%rdi),%rcx
  84:	48 8b 01             	mov    (%rcx),%rax
  87:	48 8d 50 0e          	lea    0xe(%rax),%rdx
  8b:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
  8f:	77 1a                	ja     ab <batch_xdp_pass+0xab>
  91:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
  95:	8b 50 06             	mov    0x6(%rax),%edx
  98:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
  9c:	66 89 70 04          	mov    %si,0x4(%rax)
  a0:	8b 30                	mov    (%rax),%esi
  a2:	89 10                	mov    %edx,(%rax)
  a4:	89 70 06             	mov    %esi,0x6(%rax)
  a7:	66 89 48 0a          	mov    %cx,0xa(%rax)
  ab:	48 8b 4f 20          	mov    0x20(%rdi),%rcx
  af:	48 8b 01             	mov    (%rcx),%rax
  b2:	48 8d 50 0e          	lea    0xe(%rax),%rdx
  b6:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
  ba:	77 1a                	ja     d6 <batch_xdp_pass+0xd6>
  bc:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
  c0:	8b 50 06             	mov    0x6(%rax),%edx
  c3:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
  c7:	66 89 70 04          	mov    %si,0x4(%rax)
  cb:	8b 30                	mov    (%rax),%esi
  cd:	89 10                	mov    %edx,(%rax)
  cf:	89 70 06             	mov    %esi,0x6(%rax)
  d2:	66 89 48 0a          	mov    %cx,0xa(%rax)
  d6:	48 8b 4f 28          	mov    0x28(%rdi),%rcx
  da:	48 8b 01             	mov    (%rcx),%rax
  dd:	48 8d 50 0e          	lea    0xe(%rax),%rdx
  e1:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
  e5:	77 1a                	ja     101 <batch_xdp_pass+0x101>
  e7:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
  eb:	8b 50 06             	mov    0x6(%rax),%edx
  ee:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
  f2:	66 89 70 04          	mov    %si,0x4(%rax)
  f6:	8b 30                	mov    (%rax),%esi
  f8:	89 10                	mov    %edx,(%rax)
  fa:	89 70 06             	mov    %esi,0x6(%rax)
  fd:	66 89 48 0a          	mov    %cx,0xa(%rax)
 101:	48 8b 4f 30          	mov    0x30(%rdi),%rcx
 105:	48 8b 01             	mov    (%rcx),%rax
 108:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 10c:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 110:	77 1a                	ja     12c <batch_xdp_pass+0x12c>
 112:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 116:	8b 50 06             	mov    0x6(%rax),%edx
 119:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 11d:	66 89 70 04          	mov    %si,0x4(%rax)
 121:	8b 30                	mov    (%rax),%esi
 123:	89 10                	mov    %edx,(%rax)
 125:	89 70 06             	mov    %esi,0x6(%rax)
 128:	66 89 48 0a          	mov    %cx,0xa(%rax)
 12c:	48 8b 4f 38          	mov    0x38(%rdi),%rcx
 130:	48 8b 01             	mov    (%rcx),%rax
 133:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 137:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 13b:	77 1a                	ja     157 <batch_xdp_pass+0x157>
 13d:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 141:	8b 50 06             	mov    0x6(%rax),%edx
 144:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 148:	66 89 70 04          	mov    %si,0x4(%rax)
 14c:	8b 30                	mov    (%rax),%esi
 14e:	89 10                	mov    %edx,(%rax)
 150:	89 70 06             	mov    %esi,0x6(%rax)
 153:	66 89 48 0a          	mov    %cx,0xa(%rax)
 157:	48 8b 4f 40          	mov    0x40(%rdi),%rcx
 15b:	48 8b 01             	mov    (%rcx),%rax
 15e:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 162:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 166:	77 1a                	ja     182 <batch_xdp_pass+0x182>
 168:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 16c:	8b 50 06             	mov    0x6(%rax),%edx
 16f:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 173:	66 89 70 04          	mov    %si,0x4(%rax)
 177:	8b 30                	mov    (%rax),%esi
 179:	89 10                	mov    %edx,(%rax)
 17b:	89 70 06             	mov    %esi,0x6(%rax)
 17e:	66 89 48 0a          	mov    %cx,0xa(%rax)
 182:	48 8b 4f 48          	mov    0x48(%rdi),%rcx
 186:	48 8b 01             	mov    (%rcx),%rax
 189:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 18d:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 191:	77 1a                	ja     1ad <batch_xdp_pass+0x1ad>
 193:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 197:	8b 50 06             	mov    0x6(%rax),%edx
 19a:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 19e:	66 89 70 04          	mov    %si,0x4(%rax)
 1a2:	8b 30                	mov    (%rax),%esi
 1a4:	89 10                	mov    %edx,(%rax)
 1a6:	89 70 06             	mov    %esi,0x6(%rax)
 1a9:	66 89 48 0a          	mov    %cx,0xa(%rax)
 1ad:	48 8b 4f 50          	mov    0x50(%rdi),%rcx
 1b1:	48 8b 01             	mov    (%rcx),%rax
 1b4:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 1b8:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 1bc:	77 1a                	ja     1d8 <batch_xdp_pass+0x1d8>
 1be:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 1c2:	8b 50 06             	mov    0x6(%rax),%edx
 1c5:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 1c9:	66 89 70 04          	mov    %si,0x4(%rax)
 1cd:	8b 30                	mov    (%rax),%esi
 1cf:	89 10                	mov    %edx,(%rax)
 1d1:	89 70 06             	mov    %esi,0x6(%rax)
 1d4:	66 89 48 0a          	mov    %cx,0xa(%rax)
 1d8:	48 8b 4f 58          	mov    0x58(%rdi),%rcx
 1dc:	48 8b 01             	mov    (%rcx),%rax
 1df:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 1e3:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 1e7:	77 1a                	ja     203 <batch_xdp_pass+0x203>
 1e9:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 1ed:	8b 50 06             	mov    0x6(%rax),%edx
 1f0:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 1f4:	66 89 70 04          	mov    %si,0x4(%rax)
 1f8:	8b 30                	mov    (%rax),%esi
 1fa:	89 10                	mov    %edx,(%rax)
 1fc:	89 70 06             	mov    %esi,0x6(%rax)
 1ff:	66 89 48 0a          	mov    %cx,0xa(%rax)
 203:	48 8b 4f 60          	mov    0x60(%rdi),%rcx
 207:	48 8b 01             	mov    (%rcx),%rax
 20a:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 20e:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 212:	77 1a                	ja     22e <batch_xdp_pass+0x22e>
 214:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 218:	8b 50 06             	mov    0x6(%rax),%edx
 21b:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 21f:	66 89 70 04          	mov    %si,0x4(%rax)
 223:	8b 30                	mov    (%rax),%esi
 225:	89 10                	mov    %edx,(%rax)
 227:	89 70 06             	mov    %esi,0x6(%rax)
 22a:	66 89 48 0a          	mov    %cx,0xa(%rax)
 22e:	48 8b 4f 68          	mov    0x68(%rdi),%rcx
 232:	48 8b 01             	mov    (%rcx),%rax
 235:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 239:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 23d:	77 1a                	ja     259 <batch_xdp_pass+0x259>
 23f:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 243:	8b 50 06             	mov    0x6(%rax),%edx
 246:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 24a:	66 89 70 04          	mov    %si,0x4(%rax)
 24e:	8b 30                	mov    (%rax),%esi
 250:	89 10                	mov    %edx,(%rax)
 252:	89 70 06             	mov    %esi,0x6(%rax)
 255:	66 89 48 0a          	mov    %cx,0xa(%rax)
 259:	48 8b 4f 70          	mov    0x70(%rdi),%rcx
 25d:	48 8b 01             	mov    (%rcx),%rax
 260:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 264:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 268:	77 1a                	ja     284 <batch_xdp_pass+0x284>
 26a:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 26e:	8b 50 06             	mov    0x6(%rax),%edx
 271:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 275:	66 89 70 04          	mov    %si,0x4(%rax)
 279:	8b 30                	mov    (%rax),%esi
 27b:	89 10                	mov    %edx,(%rax)
 27d:	89 70 06             	mov    %esi,0x6(%rax)
 280:	66 89 48 0a          	mov    %cx,0xa(%rax)
 284:	48 8b 4f 78          	mov    0x78(%rdi),%rcx
 288:	48 8b 01             	mov    (%rcx),%rax
 28b:	48 8d 50 0e          	lea    0xe(%rax),%rdx
 28f:	48 3b 51 08          	cmp    0x8(%rcx),%rdx
 293:	77 1a                	ja     2af <batch_xdp_pass+0x2af>
 295:	0f b7 48 04          	movzwl 0x4(%rax),%ecx
 299:	8b 50 06             	mov    0x6(%rax),%edx
 29c:	0f b7 70 0a          	movzwl 0xa(%rax),%esi
 2a0:	66 89 70 04          	mov    %si,0x4(%rax)
 2a4:	8b 30                	mov    (%rax),%esi
 2a6:	89 10                	mov    %edx,(%rax)
 2a8:	89 70 06             	mov    %esi,0x6(%rax)
 2ab:	66 89 48 0a          	mov    %cx,0xa(%rax)
 2af:	b8 03 00 00 00       	mov    $0x3,%eax
 2b4:	c3                   	ret    
