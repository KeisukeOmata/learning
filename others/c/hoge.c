#include <stdio.h>
#include <string.h>
#include "hoge.h"
#include "fuga.h"

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
    Kozotai_Kata kozotai;

    memset(&kozotai, 0, sizeof(kozotai));

    strcpy(kozotai.name, "hoge");
    kozotai.age = 27;

    n = check(name, age, msg);
    if (n != 0){
        return n;
    }

    n = print(name, age);
    if (n != 0){
        return n;
    }

    // 数値型の値を変更するので＆で渡す
    n = setName(name, &age);
    if (n != 0){
        return n;
    }

    n = print(name, age);
    if (n != 0){
        return n;
    }

    n = fuga(&kozotai);
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
    char msgSub[50 + 1];
    memset(msgSub, 0, sizeof(msgSub));

    if (strcmp(name, "") == 0)
    {
      sprintf(msgSub, "%s%d", "名前を入力してください", 0);
      strcpy(msg, msgSub);
      return 1;
    }

    if (age == 0)
    {
      sprintf(msgSub, "%s%d", "年齢を入力してください", 0);
      strcpy(msg, msgSub);
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

// int型の値を変更するのでポインタでもらう
static int setName(
    char* name,
    int* age
)
{
    strcpy(name, "fuga");
    // ポインタ
    *age = 20;
    return 0;
}