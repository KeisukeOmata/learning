import UIKit
import WebKit

//WKUIDelegate
//Webコンテンツの読み込みに使う
class WebViewController: UIViewController, WKUIDelegate {

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
        //ビューにウェブビューを設定する
        view.addSubview(webViewWKWebView)
        //TableViewControllerで設定したkey値"url"で呼び出す
        let urlString = UserDefaults.standard.object(forKey: "url")
        //URL型にキャスト
        //元の型はAny型なのでas! String
        let urlURL = URL(string: urlString as! String)
        //URLRequest型にキャスト
        let requestURLRequest = URLRequest(url: urlURL!)
        //WKWebViewにURLを読み込ませる
        webViewWKWebView.load(requestURLRequest)
    }

}
