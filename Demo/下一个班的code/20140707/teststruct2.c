#include <stdio.h>
//#include <string.h>


extern char *
     strncpy(char *restrict dst, const char *restrict src, size_t n);

typedef struct {
    char name[16];
    int age;
    int studyID;
} Student;


int main(void)
{
    Student stu1 = {0};
    //stu1.name = "zhangsan";
    strncpy(stu1.name, "zhangsan", sizeof(stu1.name)-1);
    //char *p = &stu1.name;
    //strncpy(p, "zhangwanglizhao", sizeof(p)-1);

    stu1.age = 18;
    stu1.studyID = 20140001;

    printf("stu1: name:[%s] age:[%d] studyID:[%d]\n", stu1.name, stu1.age, stu1.studyID);    


    Student stu2 = {
        "lisi",
        22,
        20140002
    };

    printf("stu2: name:[%s] age:[%d] studyID:[%d]\n", stu2.name, stu2.age, stu2.studyID);    
    return 0;
}
