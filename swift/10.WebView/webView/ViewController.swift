//
//  ViewController.swift
//  webView
//
//  Created by 小俣圭佑 on 2020/05/06.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var indicator: UIActivityIndicatorView!
    @IBOutlet weak var toolBar: UIToolbar!
    var webView = WKWebView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //ウェブビューの表示
        webView.frame = CGRect(
            x: 0,
            y: toolBar.frame.size.height,
            width: view.frame.size.width,
            height: view.frame.size.height - toolBar.frame.size.height * 2
        )
        view.addSubview(webView)

        webView.navigationDelegate = self

        //ウェブビューで表示するサイト
        let url = URL(string: "https://www.google.co.jp")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    //Delegateメソッドは任意のタイミングで呼ばれる
    //読み込まれた時
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        print("読み込み開始")
        indicator.startAnimating()
    }
    
    //Delegateメソッドは任意のタイミングで呼ばれる
    //読み込みが完了したとき
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("ロード完了")
        indicator.stopAnimating()
    }
    
    //進むボタン
    @IBAction func go(_ sender: Any) {
        webView.goForward()
    }
    
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        webView.goBack()
    }
}

