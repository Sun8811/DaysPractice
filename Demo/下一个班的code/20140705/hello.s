
hello:     file format mach-o-x86-64


Disassembly of section .text:

0000000100000e40 <_otherFunc>:
   100000e40:	55                   	push   %rbp
   100000e41:	48 89 e5             	mov    %rsp,%rbp
   100000e44:	48 83 ec 10          	sub    $0x10,%rsp
   100000e48:	48 8d 3d ef 00 00 00 	lea    0xef(%rip),%rdi        # 100000f3e <_printf$stub+0x22>
   100000e4f:	48 8d 35 f0 00 00 00 	lea    0xf0(%rip),%rsi        # 100000f46 <_printf$stub+0x2a>
   100000e56:	48 8d 05 bb 01 00 00 	lea    0x1bb(%rip),%rax        # 100001018 <_gVar>
   100000e5d:	8b 10                	mov    (%rax),%edx
   100000e5f:	b0 00                	mov    $0x0,%al
   100000e61:	e8 b6 00 00 00       	callq  100000f1c <_printf$stub>
   100000e66:	89 45 fc             	mov    %eax,-0x4(%rbp)
   100000e69:	48 83 c4 10          	add    $0x10,%rsp
   100000e6d:	5d                   	pop    %rbp
   100000e6e:	c3                   	retq   
   100000e6f:	90                   	nop

0000000100000e70 <_main>:
   100000e70:	55                   	push   %rbp
   100000e71:	48 89 e5             	mov    %rsp,%rbp
   100000e74:	48 83 ec 10          	sub    $0x10,%rsp
   100000e78:	48 8d 3d d1 00 00 00 	lea    0xd1(%rip),%rdi        # 100000f50 <_printf$stub+0x34>
   100000e7f:	48 8d 35 d6 00 00 00 	lea    0xd6(%rip),%rsi        # 100000f5c <_printf$stub+0x40>
   100000e86:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   100000e8d:	8b 15 85 01 00 00    	mov    0x185(%rip),%edx        # 100001018 <_gVar>
   100000e93:	8b 0d 83 01 00 00    	mov    0x183(%rip),%ecx        # 10000101c <_staticVar>
   100000e99:	b0 00                	mov    $0x0,%al
   100000e9b:	e8 7c 00 00 00       	callq  100000f1c <_printf$stub>
   100000ea0:	89 45 f8             	mov    %eax,-0x8(%rbp)
   100000ea3:	e8 18 00 00 00       	callq  100000ec0 <_foo>
   100000ea8:	e8 43 00 00 00       	callq  100000ef0 <_bar>
   100000ead:	e8 8e ff ff ff       	callq  100000e40 <_otherFunc>
   100000eb2:	b8 00 00 00 00       	mov    $0x0,%eax
   100000eb7:	48 83 c4 10          	add    $0x10,%rsp
   100000ebb:	5d                   	pop    %rbp
   100000ebc:	c3                   	retq   
   100000ebd:	0f 1f 00             	nopl   (%rax)

0000000100000ec0 <_foo>:
   100000ec0:	55                   	push   %rbp
   100000ec1:	48 89 e5             	mov    %rsp,%rbp
   100000ec4:	48 83 ec 10          	sub    $0x10,%rsp
   100000ec8:	48 8d 3d 92 00 00 00 	lea    0x92(%rip),%rdi        # 100000f61 <_printf$stub+0x45>
   100000ecf:	8b 35 43 01 00 00    	mov    0x143(%rip),%esi        # 100001018 <_gVar>
   100000ed5:	8b 15 41 01 00 00    	mov    0x141(%rip),%edx        # 10000101c <_staticVar>
   100000edb:	b0 00                	mov    $0x0,%al
   100000edd:	e8 3a 00 00 00       	callq  100000f1c <_printf$stub>
   100000ee2:	89 45 fc             	mov    %eax,-0x4(%rbp)
   100000ee5:	48 83 c4 10          	add    $0x10,%rsp
   100000ee9:	5d                   	pop    %rbp
   100000eea:	c3                   	retq   
   100000eeb:	0f 1f 44 00 00       	nopl   0x0(%rax,%rax,1)

