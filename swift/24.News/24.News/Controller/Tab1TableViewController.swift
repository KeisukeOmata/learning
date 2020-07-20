import UIKit
import SegementSlide

class Tab1TableViewController: UITableViewController, SegementSlideContentScrollViewDelegate, XMLParserDelegate {
    
    //XMLParserのインスタンス
    var parserXMLParser = XMLParser()
    //パース中の現在の要素を格納する
    var elementString: String!
    //Itemsクラスの配列
    var itemsItems = [Items]()

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
        
        //XMLパース
        let urlString = "https://news.yahoo.co.jp/pickup/rss.xml"
        let urlURL = URL(string: urlString)
        //XMLParserにURLを設定する
        parserXMLParser = XMLParser(contentsOf: urlURL!)!
        parserXMLParser.delegate = self
        //パースを開始する
        parserXMLParser.parse()
    }

    //セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //SegementSlideで必要な記述
    @objc var scrollUIScrollView: UIScrollView {
        return tableView
    }

    //1セクション中のセルの数
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //Itemsクラスの配列の数分セルを返す
        return itemsItems.count
    }
    
    //セルの高さを決める
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //画面の高さを5分割
        return view.frame.size.height / 5
    }
    
    //セルを作成する
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //UITableViewを親に持つと使える
        //subtitleで2行
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        //UIImageビューを表示するため、セルを透明にする
        cell.backgroundColor = .clear
        
        //Itemsクラスの配列を展開する
        let item = self.itemsItems[indexPath.row]
        
        return cell
    }
    
}
