//
//  TableViewController.swift
//  Ad
//
//  Created by 小俣圭佑 on 2020/06/22.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit
import GoogleMobileAds

class TableViewController: UITableViewController, GADBannerViewDelegate, GADInterstitialDelegate {
    
    var profileImageArray = ["1", "2", "3", "4", "5"]
    var textArray = ["顔文字0", "顔文字1", "顔文字2", "顔文字3", "インタースティシャル広告"]
    var interstitial: GADInterstitial!
    let backImageView = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()

        let image = UIImage(named: "backGrondImage")
        backImageView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
        backImageView.image = image
        tableView.backgroundView = backImageView
        //インタースティシャル広告を表示する
        interstitial = createAndLoadInterstitial()
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //cellForRowAt indexPathを何回呼ぶか
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1 + textArray.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    //cellForRowAt indexPathはnumberOfRowsInSectionのreturn分呼ばれる
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let indexNumber = indexPath.row
        
        if indexPath.row == 0 {
            //インタースティシャル広告のセル
            let cell = tableView.dequeueReusableCell(withIdentifier: "BannerCell", for: indexPath)
            let bannerView = cell.viewWithTag(1) as! GADBannerView
            
            bannerView.adUnitID = "ca-app-pub-3940256099942544/2934735716"
            bannerView.rootViewController = self
            bannerView.load(GADRequest())
            return cell
        } else {
            //インタースティシャル広告ではないセル
            let cell2 = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
            let profileImageView = cell2.viewWithTag(1) as! UIImageView
            let nameLabel = cell2.viewWithTag(2) as! UILabel
            
            profileImageView.image = UIImage(named: profileImageArray[indexNumber - 1])
            nameLabel.textColor = .white
            nameLabel.font = .boldSystemFont(ofSize: 20)
            nameLabel.numberOfLines = 3
            nameLabel.text = textArray[indexNumber - 1]
            
            return cell2
        }
    }

    //セルがタップされたときの挙動
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 5 {
            if interstitial.isReady {
                interstitial.present(fromRootViewController: self)
            } else {
                print("まだ広告の準備ができていません。")
            }
        }
    }
    
    //インタースティシャル広告を表示する
    //GADInterstitial型で返す
    func createAndLoadInterstitial() -> GADInterstitial {
        let interstitial = GADInterstitial(adUnitID: "ca-app-pub-3940256099942544/4411468910")
        
        interstitial.delegate = self
        interstitial.load(GADRequest())
        
        return interstitial
    }
    
    //広告を×閉じした際に再度読み込む
    func interstitialDidDismissScreen(_ ad: GADInterstitial) {
        //インタースティシャル広告を表示する
        interstitial = createAndLoadInterstitial()
    }
    
}
