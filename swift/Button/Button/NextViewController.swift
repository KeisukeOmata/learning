//
//  NextViewController.swift
//  Button
//
//  Created by 小俣圭佑 on 2020/05/04.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet var changeLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    @IBAction func change(_ sender: Any) {
        changeLabel.text = "hoge"
    }

}
