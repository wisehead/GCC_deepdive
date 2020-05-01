	.text
	.globl _i
	.data
	.align 2
_i:
	.long	287454020
	.globl _j
	.zerofill __DATA,__pu_bss2,_j,4,2
	.globl _str1
	.data
	.align 5
_str1:
	.ascii "This is a string.\0"
	.space 46
	.comm	_str2,128,5
	.text
	.globl _main
_main:
LFB0:
	pushq	%rbp
LCFI0:
	movq	%rsp, %rbp
LCFI1:
	subq	$16, %rsp
	movl	_i(%rip), %edx
	movl	_j(%rip), %eax
	addl	%edx, %eax
	movl	%eax, -4(%rbp)
	movq	_str2@GOTPCREL(%rip), %rax
	movabsq	$8247343400852088148, %rcx
	movq	%rcx, (%rax)
	movabsq	$7070773959522217577, %rsi
	movq	%rsi, 8(%rax)
	movabsq	$7234304308066590821, %rdi
	movq	%rdi, 16(%rax)
	movw	$46, 24(%rax)
	leaq	_str1(%rip), %rdi
	call	_puts
	movl	-4(%rbp), %eax
	leave
LCFI2:
	ret
LFE0:
	.section __TEXT,__eh_frame,coalesced,no_toc+strip_static_syms+live_support
EH_frame1:
	.set L$set$0,LECIE1-LSCIE1
	.long L$set$0
LSCIE1:
	.long	0
	.byte	0x1
	.ascii "zR\0"
	.byte	0x1
	.byte	0x78
	.byte	0x10
	.byte	0x1
	.byte	0x10
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.byte	0x90
	.byte	0x1
	.align 3
LECIE1:
LSFDE1:
	.set L$set$1,LEFDE1-LASFDE1
	.long L$set$1
LASFDE1:
	.long	LASFDE1-EH_frame1
	.quad	LFB0-.
	.set L$set$2,LFE0-LFB0
	.quad L$set$2
	.byte	0
	.byte	0x4
	.set L$set$3,LCFI0-LFB0
	.long L$set$3
	.byte	0xe
	.byte	0x10
	.byte	0x86
	.byte	0x2
	.byte	0x4
	.set L$set$4,LCFI1-LCFI0
	.long L$set$4
	.byte	0xd
	.byte	0x6
	.byte	0x4
	.set L$set$5,LCFI2-LCFI1
	.long L$set$5
	.byte	0xc
	.byte	0x7
	.byte	0x8
	.align 3
LEFDE1:
	.subsections_via_symbols
