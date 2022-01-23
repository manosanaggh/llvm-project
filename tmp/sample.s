	.text
	.file	"test.c"
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function print_to_stdout_2
.LCPI0_0:
	.quad	4620580626565544727     # double 7.8999990000000002
.LCPI0_1:
	.quad	4619342126534918679     # double 6.7999900000000002
	.text
	.globl	print_to_stdout_2
	.p2align	4, 0x90
	.type	print_to_stdout_2,@function
print_to_stdout_2:                      # @print_to_stdout_2
	.cfi_startproc
# BB#0:
	pushq	%rax
.Lcfi0:
	.cfi_def_cfa_offset 16
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str, %esi
	movl	$2000, %edx             # imm = 0x7D0
	movb	$1, %al
	movsd	.LCPI0_0(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	movsd	.LCPI0_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movl	$2500, %esi             # imm = 0x9C4
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.1, %esi
	movl	$2500, %edx             # imm = 0x9C4
	movb	$1, %al
	movsd	.LCPI0_1(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	popq	%rax
	retq
.Lfunc_end0:
	.size	print_to_stdout_2, .Lfunc_end0-print_to_stdout_2
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function main
.LCPI1_0:
	.quad	4620468037700760371     # double 7.7999999999999998
.LCPI1_1:
	.quad	4619229547803233485     # double 6.7000000000000002
.LCPI1_2:
	.quad	4620580626565544727     # double 7.8999990000000002
.LCPI1_3:
	.quad	4619342126534918679     # double 6.7999900000000002
	.text
	.globl	main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# BB#0:
	pushq	%rax
.Lcfi1:
	.cfi_def_cfa_offset 16
	movl	$.L.str.2, %edi
	movl	$.L.str.3, %esi
	callq	fopen
	movq	%rax, fptr(%rip)
	movsd	.LCPI1_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.10, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$main, %edx
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.10, %esi
	movl	$2000, %edx             # imm = 0x7D0
	movl	$main, %ecx
	movb	$1, %al
	movsd	.LCPI1_0(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	movsd	.LCPI1_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.11, %edi
	movl	$2500, %esi             # imm = 0x9C4
	movl	$main, %edx
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.11, %esi
	movl	$2500, %edx             # imm = 0x9C4
	movl	$main, %ecx
	movb	$1, %al
	movsd	.LCPI1_1(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	movsd	.LCPI1_2(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str, %esi
	movl	$2000, %edx             # imm = 0x7D0
	movb	$1, %al
	movsd	.LCPI1_2(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	movsd	.LCPI1_3(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.1, %edi
	movl	$2500, %esi             # imm = 0x9C4
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.1, %esi
	movl	$2500, %edx             # imm = 0x9C4
	movb	$1, %al
	movsd	.LCPI1_3(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	movq	fptr(%rip), %rdi
	movl	$.L.str.4, %esi
	movl	$2000, %edx             # imm = 0x7D0
	xorl	%eax, %eax
	callq	fprintf
	movq	fptr(%rip), %rdi
	movl	$.L.str.5, %esi
	movl	$2500, %edx             # imm = 0x9C4
	xorl	%eax, %eax
	callq	fprintf
	movl	$.L.str.6, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$.L.str.7, %edx
	xorl	%eax, %eax
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.6, %esi
	movl	$2000, %edx             # imm = 0x7D0
	movl	$.L.str.7, %ecx
	xorl	%eax, %eax
	callq	fprintf
	movl	$.L.str.8, %edi
	movl	$2500, %esi             # imm = 0x9C4
	movl	$.L.str.9, %edx
	xorl	%eax, %eax
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.8, %esi
	movl	$2500, %edx             # imm = 0x9C4
	movl	$.L.str.9, %ecx
	xorl	%eax, %eax
	callq	fprintf
	movq	fptr(%rip), %rdi
	callq	fclose
	xorl	%eax, %eax
	popq	%rcx
	retq
.Lfunc_end1:
	.size	main, .Lfunc_end1-main
	.cfi_endproc
                                        # -- End function
	.section	.rodata.cst8,"aM",@progbits,8
	.p2align	3               # -- Begin function print_to_stdout
.LCPI2_0:
	.quad	4620468037700760371     # double 7.7999999999999998
.LCPI2_1:
	.quad	4619229547803233485     # double 6.7000000000000002
	.text
	.globl	print_to_stdout
	.p2align	4, 0x90
	.type	print_to_stdout,@function
print_to_stdout:                        # @print_to_stdout
	.cfi_startproc
# BB#0:
	pushq	%rax
.Lcfi2:
	.cfi_def_cfa_offset 16
	movsd	.LCPI2_0(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.10, %edi
	movl	$2000, %esi             # imm = 0x7D0
	movl	$main, %edx
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.10, %esi
	movl	$2000, %edx             # imm = 0x7D0
	movl	$main, %ecx
	movb	$1, %al
	movsd	.LCPI2_0(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	movsd	.LCPI2_1(%rip), %xmm0   # xmm0 = mem[0],zero
	movl	$.L.str.11, %edi
	movl	$2500, %esi             # imm = 0x9C4
	movl	$main, %edx
	movb	$1, %al
	callq	printf
	movq	fptr(%rip), %rdi
	movl	$.L.str.11, %esi
	movl	$2500, %edx             # imm = 0x9C4
	movl	$main, %ecx
	movb	$1, %al
	movsd	.LCPI2_1(%rip), %xmm0   # xmm0 = mem[0],zero
	callq	fprintf
	popq	%rax
	retq
.Lfunc_end2:
	.size	print_to_stdout, .Lfunc_end2-print_to_stdout
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
	.asciz	"manos %d %f\n"
	.size	.L.str, 13

	.type	.L.str.1,@object        # @.str.1
.L.str.1:
	.asciz	"giorgis %d %f\n"
	.size	.L.str.1, 15

	.type	.L.str.2,@object        # @.str.2
.L.str.2:
	.asciz	"/spare/manosanag/myllvm/llvm-project/tmp/log.txt"
	.size	.L.str.2, 49

	.type	.L.str.3,@object        # @.str.3
.L.str.3:
	.asciz	"w"
	.size	.L.str.3, 2

	.type	.L.str.4,@object        # @.str.4
.L.str.4:
	.asciz	"manos %d\n"
	.size	.L.str.4, 10

	.type	.L.str.5,@object        # @.str.5
.L.str.5:
	.asciz	"giorgis %d\n"
	.size	.L.str.5, 12

	.type	.L.str.6,@object        # @.str.6
.L.str.6:
	.asciz	"manos %d %s\n"
	.size	.L.str.6, 13

	.type	.L.str.7,@object        # @.str.7
.L.str.7:
	.asciz	"poi"
	.size	.L.str.7, 4

	.type	.L.str.8,@object        # @.str.8
.L.str.8:
	.asciz	"giorgis %d %s\n"
	.size	.L.str.8, 15

	.type	.L.str.9,@object        # @.str.9
.L.str.9:
	.asciz	"kl"
	.size	.L.str.9, 3

	.type	.L.str.10,@object       # @.str.10
.L.str.10:
	.asciz	"manos %d %f %p\n"
	.size	.L.str.10, 16

	.type	.L.str.11,@object       # @.str.11
.L.str.11:
	.asciz	"giorgis %d %f %p\n"
	.size	.L.str.11, 18


	.ident	"clang version 5.0.1 (tags/RELEASE_501/final)"
	.section	".note.GNU-stack","",@progbits
