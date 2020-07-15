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
                                            width: view.frame.size.width * 5,
                                            height: scrollScrollVIew.frame.size.height
                                        )
        
        //スクロールビューにテキストをつける
        for i in 0...4 {
            let label = UILabel(
                            frame: CGRect(
                                //xとyは画面サイズ
                                x: CGFloat(i) * view.frame.size.width,
                                y: view.frame.size.height / 3,
                                //widthとheightはスクロールビューのサイズ
                                width: scrollScrollVIew.frame.size.width,
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
