import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        resultLabel.text = ""
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        // String型の定数answerに"b"を代入してください
        let answer: String = "b"
        
        // String型の定数inputTextにtextFieldの値を代入してください
        let inputText: String = textField.text!
        
        // 「inputTextとanswerが等しいかどうか」を条件とするif文を作成してください
        if inputText == answer {
            label.text = "正解です"
        } else {
            label.text = "不正解です"
        }
        
    }
}