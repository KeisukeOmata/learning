#include <stdio.h>
#include <string.h>
#include "hoge.h"
 
int main(){
    // 宣言は普通
    int a = 0;
    int b = 1;
    char piyo[6 + 1];

    memset(piyo, 0, sizeof(piyo));

    strcpy(piyo, "hogera");

    printf("%s\n", piyo);

    hoge(a, b);
    // 呼び出し元は＆で渡す
    fuga(&a, &b);
    hoge(a, b);
}