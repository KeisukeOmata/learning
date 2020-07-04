//
//  NextViewController.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

protocol nowScoreDelegate {
    func nowScore(score: Int)
}

class NextViewController: UIViewController {
    
    @IBOutlet weak var wrongLabel: UILabel!
    @IBOutlet weak var correctLabel: UILabel!
    var correctedCount = Int()
    var wrongedCount = Int()
    var beforeCount = Int()
    var delegate: nowScoreDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        correctLabel.text = String(correctedCount)
        wrongLabel.text = String(wrongedCount)
    }
    
    @IBAction func back(_ sender: Any) {
        if beforeCount < correctedCount {
            UserDefaults.standard.set(correctedCount, forKey: "beforeCount")
            //プロトコルを呼び出す
            delegate?.nowScore(score: correctedCount)
        } else if beforeCount > correctedCount {
            UserDefaults.standard.set(beforeCount, forKey: "beforeCount")
        }
        //前の画面に戻る
        dismiss(animated: true, completion: nil)
    }
    
}
