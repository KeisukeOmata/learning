//
//  ViewController.swift
//  bokete
//
//  Created by 小俣圭佑 on 2020/06/08.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

//カメラを使う時
//Info.plist
//Privacy - Photo Library Usage Description
//Privacy - Camera Usage Description

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var odaiImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var searchTextField: UITextField!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.layer.cornerRadius = 20.0
        
        //ユーザー側でカメラを許可しているか
        PHPhotoLibrary.requestAuthorization { (status) in
            switch(status) {
                case .authorized: 
                    break
                case .denied: 
                    break
                case .notDetermined:
                    break
                case .restricted:
                    break
            }
        }
        
        getImages(keyword: "funny")
    }
        
    func getImages(keyword: String) {
        //16952655-0ebaa6fef1329e2a497eeda7e
        let url = "https://pixabay.com/api/?key=16952655-0ebaa6fef1329e2a497eeda7e&q=\(keyword)"
        //AlamoFireを使ってhttpリクエストを行う
        //responseの中身はjson
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (response) in
            switch response.result {
            case .success:
                let json: JSON = JSON(response.data as Any)
                //クロージャーの中なのでself
                var imageString = json["hits"][self.count]["webformatURL"].string

                //jsonの終端
                if imageString == nil {
                    //1番目に戻る
                    imageString = json["hits"][0]["webformatURL"].string
                    //jsonで取得した画像を表示する
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                } else {
                    //jsonで取得した画像を表示する
                    self.odaiImageView.sd_setImage(with: URL(string: imageString!), completed: nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }

    @IBAction func next(_ sender: Any) {
        count += 1
        if searchTextField.text == "" {
            getImages(keyword: "funny")
        } else {
            getImages(keyword: searchTextField.text!)
        }
    }
    
    @IBAction func searchAction(_ sender: Any) {
        count = 0
        if searchTextField.text == "" {
            getImages(keyword: "funny")
        } else {
            getImages(keyword: searchTextField.text!)
        }
    }
    
    //次のVCへ
    @IBAction func done(_ sender: Any) {
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    //値を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let shareVC = segue.destination as? ShareViewController
        
        shareVC?.commentString = commentTextView.text
        shareVC?.resultImage = odaiImageView.image!
    }
    
}

