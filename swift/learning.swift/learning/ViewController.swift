//画面右下のAdd New Constraintsよりオートレイアウトを設定できる => 機種毎のずれをなくせる
//Info.plist => Required device capabilities => Privacy - Camera Usage Description

import UIKit

//カメラで使うデリゲート
//UINavigationControllerDelegate
//UIImagePickerControllerDelegate
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {

    @IBOutlet weak var imageUIImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

/////////////////////////////////////////////////////////////////////
//カメラ
/////////////////////////////////////////////////////////////////////
    @IBAction func Camera(_ sender: Any) {
        //カメラが利用できるかを確認
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            print("カメラは利用できます")
            //IImagePickerControllerのインスタンスを作成
            let uIImagePickerController = UIImagePickerController()
            //ソースはカメラから取得する(他にアルバムなど)
            uIImagePickerController.sourceType = .camera
            uIImagePickerController.delegate = self
            //画面遷移
            //completion => 完了後に更に動作するか
            present(uIImagePickerController, animated: true, completion: nil)
        } else {
            print("カメラは利用できません")
        }
    }
    
    @IBAction func actionSheet(_ sender: Any) {
        if let image = imageUIImageView.image {
            //image配列を格納
            let images = [image]
            let uIActivityViewController = UIActivityViewController(activityItems: images, applicationActivities: nil)
            //iPad対策
            uIActivityViewController.popoverPresentationController?.sourceView = view
            //画面を遷移
            present(uIActivityViewController, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        imageUIImageView.image = info[.originalImage] as? UIImage
        //ピッカーを閉じる
        dismiss(animated: true, completion: nil)
    }

/////////////////////////////////////////////////////////////////////
//画面遷移
/////////////////////////////////////////////////////////////////////
    //1.設置したbuttonなどからctrを押しながら次のビューへドラッグ&ドロップ => コード書かなくてもok
    //2.画面上部のViewControllerアイコンからctrを押しながら次のビューへドラッグ&ドロップして以下記載
    @IBAction func next(_ sender: Any) {
        //SegueのIdentifierに"next"を設定しておく
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    //次のページに値を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        let hoge: Int = 1
        nextVC.fuga = hoge
    }
    
}
