#include <stdio.h>
#include <stdlib.h>

int main(void)
{
    int var = 0;
    var = atoi("123");

    printf("a:atoi %d\n", var);


    double dVar = strtod("3.14", NULL);
    printf("%.2f\n", dVar);


    long var = strtol("1889", NULL, 10);
    printf("var is %l\n", var);
    return 0;
}
