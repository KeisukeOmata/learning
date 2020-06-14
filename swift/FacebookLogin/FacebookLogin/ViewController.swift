//
//  ViewController.swift
//  FacebookLogin
//
//  Created by 小俣圭佑 on 2020/06/13.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

//https://console.firebase.google.com/
//プロジェクトを追加し、iOSを選択
//プロジェクトのアプリ名(FacebookLogin)のBundle Identifierを入力
//GoogleService-Info.plistをプロジェクトに追加
//AuthenticationからFacebookを有効にする
//https://developers.facebook.com/
//アプリを作成し、アプリIDとアプリシークレットをFirebaseに貼り付け
//Facebook側で設定
//OAuth リダイレクト URI を Facebook アプリの設定に追加

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FacebookCore
import FacebookLogin
import Firebase

class ViewController: UIViewController, LoginButtonDelegate {

    let fbLoginButton: FBLoginButton = FBLoginButton()
    var displayName = String()
    var pictureURL = String()
    var pictureURLString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Facebookログインボタンを表示
        fbLoginButton.delegate = self
        fbLoginButton.frame = CGRect(x: view.frame.size.width / 2 - view.frame.size.width / 4, y: view.frame.size.height / 4, width: view.frame.size.width / 2, height: 30)
        fbLoginButton.permissions = ["public_profile.email"]
        view.addSubView(fbLoginButton)

    }
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }


}

