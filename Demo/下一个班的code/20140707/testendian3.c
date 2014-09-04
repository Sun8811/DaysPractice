#include <stdio.h>

int main(void)
{
    // 0x6b(k) 0x6a(j) 0x69(i) 0x68(h)
    int a = 0x68696a6b;
    

    char *p = (char *)&a;

    for (int i = 0; i < sizeof(a); i++) {
        printf("%c ", p[i]);
    } 
    putchar('\n');
    return 0;
}
