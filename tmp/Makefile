exec:
	clang -S -O3 -emit-llvm test.c
	llc test.ll
	gcc test.s

sample:
	llc sample.ll
	gcc sample.s
	rm -rf *.txt
