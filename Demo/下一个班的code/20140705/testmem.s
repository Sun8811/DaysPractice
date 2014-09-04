
testmem:     file format mach-o-x86-64


Disassembly of section .text:

0000000100000e40 <_main>:
   100000e40:	55                   	push   %rbp
   100000e41:	48 89 e5             	mov    %rsp,%rbp
   100000e44:	48 83 ec 40          	sub    $0x40,%rsp
   100000e48:	48 8d 3d f0 00 00 00 	lea    0xf0(%rip),%rdi        # 100000f3f <_printf$stub+0x29>
   100000e4f:	48 8d 05 ca 01 00 00 	lea    0x1ca(%rip),%rax        # 100001020 <_glVar>
   100000e56:	48 8d 0d d9 00 00 00 	lea    0xd9(%rip),%rcx        # 100000f36 <_printf$stub+0x20>
   100000e5d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   100000e64:	48 89 4d f0          	mov    %rcx,-0x10(%rbp)
   100000e68:	8b 15 cd 00 00 00    	mov    0xcd(%rip),%edx        # 100000f3b <_printf$stub+0x25>
   100000e6e:	89 55 ec             	mov    %edx,-0x14(%rbp)
   100000e71:	c7 45 e8 61 00 00 00 	movl   $0x61,-0x18(%rbp)
   100000e78:	c6 45 e7 78          	movb   $0x78,-0x19(%rbp)
   100000e7c:	8b 30                	mov    (%rax),%esi
   100000e7e:	b0 00                	mov    $0x0,%al
   100000e80:	e8 91 00 00 00       	callq  100000f16 <_printf$stub>
   100000e85:	48 8d 3d be 00 00 00 	lea    0xbe(%rip),%rdi        # 100000f4a <_printf$stub+0x34>
   100000e8c:	8b 35 8a 01 00 00    	mov    0x18a(%rip),%esi        # 10000101c <_gStaticVar>
   100000e92:	89 45 e0             	mov    %eax,-0x20(%rbp)
   100000e95:	b0 00                	mov    $0x0,%al
   100000e97:	e8 7a 00 00 00       	callq  100000f16 <_printf$stub>
   100000e9c:	48 8d 3d b7 00 00 00 	lea    0xb7(%rip),%rdi        # 100000f5a <_printf$stub+0x44>
   100000ea3:	8b 35 6f 01 00 00    	mov    0x16f(%rip),%esi        # 100001018 <_main.gStaticIn>
   100000ea9:	89 45 dc             	mov    %eax,-0x24(%rbp)
   100000eac:	b0 00                	mov    $0x0,%al
   100000eae:	e8 63 00 00 00       	callq  100000f16 <_printf$stub>
   100000eb3:	48 8d 3d af 00 00 00 	lea    0xaf(%rip),%rdi        # 100000f69 <_printf$stub+0x53>
   100000eba:	48 8b 75 f0          	mov    -0x10(%rbp),%rsi
   100000ebe:	89 45 d8             	mov    %eax,-0x28(%rbp)
   100000ec1:	b0 00                	mov    $0x0,%al
   100000ec3:	e8 4e 00 00 00       	callq  100000f16 <_printf$stub>
   100000ec8:	48 8d 3d a3 00 00 00 	lea    0xa3(%rip),%rdi        # 100000f72 <_printf$stub+0x5c>
   100000ecf:	48 8d 75 ec          	lea    -0x14(%rbp),%rsi
   100000ed3:	89 45 d4             	mov    %eax,-0x2c(%rbp)
   100000ed6:	b0 00                	mov    $0x0,%al
   100000ed8:	e8 39 00 00 00       	callq  100000f16 <_printf$stub>
   100000edd:	48 8d 3d 97 00 00 00 	lea    0x97(%rip),%rdi        # 100000f7b <_printf$stub+0x65>
   100000ee4:	8b 75 e8             	mov    -0x18(%rbp),%esi
   100000ee7:	89 45 d0             	mov    %eax,-0x30(%rbp)
   100000eea:	b0 00                	mov    $0x0,%al
   100000eec:	e8 25 00 00 00       	callq  100000f16 <_printf$stub>
   100000ef1:	48 8d 3d 90 00 00 00 	lea    0x90(%rip),%rdi        # 100000f88 <_printf$stub+0x72>
   100000ef8:	0f be 75 e7          	movsbl -0x19(%rbp),%esi
   100000efc:	89 45 cc             	mov    %eax,-0x34(%rbp)
   100000eff:	b0 00                	mov    $0x0,%al
   100000f01:	e8 10 00 00 00       	callq  100000f16 <_printf$stub>
   100000f06:	ba 00 00 00 00       	mov    $0x0,%edx
   100000f0b:	89 45 c8             	mov    %eax,-0x38(%rbp)
   100000f0e:	89 d0                	mov    %edx,%eax
   100000f10:	48 83 c4 40          	add    $0x40,%rsp
   100000f14:	5d                   	pop    %rbp
   100000f15:	c3                   	retq   

