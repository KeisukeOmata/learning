//
//  nextViewController.swift
//  protocol
//
//  Created by 小俣圭佑 on 2020/05/13.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

protocol CatchProtocol {
    func catchData(count: Int)
}

class nextViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var count: Int = 0
    var delegate: CatchProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func plusAction(_ sender: Any) {
        count += 1
        label.text = String(count)
    }
    
    @IBAction func back(_ sender: Any) {
        //作成したprotocolを呼び出す
        delegate?.catchData(count: count)
        //前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
}
