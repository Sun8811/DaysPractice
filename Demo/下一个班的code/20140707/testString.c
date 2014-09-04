#include <stdio.h>
#include <string.h>

int main(void)
{
    // 定义一个字符串常量
    //int var = 10;
    //int intArr[] = {1, 2, 3, 4, 5};
    // 数组只能在定义的时候用一个字符串字面常量fu值
    char str[] = "Hello, wor ld!";
    char str1[] = {'H', 'e', 'l', 'l'};  
    char *p = "Hello, world!";
    int length = 0;
    //length = strlen(p);
    length = strlen(str);
    printf("length is %d\n", length);

    printf("str address: %p\n", str);
    printf("p address: %p\n", &p);
    printf("p-> address: %p\n", p);
    
    // 下面赋值是错误的
    //str = "GoodBye!";
    printf("%c\n", "students"[3]); 

    /*
     * [] 是指针偏移后取值的运算符
     * [2] 值指针偏移两个单位
     * 具体每个单位多大，要看指针指向的类型
     * eg: int *p = 0x100; p[2]就代表取0x108该内存地址的整型值
     * eg: char *str = "hello"; str[4]就代表取得o这个字符
     * eg: char array[3][10] = {"Hello", "world", "qingyun"}; array[2]就取得"qingyun"（也就是"qingyun"这个字符串的首地址）
     */

    return 0;
}
