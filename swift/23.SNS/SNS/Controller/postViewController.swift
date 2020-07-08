import UIKit
import Firebase

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
    
    //送信ボタンを押した時
    @IBAction func post(_ sender: Any) {
        //FIrebaseのDB名を決める
        let DB = Database.database().reference().child("post").childByAutoId()
        //ストレージサーバー
        let storage = Storage.storage().reference(forURL: "")
        //フォルダを作る
        let icon = DB.child("icon").childByAutoId().key
        let content = DB.child("content").childByAutoId().key
        
        let iconURL = storage.child("icon").child("\(String(describing: icon!)).jpg")
        let contentURL = storage.child("content").child("\(String(describing: content!)).jpg")
        
        var iconData: Data = Data()
        var contentData: Data = Data()
    }
    
}
