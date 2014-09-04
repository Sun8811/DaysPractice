	.section	__TEXT,__text,regular,pure_instructions
	.section	__TEXT,__literal8,8byte_literals
	.align	3
LCPI0_0:
	.quad	4603579539098121011     ## double 0.59999999999999998
	.section	__TEXT,__text,regular,pure_instructions
	.globl	_main
	.align	4, 0x90
_main:                                  ## @main
	.cfi_startproc
## BB#0:
	pushq	%rbp
Ltmp2:
	.cfi_def_cfa_offset 16
Ltmp3:
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
Ltmp4:
	.cfi_def_cfa_register %rbp
	subq	$80, %rsp
	leaq	L_.str(%rip), %rdi
	movsd	LCPI0_0(%rip), %xmm0
	movq	___stack_chk_guard@GOTPCREL(%rip), %rax
	movq	(%rax), %rax
	movq	%rax, -8(%rbp)
	movl	$0, -12(%rbp)
	movb	$120, -13(%rbp)
	movl	$10, -20(%rbp)
	movl	$20, -24(%rbp)
	movsd	%xmm0, -32(%rbp)
	movq	L_main.strArr(%rip), %rax
	movq	%rax, -48(%rbp)
	movq	L_main.strArr+8(%rip), %rax
	movq	%rax, -40(%rbp)
	movsbl	-13(%rbp), %esi
	movb	$0, %al
	callq	_printf
	leaq	L_.str1(%rip), %rdi
	movl	-20(%rbp), %esi
	movl	%eax, -52(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str2(%rip), %rdi
	movl	-24(%rbp), %esi
	movl	%eax, -56(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	leaq	L_.str3(%rip), %rdi
	movsd	-32(%rbp), %xmm0
	movl	%eax, -60(%rbp)         ## 4-byte Spill
	movb	$1, %al
	callq	_printf
	leaq	L_.str4(%rip), %rdi
	leaq	-48(%rbp), %rsi
	movl	%eax, -64(%rbp)         ## 4-byte Spill
	movb	$0, %al
	callq	_printf
	movq	___stack_chk_guard@GOTPCREL(%rip), %rsi
	movq	(%rsi), %rsi
	cmpq	-8(%rbp), %rsi
	movl	%eax, -68(%rbp)         ## 4-byte Spill
	jne	LBB0_2
## BB#1:                                ## %SP_return
	movl	$0, %eax
	addq	$80, %rsp
	popq	%rbp
	ret
LBB0_2:                                 ## %CallStackCheckFailBlk
	callq	___stack_chk_fail
	.cfi_endproc

	.section	__TEXT,__const
	.align	4                       ## @main.strArr
L_main.strArr:
	.asciz	"hello\000\000\000\000\000\000\000\000\000\000"

	.section	__TEXT,__cstring,cstring_literals
L_.str:                                 ## @.str
	.asciz	"char is %c\n"

L_.str1:                                ## @.str1
	.asciz	"intVar is %d\n"

L_.str2:                                ## @.str2
	.asciz	"unsigned int is %u\n"

L_.str3:                                ## @.str3
	.asciz	"double is %f\n"

L_.str4:                                ## @.str4
	.asciz	"string is %s\n"


.subsections_via_symbols
