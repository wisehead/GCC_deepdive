	.file	"rtx_const.c"
	.section	.rodata
.LC0:
	.string	"This is a Name."
.LC1:
	.string	"This is a Title."
	.text
.globl rtx_const
	.type	rtx_const, @function
rtx_const:
.LFB0:
	.cfi_startproc
	pushq	%rbp
	.cfi_def_cfa_offset 16
	movq	%rsp, %rbp
	.cfi_offset 6, -16
	.cfi_def_cfa_register 6
	movl	%edi, -20(%rbp)
	movq	$.LC0, -16(%rbp)
	movq	$.LC1, -8(%rbp)
.L2:
	cmpl	$10, -20(%rbp)
	jg	.L3
	sall	-20(%rbp)
	jmp	.L2
.L3:
	movl	-20(%rbp), %eax
	leave
	ret
	.cfi_endproc
.LFE0:
	.size	rtx_const, .-rtx_const
	.ident	"GCC: (GNU) 4.4.6"
	.section	.note.GNU-stack,"",@progbits