Disassembly of section __TEXT.__stubs:

0000000100000f16 <_printf$stub>:
   100000f16:	ff 25 f4 00 00 00    	jmpq   *0xf4(%rip)        # 100001010 <_printf$stub>

Disassembly of section __TEXT.__stub_helper:

0000000100000f1c <__TEXT.__stub_helper>:
   100000f1c:	4c 8d 1d e5 00 00 00 	lea    0xe5(%rip),%r11        # 100001008 <>
   100000f23:	41 53                	push   %r11
   100000f25:	ff 25 d5 00 00 00    	jmpq   *0xd5(%rip)        # 100001000 <dyld_stub_binder$stub>
   100000f2b:	90                   	nop
   100000f2c:	68 00 00 00 00       	pushq  $0x0
   100000f31:	e9 e6 ff ff ff       	jmpq   100000f1c <_printf$stub+0x6>

Disassembly of section .cstring:

0000000100000f36 <.cstring>:
   100000f36:	61                   	(bad)  
   100000f37:	62 63 64 00 31       	(bad)  
   100000f3c:	32 33                	xor    (%rbx),%dh
   100000f3e:	00 67 6c             	add    %ah,0x6c(%rdi)
   100000f41:	56                   	push   %rsi
   100000f42:	61                   	(bad)  
   100000f43:	72 3a                	jb     100000f7f <_printf$stub+0x69>
   100000f45:	20 25 64 0a 00 67    	and    %ah,0x67000a64(%rip)        # 1670019af <_glVar+0x6700098f>
   100000f4b:	53                   	push   %rbx
   100000f4c:	74 61                	je     100000faf <_printf$stub+0x99>
   100000f4e:	74 69                	je     100000fb9 <_printf$stub+0xa3>
   100000f50:	63 56 61             	movslq 0x61(%rsi),%edx
   100000f53:	72 3a                	jb     100000f8f <_printf$stub+0x79>
   100000f55:	20 25 64 0a 00 67    	and    %ah,0x67000a64(%rip)        # 1670019bf <_glVar+0x6700099f>
   100000f5b:	53                   	push   %rbx
   100000f5c:	74 61                	je     100000fbf <_printf$stub+0xa9>
   100000f5e:	74 69                	je     100000fc9 <_printf$stub+0xb3>
   100000f60:	63 49 6e             	movslq 0x6e(%rcx),%ecx
   100000f63:	3a 20                	cmp    (%rax),%ah
   100000f65:	25 64 0a 00 70       	and    $0x70000a64,%eax
   100000f6a:	2d 3e 3a 20 25       	sub    $0x25203a3e,%eax
   100000f6f:	73 0a                	jae    100000f7b <_printf$stub+0x65>
   100000f71:	00 73 74             	add    %dh,0x74(%rbx)
   100000f74:	72 3a                	jb     100000fb0 <_printf$stub+0x9a>
   100000f76:	20 25 73 0a 00 74    	and    %ah,0x74000a73(%rip)        # 1740019ef <_glVar+0x740009cf>
   100000f7c:	65                   	gs
   100000f7d:	73 74                	jae    100000ff3 <_printf$stub+0xdd>
   100000f7f:	56                   	push   %rsi
   100000f80:	61                   	(bad)  
   100000f81:	72 3a                	jb     100000fbd <_printf$stub+0xa7>
   100000f83:	20 25 64 0a 00 74    	and    %ah,0x74000a64(%rip)        # 1740019ed <_glVar+0x740009cd>
   100000f89:	65                   	gs
   100000f8a:	73 74                	jae    100001000 <dyld_stub_binder$stub>
   100000f8c:	43 68 61 72 3a 20    	rex.XB pushq $0x203a7261
   100000f92:	25                   	.byte 0x25
   100000f93:	63 0a                	movslq (%rdx),%ecx
	...

