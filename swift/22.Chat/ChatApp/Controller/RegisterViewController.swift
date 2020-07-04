import UIKit
import Firebase
import Lottie

class RegisterViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    //Lottie
    let animationView = AnimationView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //新規登録
    @IBAction func registerNewUser(_ sender: Any) {
        //アニメーションの設定と開始
        startAnimation()
        
        //Firebaseの新規登録
        //クロージャー userかerrorに値が返ってくる
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error as Any)
            } else {
                print("新規登録が成功しました")
                //アニメーションの停止
                //クロージャーの中なのでself
                self.stopAnimation()
                //チャット画面へ遷移
                self.performSegue(withIdentifier: "chat", sender: nil)
            }
        }
    }

     //アニメーションの設定と開始
    func startAnimation() {
        //Lottie
        let animation = Animation.named("loading")
        
        //animationViewクラスのインスタンス
        animationView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height / 1.5)
        //loadingを渡す
        animationView.animation = animation
        //画面位置
        animationView.contentMode = .scaleAspectFit
        //アニメーションのループ
        animationView.loopMode = .loop
        //アニメーションの開始
        animationView.play()
        //画面にアニメーションを渡す
        view.addSubview(animationView)
    }
    
    //アニメーションの停止
    func stopAnimation() {
        //アニメーションを親のViewから削除
        animationView.removeFromSuperview()
    }
    
}