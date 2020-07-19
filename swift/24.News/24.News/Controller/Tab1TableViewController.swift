import UIKit
import SegementSlide

class Tab1TableViewController: UITableViewController, SegementSlideContentScrollViewDelegate, XMLParserDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像を設定するため、テーブルビューを透明にする
        tableView.backgroundColor = .clear
        //画像を設定する
        let imageUIImage = UIImage(named: "0")
        let imageUIImageView = UIImageView(
                                    frame: CGRect(
                                        x: 0,
                                        y: 0,
                                        width: self.tableView.frame.size.width,
                                        height: self.tableView.frame.size.height
                                    )
                                )
        imageUIImageView.image = imageUIImage
        //画像をテーブルビューの下に置く
        self.tableView.backgroundView = imageUIImageView
        
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //SegementSlideで必要な記述
    @objc var scrollUIScrollView: UIScrollView {
        return tableView
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        return cell
    }
    
}
