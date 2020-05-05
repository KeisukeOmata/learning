//
//  ViewController.swift
//  login
//
//  Created by 小俣圭佑 on 2020/05/05.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var useName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var useNameLabel: UILabel!
    @IBOutlet weak var passWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func ligin(_ sender: Any) {
        useNameLabel.text = useName.text
        passWordLabel.text = passWord.text
    }
    

}

