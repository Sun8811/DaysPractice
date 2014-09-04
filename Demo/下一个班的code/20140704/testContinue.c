#include <stdio.h>

int main(void)
{
    int firstVar = 10;
    while (firstVar--) {
        if (!(firstVar % 2)) {
            continue;
        }
        printf("loop:%d", firstVar);
    }
    printf("Pass the loop!\n");
    return 0;
}
