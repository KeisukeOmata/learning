import UIKit

class NextViewController: UIViewController {
    
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
    
}
