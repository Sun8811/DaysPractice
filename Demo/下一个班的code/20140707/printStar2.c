#include <stdio.h>

int main(void)
{
    int lineNum = 0;
    printf("Please Input the Line Number...\n");
    scanf("%d", &lineNum);
    int maxStarNum = 2 * lineNum - 1;

    // 用外层循环表示打印lineNum行
    for (int i = 0; i < lineNum; i++) {
        int spaceNum = i;
        int starNum = maxStarNum - 2 * spaceNum;
        // 打印空格
        for (int j = 0; j < spaceNum; j++) {
            putchar(' ');
        }
        // 打印星星
        for (int k = 0; k < starNum; k++) {
            putchar('*');
        }
        // 打印换行
        putchar('\n');
    }
    return 0;
}
