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
        webView.frame = CGRect(
            x: 0,
            y: toolBar.frame.size.height,
            width: view.frame.size.width,
            height: view.frame.size.height - toolBar.frame.size.height * 2
        )
        
        view.addSubview(webView)
        webView.navigationDelegate = self
        let url = URL(String: "https://www.yahoo.co.jp/")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    @IBAction func go(_ sender: Any) {
    }
    
    @IBAction func back(_ sender: Any) {
    }
}

