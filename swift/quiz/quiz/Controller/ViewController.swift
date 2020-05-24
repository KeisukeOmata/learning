//
//  ViewController.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScoreLabel: UILabel!
    let imagesList = ImagesList()
    var pickedAnswer = false
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)
    }
    
    @IBAction func answer(_ sender: Any) {
        //タグで分岐させる
        if (sender as AnyObject).tag == 1 {
            pickedAnswer = true
        } else if (sender as AnyObject).tag == 2 {
            pickedAnswer = false
        }
        
        check()
    }
    
    func check(){
        //imagesListはImagesListクラスの実体
        //listは名前(imageText)と正誤(answer)を持ってる
        let correctAnswer = imagesList.list[0].answer
        
        if correctAnswer == pickedAnswer {
            print("正解")
            correctCount += 1
        } else {
            print("間違い")
            wrongCount += 1
        }
    }
    
}
