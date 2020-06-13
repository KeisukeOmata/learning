//
//  ShareViewController.swift
//  bokete
//
//  Created by 小俣圭佑 on 2020/06/11.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController {
    
    var resultImage = UIImage()
    var screenShotImage = UIImage()
    var commentString = String()
    @IBOutlet weak var resultImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultImageView.image = resultImage
        commentLabel.text = commentString
        //Labelをサイズ内に収める
        commentLabel.adjustsFontSizeToFitWidth = true

    }
    
    //シェアするボタン
    @IBAction func share(_ sender: Any) {
        //スクショを撮る
        takeScreenShot()
        
        let items = [screenShotImage] as [Any]
        let activityVC = UIActivityViewController(activityItems: items, applicationActivities: nil)
        //アクティビティでシェアする
        present(activityVC, animated: true, completion: nil)
    }
    
    //スクショを撮る
    func takeScreenShot() {
        let width = CGFloat(UIScreen.main.bounds.size.width)
        let height = CGFloat(UIScreen.main.bounds.size.height/1.3)
        let size = CGSize(width: width, height: height)
        
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        self.view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        screenShotImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
    }
    
    //戻るボタン
    @IBAction func back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}
