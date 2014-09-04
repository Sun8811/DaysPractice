#include <stdio.h>

int main(void)
{
    int varWeather = 0;
    if (varWeather != 0) //{ if (0)
        printf("I am not going out.\n");
        printf("Other...\n");
   // if (varWeather == 0) // if(1)
        /*
    } else {
        printf("I am go shopping.\n");
    }
    */
    //printf("Normal...\n");
    int myInt = -1;
    if (myInt >= 0) {
        if (myInt <= 10)
            printf("myInt is between 0 and 10.\n");
    } else
            printf("myInt is not between 0 and 10.\n");

    return 0;
}
