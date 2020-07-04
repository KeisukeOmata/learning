//
//  ViewController.swift
//  nextView
//
//  Created by 小俣圭佑 on 2020/05/06.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func plus(_ sender: Any) {
        count += 1
        label.text = String(count)
        if count == 10 {
            //画面遷移する
            performSegue(
                //segueのidentifier
                //StoryboardのIDではない！！
                withIdentifier: "next",
                sender: nil
            )
        }
    }
    
    //次のページ(NextViewController)に値を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.count2 = count
    }
    
}

