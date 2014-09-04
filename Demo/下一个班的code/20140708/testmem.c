#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#define STRSIZE  128

int main(void)
{
    char *p = NULL;
    
    char *str = "hello string, hello students hello qingyunxhello string";

    printf("p:%p\n", p);
    p = malloc(STRSIZE);
    printf("p:%p\n", p);

    strncpy(p, str, STRSIZE);

    printf("%s\n", p);

    memset(p, 'x', STRSIZE-1);
    p[STRSIZE-1] = '\0';
    printf("%s\n", p);
    
    free(p);
    printf("p:%p\n", p);

    strncpy(p, str, STRSIZE);
    p = NULL;
    printf("p:%p\n", p);
    return 0;
}
