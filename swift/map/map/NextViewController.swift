//
//  NextViewController.swift
//  map
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

protocol SearchLocationDelegate {
    func searchLocaion(idoValue: String, keidoValue: String)
}

class NextViewController: UIViewController {

    @IBOutlet weak var idoTextField: UITextField!
    @IBOutlet weak var keidoTextField: UITextField!
    var delegate: SearchLocationDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func okAction(_ sender: Any) {
        let idoValue = idoTextField.text!
        let keidoValue = keidoTextField.text!
    }
    
}
