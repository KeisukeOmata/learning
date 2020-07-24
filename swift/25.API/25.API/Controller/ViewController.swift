import UIKit
import SegementSlide

class ViewController: SegementSlideDefaultViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        //SegementSlideに必要な記述
        reloadData()
        //タブの何番目から表示するか
        defaultSelectedIndex = 0
    }

    //ヘッダーを作成する
    override func segementSlideHeaderView() -> UIView {
        //ヘッダー
        let headerUIImageView = UIImageView()
        //ヘッダーの高さ
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
        //ヘッダーを返す
        return headerUIImageView
    }

    //タブのタイトルを設定する
    override var titlesInSwitcher: [String] {
        return ["Tab1", "Tab2", "Tab3", "Tab4", "Tab5", "Tab6"]
    }

    override func segementSlideContentViewController(at index: Int) -> SegementSlideContentScrollViewDelegate? {
        switch index {
        case 0:
            return Tab1ViewController()
        case 1:
            return Tab2ViewController()
        case 2:
            return Tab3ViewController()
        case 3:
            return Tab4ViewController()
        case 4:
            return Tab5ViewController()
        case 5:
            return Tab6ViewController()
        default:
            return Tab1ViewController()
        }
    }

}
