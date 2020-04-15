配列
#配列の宣言
a = []
a = [1, 2, 3, 4]
a = Array.new
a = Array.new(5) => [nil, nil, nil, nil, nil,]
#文字列の配列を作る
a = %w(hoge fuga piyo hogehoge) => ["hoge", "fuga", "piyo", "hogehoge"]
#シンボルの配列を作る
a = %i(hoge fuga piyo hogehoge) => [:hoge, :fuga, :piyo, :hogehoge]
#ハッシュを配列の配列化する
h = {hoge: "fuga", piyo: "hogehoge"}
h.to_a => [[:hoge, "fuga"], [:piyo, "hogehoge"]]
#空白やカンマ区切りを配列化する
a = "hoge,fuga,piyo,hogehoge".split(',') => ["hoge", "fuga", "piyo", "hogehoge"]
-------------------------------------
#配列の値の取得(格納も同様)
a[-1] => 配列の最後の値
a[0...10] => 0番目から(10 - 1)番目まで
a[0, 2] => 0番目から2つ取得
a.values_at[0, 2, 4] => 0番目と2番目と4番目

#配列への格納
numbers[0] = 5
numbers[0] => 5
#配列への挿入
#3番目から0項目を置き換える => 挿入
a[2, 0] = ["hoge", "fuga"]

#配列から削除
a.compact! => 配列からnilを削除
a.uniq! => 配列から重複を削除
a.delete("hoge") => 配列からhogeを削除
a.delete_at(n) => 配列からn+1番目を削除

#配列の要素を置き換える
a.collect!{|item| item*2} => 配列の要素を全て2倍
a.map!{|item| item*2} => 配列の要素を全て2倍
-------------------------------------
#配列に異なるデータ型を格納することもできる
mix = [1, "one", "2"]

#大きさの取得
a = (1, 2, 3, 4)
a.size => 4

#配列の繰り返し
a.each do |n|
  p n
end
-------------------------------------
#共通集合 => どちらにも含まれる
a1 & a2
#和集合 => どちらかに含まれる
a1 | a2
#ある集合に属していない集合
a1 - a2
-------------------------------------
#配列の結合
a1 = [0, 1, 2]
a2 = [2, 3, 4]
a1 + a2 => [0, 1, 2, 2, 3, 4]
a1 | a2 => [0, 1, 2, 3, 4]
-------------------------------------
#キュー
#First in First out
a.push("hoge") => 配列の末尾に追加
a.pop => 配列の末尾を削除
a.last => 配列の末尾を参照
#スタック
#Lase in First out
a.unshift("fuga") => 配列の先頭に追加
a.shift => 配列の先頭を削除
a.first => 配列の先頭を参照
-------------------------------------
#行列
#配列の配列
a = [[0, 1, 2], [3, 4, 5]]
a[1][2] => 5
#行列の初期化
a = Array.new(2) do
  [0, 0, 0]
end
p a => [[0, 0, 0], [0, 0, 0]]
-------------------------------------
ハッシュ
#キーとオブジェクト
address = {name: "hoge", furigana: "ホゲ", postal: "1234567"}

#ハッシュの宣言
hash = {}
#キーは文字列、シンボル、数値
person = {"name" => "hoge", :furigana => "ホゲ", 3 => "123456"}
#以下の書き方は同義
address = {:name => "hoge", :furigana => "ホゲ", :postal => "1234567"}
address = {name: "hoge", furigana: "ホゲ", postal: "1234567"}

#ハッシュへの格納
address[:name] = "fuga"

#ハッシュの繰り返し
assress.each do |key, value|
  p "#{key}は#{value}"
end
nameはhoge
furiganaはホゲ
postalは123456
-------------------------------------
シンボル
#名前を識別するためのラベルをオブジェクト化したもの
:name
:furigana
:postal

sym = :name
sym.to_s => "name"
"name".to_sym => :name
