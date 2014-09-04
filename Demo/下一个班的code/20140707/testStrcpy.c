#include <stdio.h>
#include <string.h>


int main(void)
{
    char src[] = "Hello, world";

    char dst[10] = {0};

   strcpy(dst, src);

    char *p = &src[4];
   // strcpy(p, src);
    return 0;
}
