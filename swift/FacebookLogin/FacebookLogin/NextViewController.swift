//
//  NextViewController.swift
//  FacebookLogin
//
//  Created by 小俣圭佑 on 2020/06/16.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
import SDWebImage

class NextViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if UserDefaults.standard.object(forKey: "pictureURLString") != nil || (UserDefaults.standard.object(forKey: "displayName") != nil {
            let imageString = UserDefaults.standard.object(forKey: "pictureURLString" as! String)

            profileImageView.sd_setImage(with: URL(String: imageString), completed: nil)
            profileImageView.layer.cornerRadius = 20.0

        }

    }
    
}
