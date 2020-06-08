//
//  ViewController.swift
//  bokete
//
//  Created by 小俣圭佑 on 2020/06/08.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import SDWebImage
import Photos

class ViewController: UIViewController {

    @IBOutlet weak var odaiImageView: UIImageView!
    @IBOutlet weak var commentTextView: UITextView!
    @IBOutlet weak var searchTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        commentTextView.layer.cornerRadius = 20.0
        
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
        
        func getImages(keyword: String) {
            //16952655-0ebaa6fef1329e2a497eeda7e
            let url = "https://pixabay.com/api/?key=16952655-0ebaa6fef1329e2a497eeda7e&q=\(keyword)"
        }
        
    }

}

