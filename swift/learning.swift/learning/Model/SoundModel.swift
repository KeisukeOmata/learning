import Foundation
//音声を扱う
import AVFoundation

class SoundModel {
    //プロパティ
    var playerAVAudioPlayer: AVAudioPlayer?
    
    //メソッド
    //音声を再生する
    //extentionにはファイル拡張子が入る
    func playSound(fileName: String, extention: String) {
        let soundURL = Bundle.main.url(forResource: fileName, withExtension: extention)
        
        do {
            playerAVAudioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
            playerAVAudioPlayer?.play()
        //エラーが起きた場合
        } catch  {
            print("音声ファイルがありません")
        }
    }
    
}
