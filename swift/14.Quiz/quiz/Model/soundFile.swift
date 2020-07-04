//
//  soundFile.swift
//  quiz
//
//  Created by 小俣圭佑 on 2020/05/30.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import Foundation
import AVFoundation

class SoundFile {
    var player: AVAudioPlayer?
    
    func playSound(fileName: String, extentionName: String){
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extentionName)
        
        do {
            player = try AVAudioPlayer(contentsOf: soundURL!)
            player?.play()
        //エラーが起きた場合
        } catch  {
            print("エラーです")
        }
    }
}
