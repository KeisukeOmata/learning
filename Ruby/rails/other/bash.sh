#!/bin/bash

# 権限を変更する
chmod 777 hoge.sh

# 代入
# ""は文字列
a="hoge"
b="fuga"

# 条件式
if [$a -eq $b]; then
  echo $a
else
  echo $b
fi

# {}は変数を明示
# $は変数の値を参照
hoge="ls"
# ダブルクォート
# 変数展開
echo "${hoge}"

# シングルクォート
# 文字列
echo '${hoge}'

# バッククォート
# コマンド実行
`echo ${hoge}`
$(echo ${hoge})

# 標準入力
0
# 標準出力
1
# 標準エラー出力
2
# 標準エラー出力の結果を標準出力にマージする
2>&1
# 破棄する
/dev/null
# 出力を全て破棄する
command > /dev/null 2>&1