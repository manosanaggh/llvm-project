#include <stdio.h>

FILE *fptr = NULL;

void print_to_stdout();

void print_to_stdout_2(){
        printf("manos %d %f\n",2000,7.899999);
        printf("giorgis %d %f\n",2500,6.79999);
}

int main(){
	fptr = fopen("/spare/manosanag/myllvm/llvm-project/tmp/log.txt", "w");
	print_to_stdout();
	print_to_stdout_2();
	fprintf(fptr,"manos %d\n",2000);
	fprintf(fptr,"giorgis %d\n",2500);
        printf("manos %d %s\n",2000,"poi");
        printf("giorgis %d %s\n",2500,"kl");
	fclose(fptr);
	return 0;
}

void print_to_stdout(){
        printf("manos %d %f %p\n",2000,7.8,main);
        printf("giorgis %d %f %p\n",2500,6.7,main);
}

