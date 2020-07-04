//
//  ViewController.swift
//  nextView
//
//  Created by 小俣圭佑 on 2020/05/06.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

//ナビゲーションコントローラーで画面遷移する場合
//Editor -> Embed In -> Navigation Controller
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
            let nextVC = storyboard?.instantiateViewController(
                //StoryboardID
                //segueのIDとは違う！！
                withIdentifier: "next"
            ) as! NextViewController

            //画面遷移する
            navigationController?.pushViewController(nextVC, animated: true)
        }
    }
    
    //次のページに値を受け渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let nextVC = segue.destination as! NextViewController
        nextVC.count2 = count
    }
    
}

