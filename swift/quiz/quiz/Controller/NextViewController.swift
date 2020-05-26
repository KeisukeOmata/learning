//
//  NextViewController.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class NextViewController: UIViewController {
    
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    var correctedCount = Int()
    var wrongedCount = Int()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongedCount)
    }
    
}