0000000100000ef0 <_bar>:
   100000ef0:	55                   	push   %rbp
   100000ef1:	48 89 e5             	mov    %rsp,%rbp
   100000ef4:	48 83 ec 10          	sub    $0x10,%rsp
   100000ef8:	48 8d 3d 6f 00 00 00 	lea    0x6f(%rip),%rdi        # 100000f6e <_printf$stub+0x52>
   100000eff:	8b 35 13 01 00 00    	mov    0x113(%rip),%esi        # 100001018 <_gVar>
   100000f05:	8b 15 11 01 00 00    	mov    0x111(%rip),%edx        # 10000101c <_staticVar>
   100000f0b:	b0 00                	mov    $0x0,%al
   100000f0d:	e8 0a 00 00 00       	callq  100000f1c <_printf$stub>
   100000f12:	89 45 fc             	mov    %eax,-0x4(%rbp)
   100000f15:	48 83 c4 10          	add    $0x10,%rsp
   100000f19:	5d                   	pop    %rbp
   100000f1a:	c3                   	retq   

Disassembly of section __TEXT.__stubs:

0000000100000f1c <_printf$stub>:
   100000f1c:	ff 25 ee 00 00 00    	jmpq   *0xee(%rip)        # 100001010 <_printf$stub>

Disassembly of section __TEXT.__stub_helper:

0000000100000f24 <__TEXT.__stub_helper>:
   100000f24:	4c 8d 1d dd 00 00 00 	lea    0xdd(%rip),%r11        # 100001008 <>
   100000f2b:	41 53                	push   %r11
   100000f2d:	ff 25 cd 00 00 00    	jmpq   *0xcd(%rip)        # 100001000 <dyld_stub_binder$stub>
   100000f33:	90                   	nop
   100000f34:	68 00 00 00 00       	pushq  $0x0
   100000f39:	e9 e6 ff ff ff       	jmpq   100000f24 <_printf$stub+0x8>

Disassembly of section .cstring:

0000000100000f3e <.cstring>:
   100000f3e:	25 73 3a 20 25       	and    $0x25203a73,%eax
   100000f43:	64 0a 00             	or     %fs:(%rax),%al
   100000f46:	6f                   	outsl  %ds:(%rsi),(%dx)
   100000f47:	74 68                	je     100000fb1 <_printf$stub+0x95>
   100000f49:	65                   	gs
   100000f4a:	72 46                	jb     100000f92 <_printf$stub+0x76>
   100000f4c:	75 6e                	jne    100000fbc <_printf$stub+0xa0>
   100000f4e:	63 00                	movslq (%rax),%eax
   100000f50:	25 73 3a 20 25       	and    $0x25203a73,%eax
   100000f55:	64                   	fs
   100000f56:	2c 20                	sub    $0x20,%al
   100000f58:	25 64 0a 00 6d       	and    $0x6d000a64,%eax
   100000f5d:	61                   	(bad)  
   100000f5e:	69 6e 00 66 6f 6f 3a 	imul   $0x3a6f6f66,0x0(%rsi),%ebp
   100000f65:	20 25 64 2c 20 25    	and    %ah,0x25202c64(%rip)        # 125203bcf <_staticVar+0x25202bb3>
   100000f6b:	64 0a 00             	or     %fs:(%rax),%al
   100000f6e:	62 61                	(bad)  
   100000f70:	72 3a                	jb     100000fac <_printf$stub+0x90>
   100000f72:	20 25 64 2c 20 25    	and    %ah,0x25202c64(%rip)        # 125203bdc <_staticVar+0x25202bc0>
   100000f78:	64 0a 00             	or     %fs:(%rax),%al

Disassembly of section __TEXT.__unwind_info:

