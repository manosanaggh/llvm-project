#include <stdio.h>

FILE *fptr = NULL;

void print_to_stdout();

int main(){
	fptr = fopen("/spare/manosanag/myllvm/llvm-project/tmp/log.txt", "w");
	print_to_stdout();
	fprintf(fptr,"manos\n");
	fprintf(fptr,"giorgis\n");
	fclose(fptr);
	return 0;
}

void print_to_stdout(){
        printf("manos %d\n",2000);
        printf("giorgis %d\n",2500);
}

