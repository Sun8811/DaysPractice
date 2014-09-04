#include <stdio.h>

extern int gVar;
//extern static int staticVar;

void otherFunc(void)
{
    printf("%s: %d\n", __func__, gVar);
}

