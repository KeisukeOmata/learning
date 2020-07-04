//
//  ViewController.swift
//  calc
//
//  Created by 小俣圭佑 on 2020/05/05.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var car = Car()
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        car.pre = 2
        car.rear = 2
    }

    @IBAction func doAction(_ sender: Any) {
        car.drive()
        car.move(toBack: "進む")
        let total = car.add(num1: car.pre, num2: car.rear)
        print("合計は\(total)")
    }
    
}

