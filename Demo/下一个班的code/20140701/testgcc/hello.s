
hello:     file format mach-o-x86-64


Disassembly of section .text:

0000000100000f20 <_main>:
   100000f20:	55                   	push   %rbp
   100000f21:	48 89 e5             	mov    %rsp,%rbp
   100000f24:	48 83 ec 10          	sub    $0x10,%rsp
   100000f28:	48 8d 3d 57 00 00 00 	lea    0x57(%rip),%rdi        # 100000f86 <_printf$stub+0x22>
   100000f2f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%rbp)
   100000f36:	b0 00                	mov    $0x0,%al
   100000f38:	e8 27 00 00 00       	callq  100000f64 <_printf$stub>
   100000f3d:	48 8d 3d 51 00 00 00 	lea    0x51(%rip),%rdi        # 100000f95 <_printf$stub+0x31>
   100000f44:	be 78 03 00 00       	mov    $0x378,%esi
   100000f49:	89 45 f8             	mov    %eax,-0x8(%rbp)
   100000f4c:	b0 00                	mov    $0x0,%al
   100000f4e:	e8 11 00 00 00       	callq  100000f64 <_printf$stub>
   100000f53:	be 00 00 00 00       	mov    $0x0,%esi
   100000f58:	89 45 f4             	mov    %eax,-0xc(%rbp)
   100000f5b:	89 f0                	mov    %esi,%eax
   100000f5d:	48 83 c4 10          	add    $0x10,%rsp
   100000f61:	5d                   	pop    %rbp
   100000f62:	c3                   	retq   

Disassembly of section __TEXT.__stubs:

0000000100000f64 <_printf$stub>:
   100000f64:	ff 25 a6 00 00 00    	jmpq   *0xa6(%rip)        # 100001010 <_printf$stub>

Disassembly of section __TEXT.__stub_helper:

0000000100000f6c <__TEXT.__stub_helper>:
   100000f6c:	4c 8d 1d 95 00 00 00 	lea    0x95(%rip),%r11        # 100001008 <>
   100000f73:	41 53                	push   %r11
   100000f75:	ff 25 85 00 00 00    	jmpq   *0x85(%rip)        # 100001000 <dyld_stub_binder$stub>
   100000f7b:	90                   	nop
   100000f7c:	68 00 00 00 00       	pushq  $0x0
   100000f81:	e9 e6 ff ff ff       	jmpq   100000f6c <_printf$stub+0x8>

Disassembly of section .cstring:

0000000100000f86 <.cstring>:
   100000f86:	48                   	rex.W
   100000f87:	65                   	gs
   100000f88:	6c                   	insb   (%dx),%es:(%rdi)
   100000f89:	6c                   	insb   (%dx),%es:(%rdi)
   100000f8a:	6f                   	outsl  %ds:(%rsi),(%dx)
   100000f8b:	2c 20                	sub    $0x20,%al
   100000f8d:	77 6f                	ja     100000ffe <_printf$stub+0x9a>
   100000f8f:	72 6c                	jb     100000ffd <_printf$stub+0x99>
   100000f91:	64 21 0a             	and    %ecx,%fs:(%rdx)
   100000f94:	00                   	.byte 0x0
   100000f95:	25                   	.byte 0x25
   100000f96:	64 0a 00             	or     %fs:(%rax),%al

Disassembly of section __TEXT.__unwind_info:

0000000100000f99 <__TEXT.__unwind_info>:
   100000f99:	01 00                	add    %eax,(%rax)
   100000f9b:	00 00                	add    %al,(%rax)
   100000f9d:	1c 00                	sbb    $0x0,%al
   100000f9f:	00 00                	add    %al,(%rax)
   100000fa1:	00 00                	add    %al,(%rax)
   100000fa3:	00 00                	add    %al,(%rax)
   100000fa5:	1c 00                	sbb    $0x0,%al
   100000fa7:	00 00                	add    %al,(%rax)
   100000fa9:	00 00                	add    %al,(%rax)
   100000fab:	00 00                	add    %al,(%rax)
   100000fad:	1c 00                	sbb    $0x0,%al
   100000faf:	00 00                	add    %al,(%rax)
   100000fb1:	02 00                	add    (%rax),%al
   100000fb3:	00 00                	add    %al,(%rax)
   100000fb5:	20 0f                	and    %cl,(%rdi)
   100000fb7:	00 00                	add    %al,(%rax)
   100000fb9:	34 00                	xor    $0x0,%al
   100000fbb:	00 00                	add    %al,(%rax)
   100000fbd:	34 00                	xor    $0x0,%al
   100000fbf:	00 00                	add    %al,(%rax)
   100000fc1:	64 0f 00 00          	sldt   %fs:(%rax)
   100000fc5:	00 00                	add    %al,(%rax)
   100000fc7:	00 00                	add    %al,(%rax)
   100000fc9:	34 00                	xor    $0x0,%al
   100000fcb:	00 00                	add    %al,(%rax)
   100000fcd:	03 00                	add    (%rax),%eax
   100000fcf:	00 00                	add    %al,(%rax)
   100000fd1:	0c 00                	or     $0x0,%al
   100000fd3:	01 00                	add    %eax,(%rax)
   100000fd5:	10 00                	adc    %al,(%rax)
   100000fd7:	01 00                	add    %eax,(%rax)
   100000fd9:	00 00                	add    %al,(%rax)
   100000fdb:	00 00                	add    %al,(%rax)
   100000fdd:	00 00                	add    %al,(%rax)
   100000fdf:	00 01                	add    %al,(%rcx)

Disassembly of section .eh_frame:

0000000100000fe8 <.eh_frame>:
   100000fe8:	14 00                	adc    $0x0,%al
   100000fea:	00 00                	add    %al,(%rax)
   100000fec:	00 00                	add    %al,(%rax)
   100000fee:	00 00                	add    %al,(%rax)
   100000ff0:	01 7a 52             	add    %edi,0x52(%rdx)
   100000ff3:	00 01                	add    %al,(%rcx)
   100000ff5:	78 10                	js     100001007 <dyld_stub_binder$stub+0x7>
   100000ff7:	01 10                	add    %edx,(%rax)
   100000ff9:	0c 07                	or     $0x7,%al
   100000ffb:	08                   	.byte 0x8
   100000ffc:	90                   	nop
   100000ffd:	01 00                	add    %eax,(%rax)
	...

Disassembly of section __DATA.__nl_symbol_ptr:

0000000100001000 <dyld_stub_binder$stub>:
	...

0000000100001008 <>:
	...

Disassembly of section __DATA.__la_symbol_ptr:

0000000100001010 <_printf$stub>:
   100001010:	7c 0f                	jl     100001021 <_printf$stub+0x11>
   100001012:	00 00                	add    %al,(%rax)
   100001014:	01 00                	add    %eax,(%rax)
	...
