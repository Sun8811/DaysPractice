#include <stdio.h>

int main(void)
{
    char c = 0x68;
    printf("%c\n", c);

    printf("%d\n", c);

    int i = 0x68696a6b;
    int *p = i;
    printf("%d\n", i);
    printf("%p\n", p);
    return 0;
}
