import UIKit

class postViewController: UIViewController {

    var selectedImageUIImage = UIImage()
    var userNameString = String()
    var userImageString = String()
    var userImageData = Data()
    var userImageUIImage = UIImage()
    @IBOutlet weak var userImageImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //アプリ内に保存されているユーザー名を呼び出す
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userNameString = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
       //アプリ内に保存されているアイコンを呼び出す
        if UserDefaults.standard.object(forKey: "logo") != nil {
            userImageData = UserDefaults.standard.object(forKey: "logo") as! Data
            userImageUIImage = UIImage(data: userImageData)!
        }
        
        userImageImageView.image = userImageUIImage
        userNameLabel.text = userNameString
        contentImageView.image = selectedImageUIImage
    }
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    @IBAction func post(_ sender: Any) {
    }
    
}
