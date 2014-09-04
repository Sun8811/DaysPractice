#include <stdio.h>

int main(void)
{
    char chVar = 'x';
    short shortVar = 10;
    int intVar = 20;
    unsigned int usVar = 30;
    long longVar = 40;
    long long ago = 50;
    float fVar = 10.1;
    double dVar = 20.2;

    char arr[10] = "hello";
    int intArr[8] = {0};
    int arr2[3][4] = {0};

    char *p = "Hello world!";
    int *p1 = &intVar;

    printf("sizeof(chVar): %lu\n", sizeof(chVar));
    printf("sizeof(shortVar): %lu\n", sizeof(shortVar));
    printf("sizeof(intVar): %lu\n", sizeof(intVar));
    printf("sizeof(usVar): %lu\n", sizeof(usVar));
    printf("sizeof(longVar): %lu\n", sizeof(longVar));
    printf("sizeof(ago): %lu\n", sizeof(ago));
    printf("sizeof(fVar): %lu\n", sizeof(fVar));
    printf("sizeof(dVar): %lu\n", sizeof(dVar));
    printf("sizeof(arr): %lu\n", sizeof(arr));
    printf("sizeof(intArr): %lu\n", sizeof(intArr));
    printf("sizeof(arr2: %lu\n", sizeof(arr2));
    printf("sizeof(p): %lu\n", sizeof(p));
    printf("sizeof(p1): %lu\n", sizeof(p1));
    printf("sizeof(*p): %lu\n", sizeof(*p));
    printf("sizeof(*p1): %lu\n", sizeof(*p1));
    printf("sizeof(*p1): %lu\n", sizeof(30));

    return 0;
}
