//オプショナル型　=> nilを許容
//変数宣言時以外の?, !はオプショナル型とは無関係
//何に使うの => 設定しなくて良い画像とか
var hoge: Int?
println(hoge) => nil

var a: Int  = 10
var b: Int? = 10
a + b
=>エラーが起きる
a + b!
=> 20

//暗黙的アンラップ型
//nilで宣言したいが使うときには絶対に値が入っているようなものに使用
var a: Int  = 10
var b: Int! = 10
a + b
=> 20
---------------------------------------------
var piyo: String? = "hello world"
println(piyo) => Optional("hello world")

//強制的アンラップ
//nilだと落ちる
println(piyo!) => "hello world"
---------------------------------------------
//オプショナルバインディング
if let unwrappedPiyo = piyo {
    println(unwrappedPiyo)
}
else {
    println("piyoはnilです")
}
//条件式で代入された変数は、アンラップされたものとなる
=> "hello world"
---------------------------------------------
//オプショナルチェイニング
var dog: Dog? = Dog()
dog?.name
=> "Optional(犬)"
dog?.hello()
=> "Optional(ワン)"

var cat: cat?
cat?.name
=> nil
cat?.hello()
=> nil