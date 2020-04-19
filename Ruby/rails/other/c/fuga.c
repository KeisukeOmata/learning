#include <stdio.h>
#include <string.h>
#include "hoge.h"
#include "fuga.h"

int fuga(
    Kozotai_Kata* kozotai
)
{
    printf("構造体name = %s 構造体age = %d\n", kozotai->name, kozotai->age);
    return 0;
}