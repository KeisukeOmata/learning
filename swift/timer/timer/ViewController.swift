//
//  ViewController.swift
//  timer
//
//  Created by 小俣圭佑 on 2020/05/05.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var stopButton: UIButton!
    var timer = Timer()
    var count = Int()
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        count = 0
        stopButton.isEnabled = true
        
        for i in 0..<5 {
            print(i)
            let image = UIImage(named: "\(i)")
            imageArray.append(image!)
        }
        
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            selector: #selector(timerUpdate),
            userInfo: nil,
            repeats: true
        )
    }
    
    //startTimer内で0.2秒毎に呼ばれる
    @objc func timerUpdate(){
        count = count + 1
        if count >= 5 {
            count = 0
        }
        imageView.image = imageArray[count]
    }

    @IBAction func start(_ sender: Any) {
        startTimer()
        startButton.isEnabled = false
        //trueが押せる
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        //trueが押せる
        startButton.isEnabled = true
        stopButton.isEnabled = false
        //タイマーを止める
        timer.invalidate()
    }
}

