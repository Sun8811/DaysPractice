#include <stdio.h>
#include <stdlib.h>
#include <time.h>

#define ARRAYSIZE  1000

int randArray[ARRAYSIZE] = {0};

/*
 * 用来产生指定上限(upper_bound)的随机数
 */
int gen_random(int upper_bound)
{
    return rand() % upper_bound; 
}

/*
 * 统计指定数字出现的次数
 */
int howmany(int value)
{
    int counter = 0;
    for (int i = 0; i < ARRAYSIZE; i++) {
        if (value == randArray[i]) {
            counter++;
        }
    }    
    return counter;
}

int main(void)
{
    srand(time(NULL));
    // 1. 生成一系列的随机数并保存到数组中
    for (int i = 0; i < ARRAYSIZE; i++) {
        randArray[i] = gen_random(10);
    }

    // 2. 统计每个数字出现的次数，并打印
    for (int j = 0; j < 10; j++) {
        printf("%d's count: %d\n", j, howmany(j));
    }
    return 0;
}
