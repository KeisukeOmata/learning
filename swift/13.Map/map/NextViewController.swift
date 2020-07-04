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
        
        if idoTextField.text != nil && keidoTextField.text != nil {
            //プロトコルを呼び出す
            delegate?.searchLocaion(idoValue: idoValue, keidoValue: keidoValue)
            //前の画面に戻る
            dismiss(animated: true, completion: nil)
        }
    }
    
}
