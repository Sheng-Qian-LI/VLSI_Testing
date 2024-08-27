#include <stdio.h>
#include <stdlib.h>

void printBinary(int btd, char binary[])
{
    sprintf(binary, "%s", "");
    for (int i = 0; i >= 0; i--) {
        sprintf(binary, "%s%d", binary, (btd >> i) & 1);
    }
}

int main() 
{	
	int a, b, z;
    char binary_a[2], binary_b[2], binary_z[2];
    printf("correct circuit\n");
	printf("x1 x2 x3| a b z\n");
	printf("--------|------\n");
	for(int x1=0; x1<=1; x1++){
	    for(int x2=0; x2<=1; x2++){
	        for(int x3=0; x3<=1; x3++){
	            a = ~(x1 | x2);
	            b = ~(x2 & x3);
	            z = (a | b);
	            printBinary(a, binary_a), printBinary(b, binary_b), printBinary(z, binary_z);
	            printf("%d  %d  %d | %s %s %s\n", x1, x2, x3, binary_a, binary_b, binary_z);
	        }
		}
	}
} 
