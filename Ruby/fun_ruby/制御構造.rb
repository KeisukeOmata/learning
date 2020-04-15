#if
if 条件　(then)
  命令
elsif 条件2　(then)
  命令2
elsif 条件3　(then)
  命令3
else
  命令4
end

#短縮
p "aとbは等しい" if a == b
------------------------------
#unless
#条件が偽のとき実行
unless 条件　(then)
  命令
else
  命令2
end

#短縮
p "aとbは等しくない" unless a == b
------------------------------
#case
#ifとの使い分けはオブジェクトが1つかつ、そのオブジェクトの値によって場合分けをしたい場合
#case文ではwhenで指定した値との比較を === を用いて行う
case オブジェクト名
when 値1 (then)
  命令1
when 値2 (then)
  命令2
when 値3 (then)
  命令3
else
  命令4
end
------------------------------
#times
#回数の指定された繰り返し
#iは0から始まる
繰り返し回数.times do (|i|)
  命令
end

繰り返し回数.times (|i|) {
  命令
}

#from.updo(2から10まで)
2.updo(10) do |i|
  p i
end

#from.downto(10から2まで)
10.downdo(2) do |i|
  p i
end

#from.step(to, step)(2から10まで3ずつ)
2.step(10, 3) do |i|
  p i
end
------------------------------
#each
#オブジェクトから要素を取り出す場合
a = []
a.each do |n|
  p n
end

a.each {|n|
  p n
}

#ハッシュを渡す
h = {"hoge" => 1000, "fuga" => 2000}
h.each do |name, number|
  p name
  p number
end

#indexを付与
a = ["hoge", "fuga"]
a.each_with_index do |n, i|
  p "#{i + 1}番目は#{n}"
end

#ファイルの1行毎
#each_char, each_byteもある
file = File.open("hoge.text")
begin
  file.each_line do |line|
    p line
  end
ensure
  file.close
end
------------------------------
#for
#iは範囲オブジェクトの開始値
#範囲オブジェクトの間くり返す
# i += 1 以外の場合はwhileが適している
for i in 範囲オブジェクト (do)
  命令
end

for i in 1..3 (do)
  p i
end
1
2
3

numbers = [0, 1, 2]
for number in numbers
  p number
end
0
1
2
------------------------------
#while
#条件がtrueの間くり返す
# i += 1 の場合はforが適している
i = 1
while 条件 (do)
  命令
end

i = 1
while i < 10 (do)
  i += i
  p i
end
2
4
8
16
------------------------------
#until
#条件がfalseの間くり返す == 条件が成立するまでくり返す
#while文で ! を使うのが直感的でない場合に使う
i = 1
until 条件 (do)
  命令
end
------------------------------
#loop
#回数制限のないくり返し
loop do
  p "すぐにけせ"
end
------------------------------
#繰り返しの制御
#繰り返しを中断し、繰り返しから抜ける
break
#次の回の繰り返しに処理を移す
next
#同じ条件で繰り返しをやり直す
redo
------------------------------
#条件と真偽値
真 == falseとnil以外のオブジェクト全部
偽 == false or nil

#文字列の長さが0のときにtrueを返す
#真偽値を返すメソッドの末尾には?を付ける
.empty?
"".empty? => true
"dog".empty? => false

#正規表現は 位置 or nil を返す
p /dog/ =~ "hotdog" => 4
p /cat/ =~ "hotdog" => nil
------------------------------
演算子

i = i + 1
i += 1
------------------------------
論理演算子

#かつ
&&
#または
||
#ではない
!=

#一致
==
p 1.0 == 1 => true
#厳密に一致
.eql?
p 1.0.eql?(1) => false

#文字列や数値の場合は ==
#正規表現の場合は =~
#クラスの場合はそのクラスのインスタンスかどうかを判定
===

#varがnilかfalseでなければ、nameにvarを代入
#varがnilかfalseならば、nameにhogeを代入
name = var || "hoge"

#nilではないときにメソッドを呼び出す
hoge = array&.first
------------------------------
条件演算子(三項演算子)

a = 1
b = 2
#条件 ? 式1(if) 式2(else)
#a > bであればa
#a > bでなければｂ
max = (a > b) ? a : b
p max => 2
------------------------------
範囲演算子

p (1..5).to_a => [1, 2, 3, 4, 5]