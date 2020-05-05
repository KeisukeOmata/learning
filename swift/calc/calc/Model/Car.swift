//
//  Car.swift
//  calc
//
//  Created by 小俣圭佑 on 2020/05/05.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import Foundation

class Car{
    var pre = 0
    var rear = 0
    
    init(){
        pre = 0
        rear = 0
    }
    
    func drive(){
        print("pre = \(pre)")
        print("rear = \(rear)")
    }
    
    func move(toBack: String){
        print(toBack)
    }
    
    func add(num1: Int, num2: Int) -> Int {
        return num1 + num2
    }
}
