	.file	"main.c"
	.text
	.section	.rodata.str1.8,"aMS",@progbits,1
	.align 8
.LC0:
	.string	"Stack creation failed due to memory allocation error\n"
	.section	.text.unlikely,"ax",@progbits
.LCOLDB1:
	.text
.LHOTB1:
	.p2align 4
	.globl	createStack
	.type	createStack, @function
createStack:
.LFB22:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movl	%edi, %ebx
	leaq	0(,%rbx,4), %rdi
	call	malloc@PLT
	testq	%rax, %rax
	je	.L3
	salq	$32, %rbx
	movl	$4294967295, %edx
	orq	%rbx, %rdx
	popq	%rbx
	.cfi_def_cfa_offset 8
	xchgq	%rdx, %rax
	ret
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	createStack.cold, @function
createStack.cold:
.LFSB22:
.L3:
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	leaq	.LC0(%rip), %rdi
	call	perror@PLT
	movl	$1, %edi
	call	exit@PLT
	.cfi_endproc
.LFE22:
	.text
	.size	createStack, .-createStack
	.section	.text.unlikely
	.size	createStack.cold, .-createStack.cold
.LCOLDE1:
	.text
.LHOTE1:
	.p2align 4
	.globl	isFull
	.type	isFull, @function
isFull:
.LFB23:
	.cfi_startproc
	movl	4(%rdi), %eax
	subl	$1, %eax
	cmpl	(%rdi), %eax
	sete	%al
	movzbl	%al, %eax
	ret
	.cfi_endproc
.LFE23:
	.size	isFull, .-isFull
	.p2align 4
	.globl	isEmpty
	.type	isEmpty, @function
isEmpty:
.LFB24:
	.cfi_startproc
	xorl	%eax, %eax
	cmpl	$-1, (%rdi)
	sete	%al
	ret
	.cfi_endproc
.LFE24:
	.size	isEmpty, .-isEmpty
	.section	.rodata.str1.1,"aMS",@progbits,1
.LC2:
	.string	"Stack Is Full"
.LC3:
	.string	"%d pushed to stack\n"
	.text
	.p2align 4
	.globl	push
	.type	push, @function
push:
.LFB25:
	.cfi_startproc
	movl	4(%rdi), %ecx
	movl	(%rdi), %eax
	leal	-1(%rcx), %edx
	cmpl	%edx, %eax
	je	.L10
	movq	8(%rdi), %rdx
	addl	$1, %eax
	movl	%eax, (%rdi)
	cltq
	leaq	.LC3(%rip), %rdi
	movl	%esi, (%rdx,%rax,4)
	xorl	%eax, %eax
	jmp	printf@PLT
	.p2align 4,,10
	.p2align 3
.L10:
	leaq	.LC2(%rip), %rdi
	jmp	puts@PLT
	.cfi_endproc
.LFE25:
	.size	push, .-push
	.section	.rodata.str1.1
.LC4:
	.string	"Stack Is Empty"
	.text
	.p2align 4
	.globl	pop
	.type	pop, @function
pop:
.LFB26:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	(%rdi), %rbx
	cmpl	$-1, %ebx
	je	.L15
	leal	-1(%rbx), %edx
	movq	8(%rdi), %rax
	movl	%edx, (%rdi)
	movl	(%rax,%rbx,4), %ebx
.L11:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L15:
	.cfi_restore_state
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	jmp	.L11
	.cfi_endproc
.LFE26:
	.size	pop, .-pop
	.section	.rodata.str1.1
.LC5:
	.string	"Stack is empty"
	.text
	.p2align 4
	.globl	peek
	.type	peek, @function
peek:
.LFB27:
	.cfi_startproc
	pushq	%rbx
	.cfi_def_cfa_offset 16
	.cfi_offset 3, -16
	movslq	(%rdi), %rbx
	cmpl	$-1, %ebx
	je	.L20
	movq	8(%rdi), %rax
	movl	(%rax,%rbx,4), %ebx
.L16:
	movl	%ebx, %eax
	popq	%rbx
	.cfi_remember_state
	.cfi_def_cfa_offset 8
	ret
.L20:
	.cfi_restore_state
	leaq	.LC5(%rip), %rdi
	call	puts@PLT
	jmp	.L16
	.cfi_endproc
.LFE27:
	.size	peek, .-peek
	.section	.rodata.str1.1
.LC6:
	.string	"Hello, World!"
.LC7:
	.string	"Stack is full"
.LC8:
	.string	"%d\n"
	.section	.text.unlikely
