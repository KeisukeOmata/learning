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
        nextQuestions()
    }
    
    func check(){
        //imagesListはImagesListクラスの実体
        //listは名前(imageText)と正誤(answer)を持ってる
        let correctAnswer = imagesList.list[questionNumber].answer
        
        if correctAnswer == pickedAnswer {
            print("正解")
            correctCount += 1
        } else {
            print("間違い")
            wrongCount += 1
        }
    }
    
    func nextQuestions() {
        if questionNumber <= 9 {
            questionNumber += 1
            imageView.image = UIImage(named: imagesList.list[questionNumber].imageText)
        } else {
            print("問題終了")
            performSegue(withIdentifier: "next", sender: nil)
        }
    }
    
    //performSegueの後に呼ばれる
    //NextViewControllerに値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            nextVC.correctedCount = correctCount
            nextVC.wrongedCount = wrongCount
        }
    }
    
}
