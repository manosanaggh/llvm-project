input:
	rm -rf *.ll *.out
	clang -S -O3 -emit-llvm test.c
	llc test.ll
	gcc test.s

sample:
	rm -rf *.out *.txt
	llc sample.ll
	gcc sample.s
