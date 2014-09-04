#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>
#include <string.h>

int main(void)
{
    int var = 0;
    var = atoi("123");

    printf("a:atoi %d\n", var);


    double dVar = strtod("3.14", NULL);
    printf("%.2f\n", dVar);

    long longVar = strtol("1898", NULL, 10);
    printf("%ld\n", longVar);

    char c = 'G';
    printf("%c\n", tolower(c));

    char *str = "Hello, world!\n";
    char *p = strchr(str, '\0');
    printf(" %p %p %s", str, p, p);
    printf("%s\n", strstr(str, "rl"));

    return 0;
}
