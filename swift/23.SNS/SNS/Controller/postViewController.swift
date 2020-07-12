import UIKit
import Firebase

class postViewController: UIViewController, UITextViewDelegate {

    var selectedImageUIImage = UIImage()
    var userNameString = String()
    var userImageString = String()
    var userImageData = Data()
    var userImageUIImage = UIImage()
    @IBOutlet weak var userImageImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var sendButton: UIButton!
    let screenSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.delegate = self
        
        //キーボードを上げる
        NotificationCenter.default.addObserver(self, selector: #selector(postViewController.keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(postViewController.keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //アプリ内に保存されているユーザー名を呼び出す
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userNameString = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
       //アプリ内に保存されているアイコンを呼び出す
        if UserDefaults.standard.object(forKey: "logo") != nil {
            userImageData = UserDefaults.standard.object(forKey: "logo") as! Data
            userImageUIImage = UIImage(data: userImageData)!
        }
        
        //ユーザーネームなどを表示する
        userImageImageView.image = userImageUIImage
        userNameLabel.text = userNameString
        contentImageView.image = selectedImageUIImage
    }
    
    //キーボードを表示する
    @objc func keyboardWillShow(_ notification:NSNotification){
        let keyboardHeight = ((notification.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
              
        commentTextView.frame.origin.y = screenSize.height - keyboardHeight - commentTextView.frame.height
        sendButton.frame.origin.y = screenSize.height - keyboardHeight - sendButton.frame.height
    }

    //キーボードを非表示にする
    @objc func keyboardWillHide(_ notification:NSNotification){
        commentTextView.frame.origin.y = screenSize.height - commentTextView.frame.height
        sendButton.frame.origin.y = screenSize.height - sendButton.frame.height
          
        guard let rect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
        let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval else{return}
          
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: 0)
            self.view.transform = transform
        }
    }
    
    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        commentTextView.resignFirstResponder()
    }
          
    //テキストフィールドを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
        //URLはFirebaseのアプリ内「Storage」
        let storage = Storage.storage().reference(forURL: "gs://sns-swift.appspot.com")
        //フォルダを作る
        let icon = DB.child("icon").childByAutoId().key
        let content = DB.child("content").childByAutoId().key
        
        let iconURL = storage.child("icon").child("\(String(describing: icon!)).jpg")
        let contentURL = storage.child("content").child("\(String(describing: content!)).jpg")
        
        var iconData: Data = Data()
        var contentData: Data = Data()
        
        if userImageImageView.image != nil {
            iconData = userImageImageView.image?.jpegData(compressionQuality: 0.01) as! Data
        }
        
        if contentImageView.image != nil {
            contentData = contentImageView.image?.jpegData(compressionQuality: 0.01) as! Data
        }
        
        //投稿をデータベースに登録する
        let upload = contentURL.putData(contentData, metadata: nil) { (metaData, error) in
            if error != nil {
                print(error as Any)
                return
            }
            
            let upload2 = iconURL.putData(iconData, metadata: nil) { (metaData, error) in
                if error != nil {
                    print(error as Any)
                    return
                }
            }
            
            contentURL.downloadURL { (url, error) in
                if url != nil {
                    iconURL.downloadURL { (url2, error) in
                        let timeLine = ["userName": self.userNameString as Any,
                                        //absoluteStringでURL型からString型へキャスト
                                        "userProfileImage": url2?.absoluteString as Any,
                                        "contents": url?.absoluteString as Any,
                                        "comment": self.commentTextView.text as Any,
                                        "postDate": ServerValue.timestamp()]
                                        as [String: Any]
                        //データベースにアップデートをかける
                        DB.updateChildValues(timeLine)
                        
                        //アップデート後、元の画面へ戻る
                        //モーダルの場合はdismiss
                        self.navigationController?.popViewController(animated: true)
                    }
                }
            }
        }
        
        //閉じる
        upload.resume()
        self.dismiss(animated: true, completion: nil)
    }
    
}
