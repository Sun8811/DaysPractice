#include <stdio.h>
#include "hello.h"

extern void foo(void);
extern void bar(void);

// gVar是全局变量
int gVar = 10;

// staticVar是静态变量
static int staticVar = 20;

int main(void) 
{
    printf("%s: %d, %d\n", __func__, gVar, staticVar);
    foo();
    bar();
    otherFunc();
    return 0;
}


void foo(void)
{
    printf("foo: %d, %d\n", gVar, staticVar);
}

void bar(void)
{
    printf("bar: %d, %d\n", gVar, staticVar);
}


