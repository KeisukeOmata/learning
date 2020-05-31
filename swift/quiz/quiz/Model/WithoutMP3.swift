//
//  WithoutMP3.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/31.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import Foundation

class WithoutMP3: SoundFile {
    override func playSound(fileName: String, extentionName: String) {
        if extentionName == "mp3" {
            print("このファイルは再生できません")
        }
        
        player?.stop()
    }
}
