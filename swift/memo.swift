CocoaPods

sudo jem install cocoapods
pod setup
cd アプリ
pod init
//podファイルに追記
pod 'Alamofire', '~> 5.2'
pod install
---------------------------------------------
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

//nilに対してプロパティを取得しようとしたり、メソッドを呼び出すことがなくなる
var cat: cat?
cat?.name
=> nil
cat?.hello()
=> nil
---------------------------------------------
デリゲートメソッドの使用方法
1,宣言
class ViewController: UIViewController, WKNavigationDelegate {
2,設定
    override func viewDidLoad() {
        webView.navigationDelegate = self
    }
}
3,記述
func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
}
---------------------------------------------
継承

Animalモデル
class Animal {
    func bless() {
        print("息をする")
    }
}

Dogモデル
class Dog: Animal {

    //親クラスのメソッドを呼び出す
    override func bless() {
        super.bless()
        bark()
    }

    func bark() {
        print("ワン")
    }
}
---------------------------------------------
indexPath => 0からインクリメント
---------------------------------------------
クラス名と変数名を同一にするとエラー(再帰的な問題?)
クラスは先頭大文字、変数は先頭小文字にするなど
---------------------------------------------
//アプリ内のデータを削除
UserDefaults.standard.removeObject(forKey: "キー値")
---------------------------------------------