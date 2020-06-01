//
//  ViewController.swift
//  camera
//
//  Created by 小俣圭佑 on 2020/06/01.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
//ユーザー側でカメラを許可しているか
import Photos

//カメラに使うプロトコル
//UIImagePickerControllerDelegate, UINavigationControllerDelegate
class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var backImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //ユーザー側でカメラを許可しているか
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status) {
            case .authorized:
                print("許可されています")
            case .denied:
                print("拒否されています")
            case .notDetermined:
                print("notDetermined")
            case .restricted:
                print("restricted")
            }
        }
    }

    //カメラを立ち上げる
    @IBAction func openCamera(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.camera
        
        //カメラが利用可能の場合
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
        }
    }
    
}

