//
//  ViewController.swift
//  protocol
//
//  Created by 小俣圭佑 on 2020/05/13.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, CatchProtocol {

    @IBOutlet weak var label: UILabel!
    var count: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //プロトコル内で呼ばれる
    //引数をラベルに表示
    func catchData(count: Int) {
        label.text = String(count)
    }
    
    @IBAction func next(_ sender: Any) {
        //画面遷移
        performSegue(withIdentifier: "next", sender: nil)
    }
    
    //値の受け渡しに必要
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! nextViewController
        nextVC.delegate = self
    }
    
}

