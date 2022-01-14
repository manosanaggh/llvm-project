	.text
	.file	"test.c"
	.globl	main                    # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rax
.Lcfi0:
	.cfi_def_cfa_offset 16
	movl	$.L.str, %edi
	movl	$.L.str.1, %esi
	callq	fopen
	movq	%rax, fptr(%rip)
	movl	$.L.str.2, %edi
	movl	$2000, %esi             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.3, %edi
	movl	$2500, %esi             # imm = 0x9C4
	xorl	%eax, %eax
	callq	printf
	movq	fptr(%rip), %rdi
	callq	fclose
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end0:
	.size	main, .Lfunc_end0-main
	.cfi_endproc
                                        # -- End function
	.globl	print_to_stdout         # -- Begin function print_to_stdout
	.p2align	4, 0x90
	.type	print_to_stdout,@function
print_to_stdout:                        # @print_to_stdout
	.cfi_startproc
# BB#0:
	pushq	%rax
.Lcfi1:
	.cfi_def_cfa_offset 16
	movl	$.L.str.2, %edi
	movl	$2000, %esi             # imm = 0x7D0
	xorl	%eax, %eax
	callq	printf
	movl	$.L.str.3, %edi
	movl	$2500, %esi             # imm = 0x9C4
	xorl	%eax, %eax
	popq	%rcx
	jmp	printf                  # TAILCALL
.Lfunc_end1:
	.size	print_to_stdout, .Lfunc_end1-print_to_stdout
	.cfi_endproc
                                        # -- End function
	.type	fptr,@object            # @fptr
	.bss
	.globl	fptr
	.p2align	3
fptr:
	.quad	0
	.size	fptr, 8

	.type	.L.str,@object          # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"/spare/manosanag/myllvm/llvm-project/tmp/log.txt"
	.size	.L.str, 49

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"w"
	.size	.L.str.1, 2

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"manos %d\n"
	.size	.L.str.2, 10

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"giorgis %d\n"
	.size	.L.str.3, 12


	.ident	"clang version 5.0.1 (tags/RELEASE_501/final)"
	.section	".note.GNU-stack","",@progbits
