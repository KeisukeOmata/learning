//
//  ViewController.swift
//  Count
//
//  Created by 小俣圭佑 on 2020/05/05.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var countLabel: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        countLabel.text = "0"
    }

    @IBAction func plus(_ sender: Any) {
        count = count + 1
        countLabel.text = String(count)
        
        if count >= 10 {
            changeYellow()
        }
    }
    
    @IBAction func minus(_ sender: Any) {
        count = count - 1
        countLabel.text = String(count)
        
        if count <= 0 {
            changeWhite()
        }
    }
    
    func changeYellow(){
        countLabel.textColor = .yellow
    }
    
    func changeWhite(){
        countLabel.textColor = .white
    }
}

