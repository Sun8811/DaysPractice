#include <stdio.h>

int main(void)
{
    int lineNum = 0;
    printf("Please Input the Line Number...\n");
    
    scanf("%d", &lineNum);

    // 通过循环来打印
    // 外层循环代表打印几行
    for (int i = 0; i < lineNum; i++) {
        // 打印第i行
        // 内层循环代表打印几个*
        for (int j = 0; j < i+1; j++) {
            putchar('*');
        }
        putchar('\n');
    }

    return 0;
}
