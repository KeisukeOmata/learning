import UIKit
import SegementSlide

//SegementSlideContentScrollViewDelegate => スクロールビューで使う
//XMLParserDelegate => XMLパーサーで使う
class Tab3TableViewController: UITableViewController, SegementSlideContentScrollViewDelegate, XMLParserDelegate {
    
    //XMLParserのインスタンス
    var parserXMLParser = XMLParser()
    //パース中の現在の要素を格納する
    var parserString: String!
    //Itemsクラスの配列
    var itemsItems = [Items]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //画像を設定するため、テーブルビューを透明にする
        tableView.backgroundColor = .clear
        //画像を設定する
        let imageUIImage = UIImage(named: "2")
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
        //Itemsクラスの配列を展開する
        let item = self.itemsItems[indexPath.row]
        
        //UIImageビューを表示するため、セルを透明にする
        cell.backgroundColor = .clear
        
        //1行目
        //セルにItemsクラスの値を設定する
        cell.textLabel?.text = item.titleString
        //セルのテキストのフォントを設定する
        cell.textLabel?.font = UIFont.boldSystemFont(ofSize: 15.5)
        cell.textLabel?.textColor = .white
        //セルのテキストの表示行数を設定する
        cell.textLabel?.numberOfLines = 3
        
        //2行目
        //セルにItemsクラスの値を設定する
        cell.detailTextLabel?.text = item.urlString
        //セルのテキストのフォントを設定する
        cell.detailTextLabel?.textColor = .white
        
        return cell
    }
    
    //XMLパーサー
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        //パース中の現在の要素を格納する変数を初期化
        parserString = nil
        //elementNameは引数
        //"item"はXMLの要素
        if elementName == "item" {
            //XMLに"item"があれば、Itemsクラスを初期化して配列に追加する
            //値の設定は以下のfoundCharactersで行う
            self.itemsItems.append(Items())
        } else {
            //XMLに"item"がなければ、パース用の変数に格納
            parserString = elementName
        }
    }
    
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        if self.itemsItems.count > 0 {
            //Itemsクラスの配列が1以上あれば、変数に配列の-1番目を格納する
            let currentItem = self.itemsItems[self.itemsItems.count - 1]
            
            switch self.parserString {
            case "title":
                //stringはfoundCharactersの引数
                currentItem.titleString = string
            case "link":
                //stringはfoundCharactersの引数
                currentItem.urlString = string
            case "pubDate":
                //stringはfoundCharactersの引数
                currentItem.dateString = string
            default:
                break
            }
        }
    }
    
    //XMLの終了タグで呼ばれる
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        self.parserString = nil
    }
    
    //パーサーの終了時に呼ばれる
    func parserDidEndDocument(_ parser: XMLParser) {
        //テーブルビューをリロードする
        self.tableView.reloadData()
    }
    
    //webViewControllerにURLを渡して表示する
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //WebViewControllerクラスの実態
        let webViewController = WebViewController()
        //モーダルで遷移するときの切り替わり方
        webViewController.modalTransitionStyle = .crossDissolve
        //Itemsクラスの配列を展開
        let item = itemsItems[indexPath.row]
        //URLを渡す
        //webViewControllerで表示する際にkey"url"を使う
        UserDefaults.standard.set(item.urlString, forKey: "url")
        //webViewControllerに遷移
        present(webViewController, animated: true, completion: nil)
    }
    
}
