import UIKit

class NextViewController: UIViewController {
    
    var fuga = Int()
    //配列を宣言する
    var photoArrayUIImage = [UIImage]()
    @IBOutlet weak var buttonUIButton: UIButton!
    @IBOutlet weak var labelUILabel: UILabel!
    
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
