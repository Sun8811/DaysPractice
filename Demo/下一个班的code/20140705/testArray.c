#include <stdio.h>

int main(void)
{
    // 定义一个数组
    int array[10];
    int array2[10] = {0, 1 ,2 ,3};
    int array3[] = {0, 1, 2, 3, 4, 5};
    int array4[10];

    array[0] = 0;
    array[1] = 1;
    
    // 数组循环赋值
    for (int i = 0; i < 10; i++) {
        array[i] = i;
        printf("%d ", array[i]);
    }

    putchar('\n');
    array4 = array;
    return 0;
}
