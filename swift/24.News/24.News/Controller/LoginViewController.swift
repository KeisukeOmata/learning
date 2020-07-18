import UIKit
//動画を扱う
import AVFoundation

class LoginViewController: UIViewController {
    
    //AVPlayerクラスのインスタンス
    var playerAVPlayer = AVPlayer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //動画のURLを設定する
        let url = Bundle.main.path(forResource: "ファイル名", ofType: "拡張子")
        //AVPlayerクラスのインスタンスにURLを渡す
        playerAVPlayer = AVPlayer(url: URL(fileURLWithPath: url!))
        //AVPlayerLayerクラスのインスタンスを作成する
        let playerLayer = AVPlayerLayer(player: playerAVPlayer)
        //AVPlayerLayerの位置を設定する
        playerLayer.frame = CGRect(
                                x: 0,
                                y: 0,
                                //view = 画面と同じ
                                width: view.frame.size.width,
                                //view = 画面と同じ
                                height: view.frame.size.height
                            )
        //動画の再生位置
        playerLayer.videoGravity = .resizeAspectFill
        //動画の再生回数
        //0 = 無限ループ
        playerLayer.repeatCount = 0
        //動画のZ軸
        playerLayer.zPosition = -1
        //動画をviewに反映する
        view.layer.insertSublayer(playerLayer, at: 0)
    }
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
}
