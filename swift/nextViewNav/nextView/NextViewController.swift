//
//  NextViewController.swift
//  nextView
//
//  Created by 小俣圭佑 on 2020/05/06.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {

    @IBOutlet weak var label2: UILabel!
    var count2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label2.text = String(count2)
    }

}
