配列
#配列の宣言
a = []
numbers = [1, 2, 3, 4]
numbers[0] => 1

#配列への格納
numbers[0] = 5
numbers[0] => 5

#配列に異なるデータ型を格納することもできる
mix = [1, "one", "2"]

#大きさの取得
a = (1, 2, 3, 4)
a.size => 4

#配列の繰り返し
a.each do |n|
  p n
end
1
2
3
4
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
-------------------------------------