.LCOLDB9:
	.section	.text.startup,"ax",@progbits
.LHOTB9:
	.p2align 4
	.globl	main
	.type	main, @function
main:
.LFB28:
	.cfi_startproc
	pushq	%r15
	.cfi_def_cfa_offset 16
	.cfi_offset 15, -16
	pushq	%r14
	.cfi_def_cfa_offset 24
	.cfi_offset 14, -24
	leaq	.LC3(%rip), %r14
	pushq	%r13
	.cfi_def_cfa_offset 32
	.cfi_offset 13, -32
	pushq	%r12
	.cfi_def_cfa_offset 40
	.cfi_offset 12, -40
	pushq	%rbp
	.cfi_def_cfa_offset 48
	.cfi_offset 6, -48
	pushq	%rbx
	.cfi_def_cfa_offset 56
	.cfi_offset 3, -56
	xorl	%ebx, %ebx
	subq	$40, %rsp
	.cfi_def_cfa_offset 96
	movq	%fs:40, %rdi
	movq	%rdi, 24(%rsp)
	leaq	.LC6(%rip), %rdi
	call	puts@PLT
	movl	$8, %edi
	call	createStack
	movq	%rax, (%rsp)
	movl	4(%rsp), %eax
	movq	%rdx, 8(%rsp)
	movslq	(%rsp), %rbp
	movq	8(%rsp), %r15
	leal	-1(%rax), %r13d
	.p2align 4,,10
	.p2align 3
.L24:
	movl	%ebp, %r12d
	cmpl	%ebp, %r13d
	je	.L33
	movl	%ebx, 4(%r15,%rbp,4)
	movl	%ebx, %esi
	movq	%r14, %rdi
	xorl	%eax, %eax
	addl	$1, %ebx
	addq	$1, %rbp
	call	printf@PLT
	cmpl	$8, %ebx
	jne	.L24
	addl	$1, %r12d
.L23:
	movq	%rsp, %rdi
	movl	$8, %esi
	movl	%r12d, (%rsp)
	movl	$8, %ebx
	call	push
	leaq	.LC8(%rip), %r12
	movslq	(%rsp), %rax
	movq	8(%rsp), %r13
	jmp	.L28
	.p2align 4,,10
	.p2align 3
.L30:
	movslq	%ebp, %rax
.L28:
	cmpl	$-1, %eax
	je	.L35
	movl	0(%r13,%rax,4), %esi
	leal	-1(%rax), %ebp
	movq	%r12, %rdi
	xorl	%eax, %eax
	call	printf@PLT
	subl	$1, %ebx
	jne	.L30
.L27:
	movq	24(%rsp), %rax
	subq	%fs:40, %rax
	jne	.L36
	addq	$40, %rsp
	.cfi_remember_state
	.cfi_def_cfa_offset 56
	xorl	%eax, %eax
	popq	%rbx
	.cfi_def_cfa_offset 48
	popq	%rbp
	.cfi_def_cfa_offset 40
	popq	%r12
	.cfi_def_cfa_offset 32
	popq	%r13
	.cfi_def_cfa_offset 24
	popq	%r14
	.cfi_def_cfa_offset 16
	popq	%r15
	.cfi_def_cfa_offset 8
	ret
.L35:
	.cfi_restore_state
	leaq	.LC4(%rip), %rbp
.L26:
	movq	%rbp, %rdi
	call	puts@PLT
	orl	$-1, %esi
	xorl	%eax, %eax
	movq	%r12, %rdi
	call	printf@PLT
	subl	$1, %ebx
	jne	.L26
	jmp	.L27
.L36:
	call	__stack_chk_fail@PLT
	.cfi_endproc
	.section	.text.unlikely
	.cfi_startproc
	.type	main.cold, @function
main.cold:
.LFSB28:
.L33:
	.cfi_def_cfa_offset 96
	.cfi_offset 3, -56
	.cfi_offset 6, -48
	.cfi_offset 12, -40
	.cfi_offset 13, -32
	.cfi_offset 14, -24
	.cfi_offset 15, -16
	leaq	.LC7(%rip), %rdi
	movl	%r13d, %r12d
	call	perror@PLT
	jmp	.L23
	.cfi_endproc
.LFE28:
	.section	.text.startup
	.size	main, .-main
	.section	.text.unlikely
	.size	main.cold, .-main.cold
.LCOLDE9:
	.section	.text.startup
.LHOTE9:
	.ident	"GCC: (GNU) 14.1.1 20240522"
	.section	.note.GNU-stack,"",@progbits
