import UIKit
//キャッシュを扱う
import SDWebImage

//テーブルビューで使うプロトコル
//UITableViewDelegatem
//UITableViewDataSource
//カメラで使うプロトコル
//UIImagePickerControllerDelegate
//UINavigationControllerDelegate
class nextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    
    @IBOutlet weak var timeLine: UITableView!
    @IBOutlet weak var cameraButton: UIButton!
    var selectedImage = UIImage()
    var userName = String()
    var userImageData = Data()
    var userImage = UIImage()
    var comment = String()
    var createDate = String()
    var contentImage = String()
    var profileImage = String()
    var contentsArray = [Contents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLine.delegate = self
        timeLine.dataSource = self
        
        //前ページで保存した値を呼び出す
        //"userName"
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
        //前ページで保存した値を呼び出す
        //"logo"
        if UserDefaults.standard.object(forKey: "logo") != nil {
            userImageData = UserDefaults.standard.object(forKey: "logo") as! Data
            //Data型をUIImage型に変換
            userImage = UIImage(data: userImageData)!
        }
    }
    
    //セクションの中のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    //セルを構築する
    //indexPathは配列の数だけインクリメントされる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeLine.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //先にコンテンツそれぞれにtagをつけておく
        //プロフィールアイコン
        let profileImageView = cell.viewWithTag(1) as! UIImageView
        //配列のrow番目のprofileImageStringをURL型にキャストし、sd_setImageに渡す
        profileImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].profileImageString), completed: nil)
        profileImageView.layer.cornerRadius = 30.0
        
        //ユーザーネーム
        let userNameLabel = cell.viewWithTag(2) as! UILabel
        userNameLabel.text = contentsArray[indexPath.row].userNameString
        
        //投稿日時
        let dateLabel = cell.viewWithTag(3) as! UILabel
        dateLabel.text = contentsArray[indexPath.row].postDateString
        
        //投稿画像
        let contentImageView = cell.viewWithTag(4) as! UIImageView
        contentImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].contentImageString), completed: nil)
        
        //コメント
        let comementLabel = cell.viewWithTag(5) as! UILabel
        comementLabel.text = contentsArray[indexPath.row].commentString
        
        return cell
    }
    
    //セルの高さを決める
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //ハードコーディングは修正予定
        return 521
    }
    //セクションの数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //カメラボタンを押したとき
    @IBAction func photeAction(_ sender: Any) {
       alert()
    }
    
    //アラートでカメラとアルバムどちらを利用するかを表示する
   func alert() {
       let alert = UIAlertController(title: "選択", message: "どちらを利用しますか", preferredStyle: .actionSheet)
       let actionCamera = UIAlertAction(title: "カメラ", style: .default) { (alert) in
           self.camera()
       }
       let actionAlbum = UIAlertAction(title: "アルバム", style: .default) { (alert) in
           self.album()
       }
       let actionCancel = UIAlertAction(title: "キャンセル", style: .cancel)
   
       alert.addAction(actionCamera)
       alert.addAction(actionAlbum)
       alert.addAction(actionCancel)
       //アラートを表示する
       self.present(alert, animated: true, completion: nil)
   }

   //カメラを立ち上げる
   func camera() {
       let sourceType:  UIImagePickerController.SourceType = .camera
       //カメラが利用可能であればカメラを立ち上げる
       if UIImagePickerController.isSourceTypeAvailable(.camera) {
           let cameraPicker = UIImagePickerController()
           cameraPicker.allowsEditing = true
           cameraPicker.sourceType = sourceType
           cameraPicker.delegate = self
           self.present(cameraPicker, animated: true, completion: nil)
       }
   }
   
   //アルバムを立ち上げる
   func album() {
       let sourceType:  UIImagePickerController.SourceType = .photoLibrary
       //アルバムが利用可能であればアルバムを立ち上げる
       if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
           let cameraPicker = UIImagePickerController()
           cameraPicker.allowsEditing = true
           cameraPicker.sourceType = sourceType
           cameraPicker.delegate = self
           self.present(cameraPicker, animated: true, completion: nil)
       }
   }
    
    //ピッカーでキャンセルボタンが押されたとき
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
}
