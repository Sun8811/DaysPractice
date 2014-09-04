#include <stdio.h>

int main(void)
{
    int firstVar = 20;
    int secVar = 30;
    int thirdVar;
    float forthVar = 16.38;
    float fifthVar;
    int tmpVar;

    thirdVar = 50;
    thirdVar = secVar;
    // 左值不能为常量
//    80 = thirdVar;
    
    // + -
    tmpVar = firstVar + forthVar;
    fifthVar = firstVar + forthVar;
    printf("result:%d\n", tmpVar);
    printf("result:%f\n", fifthVar);

    // ++ --
    thirdVar = secVar++;
    printf("++ thirdVar: %d\n", thirdVar);
    printf("secVar: %d\n", secVar);

    thirdVar = --firstVar;
    printf("-- thirdVar: %d\n", thirdVar);
    printf("firstVar: %d\n", firstVar);

    // += -=   thirdVar : 19
    thirdVar += 10;
    printf("thirdVar: %d\n", thirdVar);

    thirdVar -=5;
    printf("thirdVar: %d\n", thirdVar);

   // () firstVar:2; secVar:3 tmpVar:4  -> 23
   firstVar = 2;
   secVar = 3;
   tmpVar = 4;
   thirdVar = firstVar + (secVar * (3 + tmpVar)); 
   printf("thirdVar: %d\n", thirdVar);

   // % --> 取余数 模数运算
   firstVar = 7;
   thirdVar = firstVar % 3;
   printf("thirdVar: %d\n", thirdVar);
  
    return 0;
}
