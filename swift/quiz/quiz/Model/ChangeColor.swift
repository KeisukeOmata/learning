//
//  ChangeColor.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/31.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import Foundation
import UIKit

class ChangeColor {
    func changeColor(topR: CGFloat, topG: CGFloat, topB: CGFloat, topAlpha: CGFloat, bottomR: CGFloat, bottomG: CGFloat, bottomB: CGFloat, bottomAlpha: CGFloat) -> CAGradientLayer {
        let topColor = UIColor(red: topR, green: topG, blue: topB, alpha: topAlpha)
        let bottomColor = UIColor(red: bottomR, green: bottomG, blue: bottomB, alpha: bottomAlpha)
        let gradientColor = [topColor.cgColor, bottomColor.cgColor]
        //CAGradientLayerクラス
        let gradientLayer = CAGradientLayer()
        
        gradientLayer.colors = gradientColor
        
        return gradientLayer
    }
}
