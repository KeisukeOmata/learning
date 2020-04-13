#include <stdio.h>
 
void hoge(int, int);
// プロトタイプ宣言はポインタ
void fuga(int*, int*);
 
int main(){
    // 宣言は普通
    int a = 0;
    int b = 1;
    hoge(a, b);
    // 呼び出し元は＆で渡す
    fuga(&a, &b);
}
 
void hoge(int a, int b){
  printf("a = %d b = %d\n", a, b);
}

// 関数はポインタ
void fuga(int* a, int* b){
  // 呼び出し元は＆で渡す
  printf("a = %p b = %p\n", &a, &b);
}