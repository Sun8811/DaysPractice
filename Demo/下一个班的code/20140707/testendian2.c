#include <stdio.h>

int main(void)
{
    int a = 1;

    char *p = (char *)&a;

    printf("%d\n", (int)*p);

    return 0;
}
