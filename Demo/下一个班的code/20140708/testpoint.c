#include <stdio.h>

int main(void)
{
    //  定义
    int arr[10] = {0};
    
    int *p = arr;

    for (int i = 0; i < 10; i++) {
        // arr[i] = i;
        // p[i] = i;
        *(p+i) = i;
        printf("p: %p p+i: %p *p: %d *(p+i): %d\n", p, p+i, *p, *(p+i));
    }
/*
    // 首先定义了一个int类型的指针变量，然后，给这个变量(p2)赋值为27
    int *p2 = 27;

    p2 = 28;

    *p2 = 29;
*/
   int bad[10000][10000]; 

    return 0;

}
