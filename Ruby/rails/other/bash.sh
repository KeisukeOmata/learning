#!/bin/bash

# 実行
# -vxで処理が出力される
sh -vx ./bash.sh

# 権限を変更する
chmod 777 hoge.sh

hoge="ls"
# ダブルクォート
# 変数展開
echo "${hoge}" => ls

# シングルクォート
# 文字列
echo '${hoge}' =>&{hoge}

# バッククォート
# コマンド実行
`echo ${hoge}` => bash.sh hoge.sh hoge.sh
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

# 代入
# ""は文字列
a="hoge"
b="fuga"

# 条件式
# スペースを入れないとエラー
if [ "${a}" = "${b}" ]; then
  echo "${a}"
else
  echo "${b}"
fi

hoge="fuga"
# fugaをファイル名に含む全て
ALL=`ls "${hoge}"*`
for i in "${ALL}"
do
  echo "${i}"
done