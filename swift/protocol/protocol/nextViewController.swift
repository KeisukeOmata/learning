//
//  nextViewController.swift
//  protocol
//
//  Created by 小俣圭佑 on 2020/05/13.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func plusAction(_ sender: Any) {
        count += 1
        label.text = String(count)
    }
    
}
