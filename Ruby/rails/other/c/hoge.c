#include <stdio.h>
#include <string.h>
#include "hoge.h"

static int check(char*, int, char*);
static int print(char*, int);
static int setName(char*, int*);

int hoge(
    char* name,
    int age,
    char* msg
)
{
    int n = 0;

    n = check(name, age, msg);
    if (n != 0){
        return n;
    }

    n = print(name, age);
    if (n != 0){
        return n;
    }

    n = setName(name, &age);
    if (n != 0){
        return n;
    }

    n = print(name, age);
    if (n != 0){
        return n;
    }

    return 0;
}

static int check(
    char* name,
    int age,
    char* msg
)
{
    if (strcmp(name, "") == 0)
    {
        strcpy(msg, "名前を入力してください");
        return 1;
    }

    if (age == 0)
    {
        strcpy(msg, "年齢を入力してください");
        return 1;
    }

    return 0;
}

static int print(
    char* name,
    int age
)
{
    printf("name = %s age = %d\n", name, age);
    return 0;
}

static int setName(
    char* name,
    int* age
)
{
    strcpy(name, "fuga");
    *age = 20;
    return 0;
}