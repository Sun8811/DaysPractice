#include <stdio.h>

enum weekDays {
    Monday=1,   // 0
    Tuesday,
    Wednesday,
    Thursday,
    Friday,
    Saturday,
    Sunday
};


int main(void)
{
    int day;
    printf("Please Input the Day Today:\n");
    scanf("%d", &day);

    switch (day) {
        case Monday:
        printf("Today is Monday!:%d\n", Monday);
        break;
        case Tuesday:
        printf("Today is Tuesday!\n");
        break;
        case Wednesday:
        printf("Today is Wednesday!\n");
        break;
        case Thursday:
        printf("Today is Thursday!\n");
        break;
        case Friday:
        printf("Today is Friday!\n");
        break;
        case Saturday:
        printf("Today is Saturday!:%d\n", Saturday);
        break;
        case Sunday:
        printf("Today is Sunday!\n");
        break;
        default:
            printf("Unknown day!\n");
            break;
    }

    enum weekDays today = Saturday;
    enum weekDays tomorrow = 0.1;
    printf("today is : %d\n", today);
    printf("tomorrow is : %d\n", tomorrow);
    return 0;
}
