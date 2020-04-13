#include <stdio.h>
#include <string.h>
#include "hoge.h"

int main() {
  // 変数宣言
  int num = 0;
  int i = 0;
  char s[4 + 1];
  // 初期化
  memset(s, 0, sizeof(s));
  // 値の設定
  strcpy(s, "hoge");

  num = hoge(num);
  printf("Hell%d %s\n", num, s);
}