#include <stdio.h>

typedef unsigned int uint32;

typedef union testUnion {
    char a;
    int b;
    float c;
    long d;
} TestUnion;

int main(void)
{
    // union testUnion unionVar = {0};
    int var0 = 10;
    TestUnion unionVar = {0};
    
    unsigned int var = 10;
    uint32 var2 = 20;
    unionVar.a = 'X';

    printf("%d %u %u\n", var0, var, var2);
    printf("unionVar.b: %d\n", unionVar.b);  

    return 0;
}
