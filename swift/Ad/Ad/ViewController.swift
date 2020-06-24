//
//  ViewController.swift
//  Ad
//
//  Created by 小俣圭佑 on 2020/06/20.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

//GoogleAdMob
//アプリを追加
//広告ユニットを追加
//info.plistのソースコードにGADApplicationIdentifierキーとAdMobアプリIDの文字列を追加

import UIKit
import GoogleMobileAds

class ViewController: UIViewController {

    //クラスはGADBannerView
    @IBOutlet weak var BannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //バナー広告の読み込み
        //テストID
        BannerView.adUnitID = "ca-app-pub-3940256099942544~1458002511"
        BannerView.rootViewController = self
        BannerView.load(GADRequest())
    }

}

