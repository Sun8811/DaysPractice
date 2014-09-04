#include <stdio.h>

void ChangeVarValue(int *numDots);

int main (void)
{
    int numDots;
    numDots = 30;

    ChangeVarValue(&numDots);
    printf("in main numDots's value: %d\n", numDots);

    return 0;
}

void ChangeVarValue(int *numDots)
{
    *numDots = 40;
    printf("numDots's value is %d\n", *numDots);
}
