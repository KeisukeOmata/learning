import UIKit
import Lottie

//UIScrollViewDelegate
//スクロールビューで使う
class ViewController: UIViewController, UIScrollViewDelegate {

    @IBOutlet weak var scrollScrollVIew: UIScrollView!
    var jsonArray = ["1", "2", "3", "4", "5"]
    var jsonTextArray = ["text1", "text1", "text1", "text1", "text1"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //スクロールビューを有効にする
        scrollScrollVIew.isPagingEnabled = true
    }
    
    //ナビゲーションバーを非表示にする
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }
    
    func scroll() {
        scrollScrollVIew.delegate = self
        //スクロールビューのサイズ
        //5枚表示するのでwidthに＊5
        scrollScrollVIew.contentSize = CGSize(width: view.frame.size.width * 5, height: scrollScrollVIew.frame.size.height)
        //ラベルをつける
        for i in 0...4 {
            
        }
    }

}
