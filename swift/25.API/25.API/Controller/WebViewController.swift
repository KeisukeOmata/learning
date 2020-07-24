import UIKit
import WebKit

class WebViewController: UIViewController {

    //WKWebViewクラスのインスタンス
    var webViewWKWebView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ウェブビューのサイズを決める
        webViewWKWebView.frame = CGRect(
                                    x: 0,
                                    y: 0,
                                    //view = 画面と同じ
                                    width: view.frame.size.width,
                                    height: view.frame.size.height - 50
                                )
        //WKWebViewをビューに設定する
        view.addSubview(webViewWKWebView)
        //TabViewControllerで設定したkey値"url"を呼び出す
        if UserDefaults.standard.object(forKey: "url") != nil {
            let urlString = UserDefaults.standard.object(forKey: "url")
            //URL型にキャスト
            let urlURL = URL(string: urlString as! String)
            //URLRequest型にキャスト
            let requestURLRequest = URLRequest(url: urlURL!)
            
            //ウェブビューにURLリクエストを設定する
            webViewWKWebView.load(requestURLRequest)
        }
    }

}
