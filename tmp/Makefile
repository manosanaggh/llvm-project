exec:
	clang -S -O3 -emit-llvm test.c
	llc test.ll
	gcc test.s
