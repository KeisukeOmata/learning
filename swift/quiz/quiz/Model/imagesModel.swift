//
//  imagesModel.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/20.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import Foundation

class ImagesModel {
    let imageText: String
    let answer: Bool
    
    //持たせる値は初期化に追加
    init(imageName: String, correctOrNot: Bool) {
        imageText = imageName
        answer = correctOrNot
    }
}
