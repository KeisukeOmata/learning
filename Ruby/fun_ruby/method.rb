#メソッドの作成
def hello
  p "hello, world!"
end
hello()

def hello(name)
  p "#{name}"
end
hello("hoge") => hoge

#引数が不定の場合
def hello(a, *b, c)
  p [a, b, c]
end
hello(1, 2, 3, 4, 5) => [1, [2, 3, 4], 5]

#キーワード引数
def volume(x: 0, y: 0, z: 0)
  p x * y * z
end
volume(x: 1, y: 2, z: 3) => 6
------------------------
#戻り値
def volume(x, y, z)
  return x * y * z
end
p volume(1, 2, 3) => 6

#returnがない場合はメソッド内で最後に得られる値が返される
def volume(x, y, z)
  x * y * z
end
p volume(1, 2, 3) => 6
------------------------
#呼び出し
#オブジェクト == レシーバ
#引数 == パラメータ
オブジェクト.メソッド名(引数1, 引数2..引数n)
------------------------
メソッドの分類

#インスタンスメソッド
#オブジェクト(インスタンス).メソッド名
"hoge".to_i
1000.to_s

#クラスメソッド
#クラス.メソッド名 == クラス::メソッド名
Array.new == Array::new
File.open("hoge") == File::open("hoge")

#関数的メソッド
hello()
------------------------
メソッドの呼び出し制限
class hoge
  #インスタンスメソッドとして使える
  #hoge.pub => pub
  def pub
    p "pub"
  end
  public :pub

  #レシーバを利用して呼び出せないようにする => インスタンスの外側からは利用できない
  #hoge.priv => エラー！！
  #initializeは常にprivate
  def priv
    p "priv"
  end
  private :priv

  #同一クラスであればインスタンスメソッドとして使える
  #hoge.prot => prot
  #fuga.prot => エラー！！
  def prot
    p "prot"
  end
  protected :prot

  #引数を指定しなければ以降のメソッドはpublicになる
  public
end
------------------------
#メソッドに別名を割り当てる
#alias 新しい名前 古い名前
alias new_name name == alias :new_name :name

#メソッドをなかったことにする
undef method == undef :method
------------------------
print("Hello, Ruby.\n")
print "Hello, Ruby.\n"
#改行あり
puts "Hello, Ruby."
p "Hello, Ruby."
p 100
p "100"

#変数の展開
a = 100
p "数字は#{a}"

#大きさの取得
a = (1, 2, 3, 4)
a.size => 4