Disassembly of section __TEXT.__unwind_info:

0000000100000f96 <__TEXT.__unwind_info>:
   100000f96:	01 00                	add    %eax,(%rax)
   100000f98:	00 00                	add    %al,(%rax)
   100000f9a:	1c 00                	sbb    $0x0,%al
   100000f9c:	00 00                	add    %al,(%rax)
   100000f9e:	00 00                	add    %al,(%rax)
   100000fa0:	00 00                	add    %al,(%rax)
   100000fa2:	1c 00                	sbb    $0x0,%al
   100000fa4:	00 00                	add    %al,(%rax)
   100000fa6:	00 00                	add    %al,(%rax)
   100000fa8:	00 00                	add    %al,(%rax)
   100000faa:	1c 00                	sbb    $0x0,%al
   100000fac:	00 00                	add    %al,(%rax)
   100000fae:	02 00                	add    (%rax),%al
   100000fb0:	00 00                	add    %al,(%rax)
   100000fb2:	40 0e                	rex (bad) 
   100000fb4:	00 00                	add    %al,(%rax)
   100000fb6:	34 00                	xor    $0x0,%al
   100000fb8:	00 00                	add    %al,(%rax)
   100000fba:	34 00                	xor    $0x0,%al
   100000fbc:	00 00                	add    %al,(%rax)
   100000fbe:	17                   	(bad)  
   100000fbf:	0f 00 00             	sldt   (%rax)
   100000fc2:	00 00                	add    %al,(%rax)
   100000fc4:	00 00                	add    %al,(%rax)
   100000fc6:	34 00                	xor    $0x0,%al
   100000fc8:	00 00                	add    %al,(%rax)
   100000fca:	03 00                	add    (%rax),%eax
   100000fcc:	00 00                	add    %al,(%rax)
   100000fce:	0c 00                	or     $0x0,%al
   100000fd0:	01 00                	add    %eax,(%rax)
   100000fd2:	10 00                	adc    %al,(%rax)
   100000fd4:	01 00                	add    %eax,(%rax)
   100000fd6:	00 00                	add    %al,(%rax)
   100000fd8:	00 00                	add    %al,(%rax)
   100000fda:	00 00                	add    %al,(%rax)
   100000fdc:	00 01                	add    %al,(%rcx)

Disassembly of section .eh_frame:

0000000100000fe0 <.eh_frame>:
   100000fe0:	14 00                	adc    $0x0,%al
   100000fe2:	00 00                	add    %al,(%rax)
   100000fe4:	00 00                	add    %al,(%rax)
   100000fe6:	00 00                	add    %al,(%rax)
   100000fe8:	01 7a 52             	add    %edi,0x52(%rdx)
   100000feb:	00 01                	add    %al,(%rcx)
   100000fed:	78 10                	js     100000fff <_printf$stub+0xe9>
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
   100001010:	2c 0f                	sub    $0xf,%al
   100001012:	00 00                	add    %al,(%rax)
   100001014:	01 00                	add    %eax,(%rax)
	...

Disassembly of section .bss:

0000000100001018 <_main.gStaticIn>:
   100001018:	00 00                	add    %al,(%rax)
	...

000000010000101c <_gStaticVar>:
   10000101c:	00 00                	add    %al,(%rax)
	...

Disassembly of section __DATA.__common:

0000000100001020 <_glVar>:
   100001020:	00 00                	add    %al,(%rax)
	...
