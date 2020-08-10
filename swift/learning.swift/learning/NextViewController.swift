import UIKit

//プロトコルを定義
protocol CatchProtocol {
    func catchData(count: Int)
}

//UITextFieldDelegate => テキストフィールドのプロトコル
class NextViewController: UIViewController, UITextFieldDelegate {
    
    //前のViewから渡された値を格納する
    var fuga = Int()
    //タイマークラスのインスタンス
    var timerTimer = Timer()
    //配列を宣言する
    var photoArrayUIImage = [UIImage]()
    //タイマーの中で使うカウント
    var countInt: Int = 0
    //画像の枚数
    var photoCountInt: Int = 4
    //前の画面から値を受け取るラベル
    @IBOutlet weak var labelUILabel: UILabel!
    //@IBAction func pushButton
    @IBOutlet weak var buttonUIButton: UIButton!
    //タイマーで表示する画像
    @IBOutlet weak var imageUIImage: UIImageView!
    //テキストフィールド
    //Secure Text Entryにチェックを入れると伏字になる
    //開発機ではToggle Hardware Keyboardを選択するとキーボードが表示される
    @IBOutlet weak var textUITextField: UITextField!
    //プロトコルを変数化
    var protocolCatchProtocol: CatchProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //テキストフィールドのプロトコル
        textUITextField.delegate = self
        
        //fugaは前のViewから渡された値
        labelUILabel.text = String(fuga)
        
        //タイマーで表示する画像を配列に格納
        for i in 0..<photoCountInt {
            //UIImageの実体を作成
            let photoUIImage = UIImage(named: "\(i)")
            //配列に格納
            photoArrayUIImage.append(photoUIImage!)
        }
        //初期画像を表示
        imageUIImage.image = UIImage(named: "0")
    }
    
/////////////////////////////////////////////////////////////////////
//前画面に戻る
/////////////////////////////////////////////////////////////////////
    @IBAction func back(_ sender: Any) {
        let count: Int = 2
        //プロトコルを呼ぶ
        protocolCatchProtocol?.catchData(count: count)
        dismiss(animated: true, completion: nil)
    }
    
/////////////////////////////////////////////////////////////////////
//タイマー
/////////////////////////////////////////////////////////////////////
    //ボタンが押された時
    @IBAction func pushButton(_ sender: Any) {
        //falseでボタンが押せなくなる
        buttonUIButton.isEnabled = false
        //タイマーを呼び出す
        start()
        //タイマーを止める
        //timerTimer.invalidate()
    }
    
    //タイマーを呼び出す
    func start() {
        timerTimer = Timer.scheduledTimer(
            timeInterval: 0.3,
            target: self,
            //updateを呼び出す
            selector: #selector(update),
            userInfo: nil,
            repeats: true
        )
    }

    //start内で呼ばれる
    @objc func update(){
        countInt = countInt + 1
        if countInt >= photoCountInt {
            countInt = 0
        }
        //配列に格納された画像を表示
        imageUIImage.image = photoArrayUIImage[countInt]
    }
    
/////////////////////////////////////////////////////////////////////
//テキストフィールド
/////////////////////////////////////////////////////////////////////
    //キーボード以外をタッチすると閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    //テキストフィールドのプロトコル
    //returnでテキストフィールドを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}
