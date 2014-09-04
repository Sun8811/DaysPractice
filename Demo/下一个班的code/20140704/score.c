#include <stdio.h>

int main(void)
{
    int score;
    do{
        printf("Please Input The Score:\n");
        scanf("%d", &score);
    } while (score < 0 || score > 100);
    printf("score: %d\n", score);
#if 0
    if (score >= 90 && score <= 100) {
        printf("Best!\n");
    } else if (score >= 80 && score < 90) {
        printf("Good!\n");
    } else if (score >= 70 && score < 80) {
        printf("Normal!\n");
    } else if (score >= 60 && score < 70) {
        printf("Ok!\n");
    } else {
        printf("NOK!\n");
    }
#endif

    switch (score/10) {
        case 10:
        case 9:
            printf("Best!\n");
            break;
        case 8:
            printf("Good!\n");
            break;
        case 7:
            printf("Normal!\n");
            break;
        case 6:
            printf("OK!\n");
            break;
        default:
            printf("NOK!\n");
            break;
    }

    return 0;
}
