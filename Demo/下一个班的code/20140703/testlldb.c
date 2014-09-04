#include <stdio.h>

int add(int a, int b)
{
    return a+b;
}

int main(void)
{
    int x = 10;
    int y = 20;
    int result = 0;

    result = add(x, y);
    printf("result is : %d\n", result);
    return 3;
}
