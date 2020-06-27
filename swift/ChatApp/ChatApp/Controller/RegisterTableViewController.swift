import UIKit
import Firebase
import Lottie

class RegisterTableViewController: UITableViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //Lottie
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func registerNewUser(_ sender: Any) {
        //Firebase認証
        //クロージャー userかerrorに値が返ってくる
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error as Any)
            } else {
                print("新規登録が成功しました")
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

}
