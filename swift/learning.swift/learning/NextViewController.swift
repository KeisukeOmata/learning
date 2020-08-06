import UIKit

class NextViewController: UIViewController {
    
    //前のViewから渡された値を格納する
    var fuga = Int()
    //配列を宣言する
    var photoArrayUIImage = [UIImage]()
    @IBOutlet weak var labelUILabel: UILabel!
    //@IBAction func pushButton
    @IBOutlet weak var buttonUIButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //fugaは前のViewから渡された値
        labelUILabel.text = String(fuga)
    }

    //ボタンが押された時
    @IBAction func pushButton(_ sender: Any) {
        //falseでボタンが押せなくなる
        buttonUIButton.isEnabled = false
    }
    
}
