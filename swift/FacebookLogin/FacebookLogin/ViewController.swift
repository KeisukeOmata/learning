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
        
        fbLoginButton.delegate = self

    }


}

