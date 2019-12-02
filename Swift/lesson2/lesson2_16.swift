import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func buttonTapped(sender: AnyObject) {
        let dictionary: [String: String] = [
            "dog": "犬",
            "cat": "猫",
            "bird": "鳥",
            "fish": "魚",
            "people": "人々"
        ]
        
        let inputText = textField.text!
        
        if let word = dictionary[inputText] {
          label.text = word
        } else {
          label.text = "登録されていません"
        }
        

    }
}