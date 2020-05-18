//
//  ViewController.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScoreLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func answer(_ sender: Any) {
        //タグで分岐させる
        if (sender as AnyObject).tag == 1 {
            
        } else if (sender as AnyObject).tag == 2 {
            
        }
    }
    
}
