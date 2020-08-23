//Toolbar
//Bar Button Item
//Fix Space Bar Button Item
//Activity Indicator View
import UIKit
//Webビューを扱う
import WebKit

//WKNavigationDelegate => インジケーターに関するデリゲートメソッド
class NaviViewController: UIViewController, WKNavigationDelegate {
    
    //Webビュー
    var webViewWKWebView = WKWebView()
    //画面下部のツールバー
    @IBOutlet weak var toolBarUIToolbar: UIToolbar!
    //インジケーター
    @IBOutlet weak var indicatorUIActivityIndicatorView: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //WKNavigationDelegate
        webViewWKWebView.navigationDelegate = self
        
        //Webビューの配置を決める
        webViewWKWebView.frame = CGRect(
            x: 0,
            y: toolBarUIToolbar.frame.size.height,
            width: view.frame.size.width,
            height: view.frame.size.height - toolBarUIToolbar.frame.size.height * 2
        )
        //Webビューを表示する
        view.addSubview(webViewWKWebView)
        
        //ウェブビューで表示するサイト
        let urlURL = URL(string: "https://www.google.co.jp")
        let urlURLRequest = URLRequest(url: urlURL!)
        webViewWKWebView.load(urlURLRequest)
        
        //インジケーターの設定
        //インジケーターを中央に表示する
        indicatorUIActivityIndicatorView.center = view.center
        //インジケーターの色
        indicatorUIActivityIndicatorView.color = .purple
        //ビューに設定する
        view.addSubview(indicatorUIActivityIndicatorView)
    }
    
    //WKNavigationDelegate
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        //インジケーターのアニメーションを開始
        indicatorUIActivityIndicatorView.startAnimating()
    }
    
    //WKNavigationDelegate
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("読み込み完了")
        //インジケーターのアニメーションを終了
        indicatorUIActivityIndicatorView.stopAnimating()
        //インジケーターを非表示
        indicatorUIActivityIndicatorView.hidesWhenStopped = true
    }
    
    //前のページへ
    @IBAction func back(_ sender: Any) {
        webViewWKWebView.goBack()
    }
    
    //次のページへ
    @IBAction func next(_ sender: Any) {
        webViewWKWebView.goForward()
    }
    
}
