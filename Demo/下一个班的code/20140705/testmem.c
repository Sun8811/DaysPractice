#include <stdio.h>

int glVar;
static int gStaticVar;

int main(void)
{
    char *p = "abcd";
    char str[] = "123";
    int testVar = 97;
    char testChar = 'x';
    static int gStaticIn;

    printf("glVar: %d\n", glVar);
    printf("gStaticVar: %d\n", gStaticVar);
    printf("gStaticIn: %d\n", gStaticIn);
    printf("p->: %s\n", p);
    printf("str: %s\n", str);
    printf("testVar: %d\n", testVar);
    printf("testChar: %c\n", testChar);

    return 0;
}
