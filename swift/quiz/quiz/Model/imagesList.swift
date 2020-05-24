//
//  imagesList.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/22.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import Foundation

class ImagesList {
    var list = [ImagesModel]()
    init(){
        //ImagesModelの引数は2つ(名前(imageText)と正誤(answer))
        list.append(ImagesModel(imageName: "0", correctOrNot: true))
        list.append(ImagesModel(imageName: "1", correctOrNot: false))
        list.append(ImagesModel(imageName: "2", correctOrNot: false))
        list.append(ImagesModel(imageName: "3", correctOrNot: false))
        list.append(ImagesModel(imageName: "4", correctOrNot: true))
        list.append(ImagesModel(imageName: "5", correctOrNot: false))
        list.append(ImagesModel(imageName: "6", correctOrNot: true))
        list.append(ImagesModel(imageName: "7", correctOrNot: true))
        list.append(ImagesModel(imageName: "8", correctOrNot: false))
        list.append(ImagesModel(imageName: "9", correctOrNot: true))
        list.append(ImagesModel(imageName: "10", correctOrNot: true))
    }
}
