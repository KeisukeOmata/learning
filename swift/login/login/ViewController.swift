//
//  ViewController.swift
//  login
//
//  Created by 小俣圭佑 on 2020/05/05.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var useName: UITextField!
    @IBOutlet weak var passWord: UITextField!
    @IBOutlet weak var useNameLabel: UILabel!
    @IBOutlet weak var passWordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        useName.delegate = self
        passWord.delegate = self
    }
    
    @IBAction func ligin(_ sender: Any) {
        icon.image = UIImage(named: "loginOK")
        useNameLabel.text = useName.text
        passWordLabel.text = passWord.text
    }
    
    //キーボード以外をタッチすると閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
}

