import UIKit
//キャッシュを扱う
import SDWebImage
import Firebase
//カメラの使用許可
import Photos

//Info.plist
//Privacy - Photo Library Usage Description
//Privacy - Camera Usage Description

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
        
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status) {
            case .authorized:
                print("許可されています")
            case .denied:
                print("許可されていません")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            }
        }
        
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
    
    //画面を呼び出す度に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //投稿を取得する
        fetch()
    }
    
    //セクションの中のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    //セルがタップされたとき
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        userName = contentsArray[indexPath.row].userNameString
        profileImage = contentsArray[indexPath.row].profileImageString
        contentImage = contentsArray[indexPath.row].contentImageString
        comment = contentsArray[indexPath.row].commentString
        createDate = contentsArray[indexPath.row].postDateString
        
        //show画面へ移動
        performSegue(withIdentifier: "show", sender: nil)
    }
    
    //didSelectRowAtで設定した値をshow画面へ渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let showVC = segue.destination as! showViewController
        showVC.userName = userName
        showVC.profileImage = profileImage
        showVC.contentImage = contentImage
        showVC.comment = comment
        showVC.date = createDate
    }
    
    //セルを構築する
    //indexPathは配列の数だけ0からインクリメントされる
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
    
    //画像選択 or 写真撮影後に呼ばれる
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        selectedImage = info[.originalImage] as! UIImage
        //先に受け渡し先のVCにストーリーボードIDをふる
        let postVC = self.storyboard?.instantiateViewController(identifier: "Post") as! postViewController
        //受け渡し先で変数selectedImageUIImageを宣言しておく
        postVC.selectedImageUIImage = selectedImage
        //画面遷移
        self.navigationController?.pushViewController(postVC, animated: true)
        //ピッカーを閉じる
        picker.dismiss(animated: true, completion: nil)
    }
    
    //投稿を取得する
    func fetch() {
        //最新の100件を取得する
        let ref = Database.database().reference().child("post").queryLimited(toLast: 100).queryOrdered(byChild: "postDate").observe(.value) { (snapShot) in
            //Arrayを初期化
            self.contentsArray.removeAll()
            //DataSnapshot型
            if let snapShot = snapShot.children.allObjects as? [DataSnapshot] {
                //それぞれの値を取得する
                for snap in snapShot {
                    if let postData = snap.value as? [String: Any] {
                        let userName = postData["userName"] as? String
                        let userProfileImage = postData["userProfileImage"] as? String
                        let contents = postData["contents"] as? String
                        let comment = postData["comment"] as? String
                        let postDate = postData["postDate"] as? CLong
                        let timeString = self.timeStamp(serverTimeStamp: postDate!)
                        
                        self.contentsArray.append(Contents(userNameString: userName!, profileImageString: userProfileImage!, contentImageString: contents!, commentString: comment!, postDateString: timeString))
                    }
                }
                
                //テーブルビューを再読み込み
                self.timeLine.reloadData()
                
                //画面の下まで移動する
                let indexPath = IndexPath(row: self.contentsArray.count - 1, section: 0)
                if self.contentsArray.count >= 5 {
                    self.timeLine.scrollToRow(at: indexPath, at: .bottom, animated: true)
                }
            }
        }
    }
    
    //Firebaseに登録されている時間を変換する
    //CLong型を渡し、String型を返す
    func timeStamp(serverTimeStamp: CLong) -> String {
        let time = serverTimeStamp / 1000
        let date = Date(timeIntervalSince1970: TimeInterval(time))
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        formatter.timeStyle = .medium
        return formatter.string(from: date)
    }
    
}
