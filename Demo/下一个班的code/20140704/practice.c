#include <stdio.h>

int main(void)
{
#if 1
    int manNum = 0;
    int womanNum = 0;
    int childNum = 0;
#endif

    int count1 = 0;
    int count2 = 0;
    int count3 = 0;

    int manIndex = 0;
    int womanIndex = 0;
    int childIndex = 0;

    //int flag = 0;

    for (manIndex = 1; manIndex < 30; manIndex++) {
        count1++;
        for (womanIndex = 1; womanIndex < 30; womanIndex++) {
            count2++;
            for (childIndex = 1; childIndex < 30; childIndex++) {
                count3++;
                if ((manIndex + womanIndex + childIndex == 30) && (3*manIndex + 2*womanIndex + childIndex == 50)) {
                    //printf("Man: %d\tWoman: %d\tChild:%d\t\n", manIndex, womanIndex, childIndex);              
#if 1
                    manNum = manIndex;
                    womanNum = womanIndex;
                    childNum = childIndex;
                    goto RESULT;
      //              flag = 1;
      //              break;
#endif
                }
            }
        //    if (flag) {
        //        break;
        //    }
        }
        //if (flag) {
        //    break;
        //}
    }

RESULT:
    //printf("Man: %d\tWoman: %d\tChild:%d\t\n", manIndex, womanIndex, childIndex);              
    printf("Man: %d\tWoman: %d\tChild:%d\t\n", manNum, womanNum, childNum);              
    printf("count1:%d count2:%d count3:%d\n", count1, count2, count3);
    return 0;
}
