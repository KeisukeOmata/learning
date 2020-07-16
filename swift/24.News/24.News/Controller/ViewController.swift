import UIKit
import Lottie

//UIScrollViewDelegate
//スクロールビューで使う
class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollScrollVIew: UIScrollView!
    var jsonArray = ["1", "2", "3", "4", "5"]
    var jsonTextArray = ["text1", "text2", "text3", "text4", "text5"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールビューを有効にする
        scrollScrollVIew.isPagingEnabled = true
        //スクロールビューのサイズとテキストの設定を行う
        func scroll()
        //Lottieを使ってアニメーションビューを表示する
        for i in 0...4 {
            //AnimationVIewクラス
            let animationAnimationView = AnimationView()
            //アニメーションにjsonを設定
            let animation = Animation.named(jsonArray[i])
            animationAnimationView.frame = CGRect(
                                                //アニメーションビューの画面左上からのx座標
                                                x: CGFloat(i) * view.frame.size.width,
                                                //アニメーションビューの画面左上からのy座標
                                                y: 0,
                                                //アニメーションビューの横幅
                                                width: view.frame.size.width,
                                                //アニメーションビューの高さ
                                                height: view.frame.size.height
                                            )
        }
    }
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    //スクロールビューのサイズとテキストの設定を行う
    func scroll() {
        scrollScrollVIew.delegate = self
        
        //スクロールビューのサイズを決める
        //5枚表示するのでwidthに＊5
        scrollScrollVIew.contentSize = CGSize(
                                            //スクロールビューの横幅
                                            width: view.frame.size.width * 5,
                                            //スクロールビューの高さ
                                            height: scrollScrollVIew.frame.size.height
                                        )
        
        //スクロールビューにテキストをつける
        for i in 0...4 {
            let label = UILabel(
                            frame: CGRect(
                                //テキストの画面左上からのx座標
                                x: CGFloat(i) * view.frame.size.width,
                                //テキストの画面左上からのy座標
                                y: view.frame.size.height / 3,
                                //テキストの横幅
                                width: scrollScrollVIew.frame.size.width,
                                //テキストの高さ
                                height: scrollScrollVIew.frame.size.height
                            )
                        )
            
            //フォントサイズ
            label.font = UIFont.boldSystemFont(ofSize: 15.0)
            //表示位置
            label.textAlignment = .center
            //スクロールビューに表示するテキスト
            label.text = jsonTextArray[i]
            //スクロールビューに設定する
            scrollScrollVIew.addSubview(label)
        }
    }

}
