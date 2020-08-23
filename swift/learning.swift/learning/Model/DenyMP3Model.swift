import Foundation

//SoundModelを親に持つ
//mp3を弾くため、DenyMP3Model.playSound(fileName: String, extention: String)の形で使う
class DenyMP3Model: SoundModel {
    override func playSound(fileName: String, extention: String) {
        if extention == "mp3" {
            print("このファイルは再生できません")
            //SoundModelのプロパティ
            //親クラスのプロパティはそのまま使える
            playerAVAudioPlayer?.stop()
        } else {
            //親クラスのメソッドを使うときはsuper.が必要
            super.playSound(fileName: fileName, extention: extention)
        }
    }
    
}
