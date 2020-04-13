#include <stdio.h>
#include <string.h>
#include "hoge.h"

void hoge(int a, int b){
  printf("a = %d b = %d\n", a, b);
}

// 関数はポインタ
void fuga(int* a, int* b){
  // 呼び出し元は＆で渡す
  printf("a = %p b = %p\n", &a, &b);
  // ポインタであれば戻り値以外だけでなく複数の値を変更可能
  *a = 100;
  *b = 200;
}