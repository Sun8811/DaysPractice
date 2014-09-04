#include <stdio.h>
#include <stdlib.h>

int gen_random(int upper_bound);

int main(void)
{
    int randNum;

    for (int i = 0; i < 10; i++) {
        randNum = random();
        //randNum = gen_random(10);
        printf("randNum: %d\n", randNum);
    }
    return 0;
}
