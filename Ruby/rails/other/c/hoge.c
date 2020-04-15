#include <stdio.h>
#include <string.h>
#include "hoge.h"

static int number(int, int);
// プロトタイプ宣言はポインタ
static int pointer(int*, int*);

int hoge(){
    // 宣言はポインタではない
    int a = 0;
    int b = 1;
    int n = 0;
    char piyo[6 + 1];

    memset(piyo, 0, sizeof(piyo));

    strcpy(piyo, "hogera");

    printf("%s\n", piyo);

    n = number(a, b);
    // 呼び出し元は＆で渡す
    n = pointer(&a, &b);
    n = number(a, b);

    return (0);
}

static int number(int a, int b){
    printf("a = %d b = %d\n", a, b);
    return (0);
}

// 関数はポインタ
static int pointer(int* a, int* b){
    // 呼び出し元は＆で渡す
    printf("a = %p b = %p\n", &a, &b);
    // ポインタであれば戻り値以外だけでなく複数の値を変更可能
    *a = 100;
    *b = 200;
    return (0);
}