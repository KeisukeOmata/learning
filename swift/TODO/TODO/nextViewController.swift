 //
//  nextViewController.swift
//  TODO
//
//  Created by 小俣圭佑 on 2020/05/10.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class nextViewController: UIViewController {

    @IBOutlet weak var todoLable: UILabel!
    var todoString = String()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        todoLable.text = todoString
    }
    
    //ナビゲーションバーを表示する
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = false
    }
    
}
