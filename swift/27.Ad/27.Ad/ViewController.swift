//広告を表示するUIImageのクラスをGADBannerViewに設定する
//Apple Developer ProgramからCertificates, Identiriers & Profiles
//Certificatesを追加
//iOS App Developmentを選択
//Macのキーチェーンアクセスを開き、証明書アシスタント=>認証局に証明書を要求
//ディスクに保存、鍵ペア情報を指定にチェック
//Choose Fileでキーチェーンアクセスで作成したCertificateSigningRequestを選択
//Identiriers=>+ボタンからAppIDを作成
//iTunes Connectにアプリを登録
//機能からApp内課金を設定
//製品IDおよび共有シークレットを課金画面に記載
//契約/税金/口座情報を登録
//Sandbox => テスターからテストアカウントを作成

import UIKit
import GoogleMobileAds

//GADBannerViewDelegate => 広告
class ViewController: UIViewController, GADBannerViewDelegate, CatchProtocol {
    
    @IBOutlet weak var AdGADBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //viewが表示される直前に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //購入済みフラグを確認する
        if let boughtFlg = UserDefaults.standard.object(forKey: "boughtFlg") {
            let count = UserDefaults.standard.object(forKey: "boughtFlg") as! Int
            if count == 1 {
                //広告を非表示にする
                AdGADBannerView.removeFromSuperview()
            } else {  
            }
        } else {
            //広告を設定する
            //GoogleAdMobで発行した2の方
            //1はGoogle Mobile Ads SDK ガイドを見てInfo.plistに設定
            AdGADBannerView.adUnitID = "ca-app-pub-5446818749366163/3146538012"
            AdGADBannerView.rootViewController = self
            AdGADBannerView.load(GADRequest())
        }
    }
    
    @IBAction func next(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    //課金がされているかの判定
    func catchData(count: Int) {
        if count == 1 {
            //広告を非表示にする
            AdGADBannerView.removeFromSuperview()
        }
    }
    
    //adViewControllerのプロトコルを利用する
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let adViewController = segue.destination as! AdViewController
        adViewController.delegate = self
    }

    
}

