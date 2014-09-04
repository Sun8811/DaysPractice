#include <stdio.h>
#include <string.h>

int main(void)
{
    char src[] = "World!";
    char dst[32] = "Hello";

    //strncat(dst, src, 2);
    // HelloWo
    
    strncat(dst, src, 10);


    printf("dst : %s\n", dst);

    return 0;
}
