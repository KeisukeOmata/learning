//画面右下のAdd New Constraintsよりオートレイアウトを設定できる => 機種毎のずれをなくせる
//Info.plist => Required device capabilities => Privacy - Camera Usage Description
//ナビゲーションコントローラーに表示する文字はナビゲーションバーを押下、Back Buttonに入力で変更できる

import UIKit

//カメラで使うデリゲート
//UINavigationControllerDelegate
//UIImagePickerControllerDelegate
//NextViewControllerで作成したプロトコル
//CatchProtocol
class ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CatchProtocol {

    var count: Int = 0
    @IBOutlet weak var imageUIImageView: UIImageView!
    //プロトコルで値が受け渡されるラベル
    @IBOutlet weak var protocolUILabel: UILabel!
    
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
    //2.Segueで遷移(画面上部のViewControllerアイコンからctrを押しながら次のビューへドラッグ&ドロップして以下記載)
    @IBAction func next(_ sender: Any) {
        //SegueのIdentifierに"next"を設定しておく
        performSegue(withIdentifier: "next", sender: nil)
    }

    //次のページに値を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segueのidentifierによって受け渡す値を変える
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            //プロトコルを設定
            nextVC.delegate = self
            //数値型のhogeを宣言
            let hoge: Int = 1
            //次のViewでfugaを宣言しておき、値を受け渡す
            nextVC.fuga = hoge
        }
    }
    
    //3.ナビゲーションコントローラーで遷移する
    //Showで画面遷移するとナビゲーションコントローラーが使える
    //Editor -> Embed In -> Navigation Controller
    //StoryboardIDを設定した任意の画面に遷移(画面上部のViewControllerアイコンからctrを押しながら次のビューへドラッグ&ドロップして以下記載)
    @IBAction func navi(_ sender: Any) {
        let naviVC = storyboard?.instantiateViewController(
            //StoryboardID
            withIdentifier: "navi"
        ) as! NaviViewController
        //値を受け渡す場合
        //naviVC.hoge = fuga
        //画面遷移する
        navigationController?.pushViewController(naviVC, animated: true)
    }

    @IBAction func table(_ sender: Any) {
        let tableVC = storyboard?.instantiateViewController(
            //StoryboardID
            withIdentifier: "table"
        ) as! TableViewController
        navigationController?.pushViewController(tableVC, animated: true)
    }
    
    //4.タグで管理する
    //あらかじめボタンにtagを設定しておく
    //複数のボタンをこのアクションを紐づける
    // @IBAction func next(_ sender: Any) {
    //     if (sender as AnyObject).tag == 1 {
    //     } else if (sender as AnyObject).tag == 2 {
    //     } else if (sender as AnyObject).tag == 3 {
    //     } else {
    //     }
    // }

/////////////////////////////////////////////////////////////////////
//プロトコル
/////////////////////////////////////////////////////////////////////
    //プロトコル内で呼ばれる
    //引数をラベルに表示
    //prepare内で変数化したNextViewControllerに.delegate = selfを記載
    func catchData(count: Int) {
        print(count)
        protocolUILabel.text = String(count)
    }
    
}

/////////////////////////////////////////////////////////////////////
//アプリの中にデータを保存する
/////////////////////////////////////////////////////////////////////
// hoge: Int = 0
// UserDefaults.standard.set(hoge, forKey: "fuga")

// if UserDefaults.standard.object(forKey: "fuga") != nil {
//     piyo = UserDefaults.standard.object(forKey: "fuga") as! Int
// }

//アプリ内のデータを削除
// UserDefaults.standard.removeObject(forKey: "fuga"")

