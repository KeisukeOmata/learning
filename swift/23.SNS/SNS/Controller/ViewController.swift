import UIKit
import Firebase

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //ログイン
    @IBAction func login(_ sender: Any) {
        Auth.auth().signInAnonymously { (result, error) in
            let user = result?.user
            //遷移先のストーリーボードIDを先に入力しておく
            let inputVC = self.storyboard?.instantiateViewController(identifier: "inputVC") as! inputViewController
            
            //画面遷移
            self.navigationController?.pushViewController(inputVC, animated: true)
        }
    }
    
}

