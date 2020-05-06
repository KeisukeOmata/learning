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
        count = 0
        //trueでボタンが押せるようになる
        stopButton.isEnabled = true
        
        for i in 0..<5 {
            print(i)
            let image = UIImage(named: "\(i)")
            //UIImageの実体を作成し、配列に格納
            imageArray.append(image!)
        }
        
        //imageView.imageで画像を表示
        imageView.image = UIImage(named: "0")
    }
    
    func startTimer(){
        timer = Timer.scheduledTimer(
            timeInterval: 0.2,
            target: self,
            //0.2秒毎にtimerUpdateを呼び出す
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
        //配列に格納された画像を表示
        imageView.image = imageArray[count]
    }

    @IBAction func start(_ sender: Any) {
        startTimer()
        //falseでボタンが押せないようになる
        startButton.isEnabled = false
        //trueでボタンが押せるようになる
        stopButton.isEnabled = true
    }
    
    @IBAction func stop(_ sender: Any) {
        //trueでボタンが押せるようになる
        startButton.isEnabled = true
        //falseでボタンが押せないようになる
        stopButton.isEnabled = false
        //タイマーを止める
        timer.invalidate()
    }
}

