#オブジェクト(インスタンス)
#クラス
数値オブジェクト
Numericクラス
文字列オブジェクト
Stringクラス
配列オブジェクト
Arrayクラス
ハッシュオブジェクト
Hashクラス
正規表現オブジェクト
Regexpクラス
ファイルオブジェクト
Fileクラス
シンボルオブジェクト
Symbolクラス
etc..
------------------------------
#変数
#先頭が$
グローバル変数
#先頭が小文字or_(アンダーバー)
ローカル変数
#先頭が@
インスタンス変数
#先頭が@@
クラス変数
#nil, true, false, selfなど
擬似変数
#先頭が大文字で始まる
定数
------------------------------
#多重代入
a, b, c = 1, 2, 3
#変数の頭に*を付けると余りが配列として代入される
a, b, *c = 1, 2, 3, 4, 5
p c => [3, 4, 5]
a, *b, c = 1, 2, 3, 4, 5
p b => [2, 3, 4]
p c => 5

#値の入れ替え
a, b = 0, 1
a, b = b, a
p [a, b] => [1, 0]

#配列の要素を取り出す
ary = [0, 1]
a, b = ary
P [a, b] => [0, 1]