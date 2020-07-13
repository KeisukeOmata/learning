import UIKit
import Lottie

class ViewController: UIViewController {

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
        
    }

}
