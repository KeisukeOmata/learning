//広告を表示するUIImageのクラスをGADBannerViewに設定する

import UIKit
import GoogleMobileAds

//GADBannerViewDelegate => 広告
class ViewController: UIViewController, GADBannerViewDelegate {
    
    @IBOutlet weak var AdGADBannerView: GADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    //viewが表示される直前に呼ばれる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }


}

