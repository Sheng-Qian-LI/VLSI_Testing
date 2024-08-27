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
	int x1, x2, x3, y1, y2, a, b, z, c, d, e, f, g, h;
    char binary_a[2], binary_b[2], binary_z[2], binary_a2[2], binary_b2[2], binary_z2[2];
    printf("correct circuit\n");
	printf("x1 x2 x3| a b z\n");
	printf("--------|------\n");
	for(int x1=0; x1<=1; x1++){
	    for(int x2=0; x2<=1; x2++) {
	        for(int x3=0; x3<=1; x3++) {
	            a = ~(x1 | x2);
	            b = ~(x2 & x3);
	            z = (a | b);
	            printBinary(a, binary_a), printBinary(b, binary_b), printBinary(z, binary_z);
	            printf("%d  %d  %d | %s %s %s\n", x1, x2, x3, binary_a, binary_b, binary_z);
	        }
		}
	}
	
    printf("AND-bridging fault\n");
    printf("x1 x2 x3| a b z\n");
	printf("--------|------\n");
	for(int x1=0; x1<=1; x1++){
        for(int x2=0; x2<=1; x2++) {
            for(int x3=0; x3<=1; x3++) {
                a = ~(x1 | x2);
                b = ~(x2 & x3);
                z = (a | b);
                printBinary(a, binary_a);
                printBinary(b, binary_b);
                printBinary(z, binary_z);
                c = atoi(binary_a);
                d = atoi(binary_b);
                if(c == 0 && d == 0){
	                printf("%d  %d  %d | %s %s %s V\n", x1, x2, x3, binary_a, binary_b, binary_z);
	        	}
	            else if (c == 1 && d == 1){
	                printf("%d  %d  %d | %s %s %s V\n", x1, x2, x3, binary_a, binary_b, binary_z);
				}
				else{
					a = 0, b = 0, z = 0;
					printf("%d  %d  %d | %d %d %d X\n", x1, x2, x3, a, b, z);
				}
            }
        }
    }

    printf("OR-bridging fault\n");
    printf("x1 x2 x3| a b z\n");
	printf("--------|------\n");
	for(int x1=0; x1<=1; x1++){
        for(int x2=0; x2<=1; x2++){
            for(int x3=0; x3<=1; x3++){
                a = ~(x1 | x2);
                b = ~(x2 & x3);
                z = (a | b);
                printBinary(a, binary_a), printBinary(b, binary_b), printBinary(z, binary_z);
                c = atoi(binary_a), d = atoi(binary_b), g = atoi(binary_z); 
            	if(x2 == 1 || x3 == 1){
	                a = ~(x1 | 1);
	                b = ~(x2 & 1);
	                z = (a | b);
	                printBinary(a, binary_a2);
	                printBinary(b, binary_b2);
	                printBinary(z, binary_z2);
	                e = atoi(binary_a2);
                	f = atoi(binary_b2);
					h = atoi(binary_z2);            	
	                if(g == h){
		                printf("%d  %d  %d | %d %d %d V\n", x1, x2, x3, e, f, h);
		        	}
					else{
						printf("%d  %d  %d | %d %d %d X\n", x1, x2, x3, e, f, h);
					}
				}
				else{
	                a = ~(x1 | x2);
	                b = ~(x2 & x3);
	                z = (a | b);
	                printBinary(a, binary_a2);
	                printBinary(b, binary_b2);
	                printBinary(z, binary_z2);
	                e = atoi(binary_a2);
                	f = atoi(binary_b2);
					h = atoi(binary_z2);    
					if(g == h){
		                printf("%d  %d  %d | %d %d %d V\n", x1, x2, x3, e, f, h);
		        	}
					else{
						printf("%d  %d  %d | %d %d %d X\n", x1, x2, x3, e, f, h);
					}
				}
            }
        }
    } 
	return 0;
}
