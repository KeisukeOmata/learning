import UIKit

//カメラで使うプロトコル
//UIImagePickerControllerDelegate
//UINavigationControllerDelegate
class inputViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var logo: UIImageView!
    @IBOutlet weak var userName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        logo.layer.cornerRadius = 30.0
    }
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //決定ボタン
    @IBAction func done(_ sender: Any) {
        //ユーザー名をアプリ内に保存
        UserDefaults.standard.set(userName.text, forKey: "userName")
        //アイコンをアプリ内に保存
        //jpegを圧縮
        let imageData = logo.image?.jpegData(compressionQuality: 0.1)
        UserDefaults.standard.set(imageData, forKey: "logo")
        
        //画面遷移
        //先に遷移先のストーリーボードIDを入力しておく
        let nextVC = self.storyboard?.instantiateViewController(identifier: "nextVC") as! nextViewController
        self.navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //画面をタップしたとき
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        //キーボードを閉じる
        userName.resignFirstResponder()
    }
    
    //画像をタップしたとき
    //Tap Gesture RecognizerをImageViewに重ねる
    @IBAction func logoTap(_ sender: Any) {
        //画像をタップしたとき振動する
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        //アラートを表示し、カメラとアルバムどちらを利用するか尋ねる
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
    
    //カメラ、アルバムで選択された画像を扱う
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if info[.originalImage] as? UIImage != nil {
            let selectedImage = info[.originalImage] as! UIImage
            UserDefaults.standard.set(selectedImage.jpegData(compressionQuality: 0.1), forKey: "selectedImage")
            logo.image = selectedImage
            //pickerを閉じる
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    //キャンセルが押された時
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            //pickerを閉じる
            picker.dismiss(animated: true, completion: nil)
    }
    
}
