//
//  ViewController.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/17.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ViewController: UIViewController, nowScoreDelegate {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var maxScoreLabel: UILabel!
    let imagesList = ImagesList()
    var pickedAnswer = false
    var correctCount = 0
    var wrongCount = 0
    var maxScore = 0
    var questionNumber = 0
    //soundFileクラス
    var soundFile = SoundFile()
    //WithOutMP3クラス(対応外のファイル)
    //var withOutMP3 = WithoutMP3()
    
    //ChangeColorクラス
    var changeColor = ChangeColor()
    //CAGradientLayerクラス
    var gradientLayer = CAGradientLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.layer.cornerRadius = 20.0
        //CAGradientLayerクラス
        gradientLayer = changeColor.changeColor(topR: 0.7, topG: 0.1, topB: 0.5, topAlpha: 0.4, bottomR: 0.5, bottomG: 0.3, bottomB: 0.6, bottomAlpha: 0.6)
        gradientLayer.frame = view.bounds
        view.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        correctCount = 0
        wrongCount = 0
        questionNumber = 0
        
        imageView.image = UIImage(named: imagesList.list[0].imageText)

        if UserDefaults.standard.object(forKey: "beforeCount") != nil {
            maxScore = UserDefaults.standard.object(forKey: "beforeCount") as! Int
        }
        maxScoreLabel.text = String(maxScore)
    }
    
    @IBAction func answer(_ sender: Any) {
        //タグで分岐させる
        if (sender as AnyObject).tag == 1 {
            //音を鳴らす
            soundFile.playSound(fileName: "maruSound", extentionName: "mp3")
            //WithOutMP3クラス(対応外のファイル)
            //withOutMP3.playSound(fileName: "maruSound", extentionName: "mp3")
            pickedAnswer = true
        } else if (sender as AnyObject).tag == 2 {
            soundFile.playSound(fileName: "batsuSound", extentionName: "mp3")
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

    //プロトコルの中身
    func nowScore(score: Int) {
        soundFile.playSound(fileName: "sound", extentionName: "mp3")
        maxScoreLabel.text = String(score)
    }
    
    //performSegueの後に呼ばれる
    //NextViewControllerに値を渡す
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "next" {
            let nextVC = segue.destination as! NextViewController
            nextVC.correctedCount = correctCount
            nextVC.wrongedCount = wrongCount
            nextVC.delegate = self
        }
    }
    
}