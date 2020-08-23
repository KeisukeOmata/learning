左のナビゲータエリアを表示する
Cmd + 0
---------------------------------------------
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
print(hoge) => nil

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
print(piyo) => Optional("hello world")

//強制的アンラップ
//nilだと落ちる
print(piyo!) => "hello world"
---------------------------------------------
//オプショナルバインディング
if let unwrappedPiyo = piyo {
    print(unwrappedPiyo)
}
else {
    print("piyoはnilです")
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
//初期化をしていないとき
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
クラス

class CarModel {
    //プロパティ
    var pre: Int
    var rear: Int
    
    //初期化時、引数をプロパティに設定
    init(pre: Int, rear: Int) {
        pre = pre
        rear = rear
    }
    
    //メソッド
    //呼ぶだけでprint
    func drive() {
        print("pre = \(pre)")
        print("rear = \(rear)")
    }
    
    //引数をprint
    func move(toBack: String) {
        print(toBack)
    }
    
    //-> Int　戻り値の型
    func add(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}

//CarModelクラスを配列で持つCarsListクラス
class CarsList {
    //プロパティ
    var list = [CarModel]()
    //初期化時、プロパティを設定
    init() {
        list.append(CarModel(pre: 1, rear: 1))
        list.append(CarModel(pre: 2, rear: 2))
        list.append(CarModel(pre: 3, rear: 3))
        list.append(CarModel(pre: 4, rear: 4))
        list.append(CarModel(pre: 5, rear: 5))
    }
}
--------------
class ViewController: UIViewController {

    //インスタンス作成時に初期値を渡す
    var car = Car(pre: 1, rear: 1)
    ////CarModelクラスを配列で持つCarsListクラスのインスタンス
    let carsList = CarsList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func action(_ sender: Any) {
        //インスタンスのプロパティを設定する    
        car.pre = 2
        car.rear = 2
        //driveメソッドを呼ぶ
        car.drive()
        //moveメソッドを呼ぶ
        car.move(toBack: "進む")
        //addメソッドを呼ぶ
        let total = car.add(num1: car.pre, num2: car.rear)
        print("合計は\(total)")
    }

    //CarsListクラスを配列で持つインスタンスのプロパティ"list"の1番目
    print(carsList.list[0].pre)

}

---------------------------------------------
継承

Animalモデル
class Animal {
    func bless() {
        print("息をする")
    }
}

// Animalモデルを継承したDogモデル
class Dog: Animal {

    //親クラスのメソッドを呼び出す
    override func bless() {
        //親クラスのメソッドを呼び出すときはsuper.が必要
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
実機テスト

1.iPhoneを繋ぎ、デバックのデバイスは実機を選択する
2.エラーが発生するので、Fix issue => add
3.Sign Up
4.Xcode => Preferences => Accounts 左下の「+」=> Add Apple ID
5.View Details => iOS Developmentの横にあるCreate => Done
6.runすると再度エラーになる
7.Personal Team => Choose
8.実機で設定 => 一般 => プロファイル
9.Apple ID名をタップ => 信頼