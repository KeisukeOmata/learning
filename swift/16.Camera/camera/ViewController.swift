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
            
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            present(cameraPicker, animated: true, completion: nil)
        } else {
            print("エラー")
        }
    }
    
    //キャンセルが押下されたとき
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    //アルバムを立ち上げる
    @IBAction func openAlbum(_ sender: Any) {
        let sourceType = UIImagePickerController.SourceType.photoLibrary
               
        //カメラが利用可能の場合
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let cameraPicker = UIImagePickerController()
                
            cameraPicker.sourceType = sourceType
            cameraPicker.delegate = self
            cameraPicker.allowsEditing = true
            present(cameraPicker, animated: true, completion: nil)
        } else {
            print("エラー")
        }
    }
    
    //画像を受け取る
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[.editedImage] as? UIImage {
            //imageViewに画像を設定
            backImageView.image = pickedImage
            //画像をアルバムに保存
            UIImageWriteToSavedPhotosAlbum(pickedImage, self, nil, nil)
            //閉じる
            picker.dismiss(animated: true, completion: nil)
        }
    }
    
    //Info.plistにプライバシー設定を追加
    
    //アクションシートの呼び出し
    @IBAction func share(_ sender: Any) {
        let text = ""
        //画像サイズの圧縮
        let image = backImageView.image?.jpegData(compressionQuality: 0.2)
        //as [Any] => 型
        let items = [text, image] as [Any]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
    }
    
}

