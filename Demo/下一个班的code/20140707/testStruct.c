#include <stdio.h>

struct employeeType {
    int age;
    int workExperence;
    double salary;
};


int main(void)
{
    // 定义一个结构体变量
    struct employeeType manager;

    // 对结构体变量赋值
    manager.age = 30;
    manager.workExperence = 10;
    manager.salary = 200000.85;

    // 定义一个结构体变量的同时，进行赋值
    struct employeeType worker0 = {22, 1, 5000};

    // 定义一个结构体变量的同时，赋初值为0
    struct employeeType worker1 = {0};
    struct employeeType worker2 = {23};
    struct employeeType worker3 = {.workExperence=2};

    printf("age is %d, workExperence is %d, salary is %.2f\n", manager.age, manager.workExperence, manager.salary);
    printf("age is %d, workExperence is %d, salary is %.2f\n", worker0.age, worker0.workExperence, worker0.salary);
    printf("age is %d, workExperence is %d, salary is %.2f\n", worker1.age, worker1.workExperence, worker1.salary);
    printf("age is %d, workExperence is %d, salary is %.2f\n", worker2.age, worker2.workExperence, worker2.salary);
    printf("age is %d, workExperence is %d, salary is %.2f\n", worker3.age, worker3.workExperence, worker3.salary);

    return 0;
}
