#クラス
#クラス.メソッド名
a = Array.new
p a => []

#クラスの確認
a.class => Array
a.instance_of?(Array) => true

class HelloWorld
  # .newでオブジェクトを作成すると、initializeメソッドが呼ばれる
  def initialize(name = "hoge")
    #インスタンス変数の初期化
    @name = name
  end

  #インスタンスメソッド
  def hello
    p "#{@name}"
  end

  #アクセスメソッド
  #nameメソッドを作成
  #参照のみ可能にする(getter)
  attr_reader :name
  #変更のみ可能にする(setter)
  attr_writer :name
  #参照と変更を可能にする(アクセスメソッド)
  attr_accessor :name

  #上記nameメソッドを別のインスタンスメソッドから呼ぶ
  #レシーバがクラス名のときはselfを使う
  def hoge
    p "#{self.name}"
  end

  #クラスメソッドを定義
  class << self
    def hello(name)
      p "#{name}"
    end
  end
  #上記と同義
  def self.hello(name)
    p "#{name}"
  end
  
end
------------------------------
#継承
#既に定義されているクラスを拡張して新しいクラスを作る

#スーパークラス
#継承元
時計クラス

#サブクラス
#継承先
デジタル時計クラス
アナログ時計クラス
------------------------------
#オブジェクト(インスタンス)
数値オブジェクト => Numericクラスのオブジェクト
文字列オブジェクト => Stringクラスのオブジェクト
配列オブジェクト => Arrayクラスのオブジェクト
ハッシュオブジェクト => Hashクラスのオブジェクト
正規表現オブジェクト => Regexpクラスのオブジェクト
ファイルオブジェクト => Fileクラスのオブジェクト
シンボルオブジェクト => Symbolクラスのオブジェクト
etc..

#アイデンティティ
a = []
p a.object_id => 6375931

str1 = "hoge"
str2 = str1
str3 = fuga
p str1.equal?(str2) => true
p str1.equal?(str3) => false
------------------------------
#変数
#先頭が$
グローバル変数

#先頭が小文字or_(アンダーバー)
ローカル変数
=> メソッド毎に異なる変数として扱われる

#先頭が@
インスタンス変数
=> 同じインスタンス(オブジェクト)内であれば、メソッド定義を越えて値を参照や変更できる
=> インスタンス毎に異なる値を持つ

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
