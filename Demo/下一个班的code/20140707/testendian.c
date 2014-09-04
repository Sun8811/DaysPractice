#include <stdio.h>


int main(void)
{
    union {
        char a;
        int b;
    } endian = {0};
    
    endian.b = 1;
    

    // 小端(Little endian): 低地址放低字节，高地址放高字节
    // 大端(Big endian): 低地址放高字节，高地址放低字节
    if (endian.a) {
        printf("Little endian!\n");
    } else {
        printf("Big endian!\n");
    }

    return 0;
}
