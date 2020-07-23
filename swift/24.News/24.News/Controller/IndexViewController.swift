import UIKit
//タブを付ける
import SegementSlide

//SegementSlideを利用するときはSegementSlideViewControllerを継承する
class IndexViewController: SegementSlideViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //SegementSlideで必要
        reloadData()
        //開きたいタブのIndexを設定する
        defaultSelectedIndex = 0
    }

    //ヘッダーを設定する
    override func segementSlideHeaderView() -> UIView {
        let headerUIImageView = UIImageView()
        let headerHeightCGFloat: CGFloat
        //タップなどのイベントを有効にするかどうか
        headerUIImageView.isUserInteractionEnabled = true
        //画像の表示位置
        headerUIImageView.contentMode = .scaleAspectFill
        //画像を設定
        headerUIImageView.image = UIImage(named: "header")
        //AutoresizingMaskの設定値をAuto Layoutの制約に変換するか
        //大抵自分で追加する制約とコンフリクトするため、基本はfalse
        headerUIImageView.translatesAutoresizingMaskIntoConstraints = false
        //端末によってヘッダーの高さを変える
        if #available(iOS 11.0, *) {
            headerHeightCGFloat = view.bounds.height / 4 + view.safeAreaInsets.top
        } else {
            headerHeightCGFloat = view.bounds.height / 4 + topLayoutGuide.length
        }
        //オートレイアウト
        headerUIImageView.heightAnchor.constraint(equalToConstant: headerHeightCGFloat).isActive = true
        
        return headerUIImageView
    }
    
    //タブのタイトルを設定する
      override var titlesInSwitcher: [String] {
          return ["TAB1", "TAB2", "TAB3", "TAB4", "TAB5", "TAB6"]
      }

    //タブ毎に呼ぶコントローラーを設定する
    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return Tab1TableViewController()
        case 1:
            return Tab2TableViewController()
        case 2:
            return Tab3TableViewController()
        case 3:
            return Tab4TableViewController()
        case 4:
            return Tab5TableViewController()
        case 5:
            return Tab6TableViewController()
        default:
            return Tab1TableViewController()
        }
    }
    
}
