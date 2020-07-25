import UIKit
import SwiftyStoreKit

protocol CatchProtocol {
    func catchData(count: Int)
}

class AdViewController: UIViewController {
    
    var count: Int = 0
    var delegate: CatchProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    //課金ボタンを押したとき
    @IBAction func buy(_ sender: Any) {
        //iTunes Connectで設定した製品ID
        purchase(PRODUCT_ID: "")
    }
    
    //課金内容(広告を消す)
    func purchase(PRODUCT_ID: String) {
        SwiftyStoreKit.purchaseProduct(PRODUCT_ID) { (result) in
            switch result {
            case .success(_ ):
                //boughtFlgがnullではない => 既に購入済みの場合
                if let boughtFlg = UserDefaults.standard.object(forKey: "boughtFlg") {
                    let count = UserDefaults.standard.object(forKey: "boughtFlg") as! Int
                //boughtFlgがnull => 未購入の場合
                } else {
                    //1(購入済み)を設定
                    UserDefaults.standard.set(1, forKey: "boughtFlg")            
                    self.count = 1
                }
                //共有シークレットの設定
                self.verifyPurchase(PRODUCT_ID: PRODUCT_ID)
                //プロトコルを呼び出す
                self.delegate?.catchData(count: self.count)
                //画面を閉じる
                self.dismiss(animated: true, completion: nil)
                break
            case .error(let error):
                print(error)
                break
            }
        }
    }

    //共有シークレットの設定
    func verifyPurchase(PRODUCT_ID: String){
        //iTunes Connectの機能から生成した共有シークレットをsharedSecretに設定する
        let appeValidator = AppleReceiptValidator(service: .production, sharedSecret: "")
        SwiftyStoreKit.verifyReceipt(using: appeValidator) { (result) in
            switch result {
            case .success(let receipt):
                let purchaseResult = SwiftyStoreKit.verifyPurchase(productId: PRODUCT_ID, inReceipt: receipt)
                switch purchaseResult {
                //購入済みの場合
                case .purchased:
                    UserDefaults.standard.set(1, forKey: "boughtFlg")
                    self.count = 1
                    break
                //未購入の場合
                case .notPurchased:
                    UserDefaults.standard.set(nil, forKey: "boughtFlg")
                    break
                }
            case .error(let error):
                break
            }
        }
    }
    
    //購入済みの場合の復元
    @IBAction func restore(_ sender: Any) {
        SwiftyStoreKit.restorePurchases { (results) in
            //リストア失敗
            if results.restoreFailedPurchases.count > 0 {
            //リストア
            } else if results.restoredPurchases.count > 0 {
                //購入済みフラグを設定する
                UserDefaults.standard.set(1, forKey: "boughtFlg")
                self.count =  1
                //画面を閉じる
                self.dismiss(animated: true, completion: nil)
            //上記以外の場合
            } else {
            }
        }
    }
    
}