0000000100000f7b <__TEXT.__unwind_info>:
   100000f7b:	01 00                	add    %eax,(%rax)
   100000f7d:	00 00                	add    %al,(%rax)
   100000f7f:	1c 00                	sbb    $0x0,%al
   100000f81:	00 00                	add    %al,(%rax)
   100000f83:	00 00                	add    %al,(%rax)
   100000f85:	00 00                	add    %al,(%rax)
   100000f87:	1c 00                	sbb    $0x0,%al
   100000f89:	00 00                	add    %al,(%rax)
   100000f8b:	00 00                	add    %al,(%rax)
   100000f8d:	00 00                	add    %al,(%rax)
   100000f8f:	1c 00                	sbb    $0x0,%al
   100000f91:	00 00                	add    %al,(%rax)
   100000f93:	02 00                	add    (%rax),%al
   100000f95:	00 00                	add    %al,(%rax)
   100000f97:	40 0e                	rex (bad) 
   100000f99:	00 00                	add    %al,(%rax)
   100000f9b:	34 00                	xor    $0x0,%al
   100000f9d:	00 00                	add    %al,(%rax)
   100000f9f:	34 00                	xor    $0x0,%al
   100000fa1:	00 00                	add    %al,(%rax)
   100000fa3:	1c 0f                	sbb    $0xf,%al
   100000fa5:	00 00                	add    %al,(%rax)
   100000fa7:	00 00                	add    %al,(%rax)
   100000fa9:	00 00                	add    %al,(%rax)
   100000fab:	34 00                	xor    $0x0,%al
   100000fad:	00 00                	add    %al,(%rax)
   100000faf:	03 00                	add    (%rax),%eax
   100000fb1:	00 00                	add    %al,(%rax)
   100000fb3:	0c 00                	or     $0x0,%al
   100000fb5:	01 00                	add    %eax,(%rax)
   100000fb7:	10 00                	adc    %al,(%rax)
   100000fb9:	01 00                	add    %eax,(%rax)
   100000fbb:	00 00                	add    %al,(%rax)
   100000fbd:	00 00                	add    %al,(%rax)
   100000fbf:	00 00                	add    %al,(%rax)
   100000fc1:	00 01                	add    %al,(%rcx)

Disassembly of section .eh_frame:

0000000100000fc8 <.eh_frame>:
   100000fc8:	14 00                	adc    $0x0,%al
   100000fca:	00 00                	add    %al,(%rax)
   100000fcc:	00 00                	add    %al,(%rax)
   100000fce:	00 00                	add    %al,(%rax)
   100000fd0:	01 7a 52             	add    %edi,0x52(%rdx)
   100000fd3:	00 01                	add    %al,(%rcx)
   100000fd5:	78 10                	js     100000fe7 <_printf$stub+0xcb>
   100000fd7:	01 10                	add    %edx,(%rax)
   100000fd9:	0c 07                	or     $0x7,%al
   100000fdb:	08 90 01 00 00 14    	or     %dl,0x14000001(%rax)
   100000fe1:	00 00                	add    %al,(%rax)
   100000fe3:	00 00                	add    %al,(%rax)
   100000fe5:	00 00                	add    %al,(%rax)
   100000fe7:	00 01                	add    %al,(%rcx)
   100000fe9:	7a 52                	jp     10000103d <_staticVar+0x21>
   100000feb:	00 01                	add    %al,(%rcx)
   100000fed:	78 10                	js     100000fff <_printf$stub+0xe3>
   100000fef:	01 10                	add    %edx,(%rax)
   100000ff1:	0c 07                	or     $0x7,%al
   100000ff3:	08                   	.byte 0x8
   100000ff4:	90                   	nop
   100000ff5:	01 00                	add    %eax,(%rax)
	...

Disassembly of section __DATA.__nl_symbol_ptr:

0000000100001000 <dyld_stub_binder$stub>:
	...

0000000100001008 <>:
	...

Disassembly of section __DATA.__la_symbol_ptr:

0000000100001010 <_printf$stub>:
   100001010:	34 0f                	xor    $0xf,%al
   100001012:	00 00                	add    %al,(%rax)
   100001014:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .data:

0000000100001018 <_gVar>:
   100001018:	0a 00                	or     (%rax),%al
	...

000000010000101c <_staticVar>:
   10000101c:	14 00                	adc    $0x0,%al
	...
