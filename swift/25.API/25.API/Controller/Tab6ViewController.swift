import UIKit
//タブを付ける
import SegementSlide
//httpリクエストを行う
import Alamofire
//jsonを扱う
import SwiftyJSON
//キャッシュを扱う
import SDWebImage

class Tab6ViewController: UITableViewController, SegementSlideContentScrollViewDelegate {

    //JsonDataクラスのインスタンス
    var jsonData = JsonData()
    //JsonDataクラス内のvideoIDを格納する配列
    var videoIDStringArray = [String]()
    //JsonDataクラス内のpublishedAtを格納する配列
    var publishedAtStringArray = [String]()
    //JsonDataクラス内のtitleを格納する配列
    var titleStringArray = [String]()
    //JsonDataクラス内のimageURLを格納する配列
    var imageURLStringArray = [String]()
    //JsonDataクラス内のyoutubeURLを格納する配列
    var youtubeURLStringArray = [String]()
    //JsonDataクラス内のchannelTitleを格納する配列
    var channelTitleStringArray = [String]()
    //セルに表示する行数
    var cellLines: Int = 5
    //取得する動画の数(-1する)
    var numberOfVideos: Int = 4
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //APIを叩く
        getData()
    }
    
    //SegementSlideContentScrollViewDelegateに必要
    @objc var scrollView: UIScrollView {
        return tableView
    }

    //セクションの数
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //1セクション中のセルの数
   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       //JsonDataクラスの配列の数分セルを返す
       return titleStringArray.count
   }

    //セルの高さを決める
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        //画面の高さを5分割
        return view.frame.size.height / 5
    }

    //セルを作成する
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //subtitleでタイトル(textLabel)と見出し(detailTextLabel)
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "Cell")
        //セルに設定する画像
        let imageURL = URL(string: self.imageURLStringArray[indexPath.row] as String)!

        //セルのハイライトをなくす
        cell.selectionStyle = .none
        //画像をセルに設定する
        cell.imageView?.sd_setImage(with: imageURL, completed: nil)
        //タイトルをセルに設定する
        cell.textLabel?.text = self.titleStringArray[indexPath.row]
        //日時をセルの見出しに設定する
        cell.detailTextLabel?.text = self.publishedAtStringArray[indexPath.row]
        //フォントサイズをオートで設定する
        cell.textLabel?.adjustsFontSizeToFitWidth = true
        cell.detailTextLabel?.adjustsFontSizeToFitWidth = true
        //行数を設定する
        cell.textLabel?.numberOfLines = cellLines
        cell.detailTextLabel?.numberOfLines = cellLines
        return cell
    }

    //APIを叩く
    func getData() {
        //1.リクエストを作成する
        //maxResultsは取得件数
        let urlText = "https://www.googleapis.com/youtube/v3/search?key=&q=ベンガルトラ&part=snippet&maxResults=5&order=date"
        //日本語を含む検索ワードをURLに変換する
        let urlURL = urlText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        //2.Alamofireでhttpリクエストを行う
        AF.request(urlURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (responce) in
            //Json解析
            print("Json取得開始")
            print(responce)
            
            switch responce.result {
            case .success:
                for i in 0...self.numberOfVideos {
                    //JSON型のインスタンスに取得結果を設定
                    let jsonJSON = JSON(responce.data as Any)
                    //videoIdを取得
                    let videoIdString = jsonJSON["items"][i]["id"]["videoId"].string
                    print(videoIdString as Any)
                    //publishedAtを取得
                    let publishedAtString = jsonJSON["items"][i]["snippet"]["publishedAt"].string
                    print(publishedAtString as Any)
                    //titleを取得
                    let titleString = jsonJSON["items"][i]["snippet"]["title"].string
                    print(titleString as Any)
                    //imageURLを取得
                    let imageURLString = jsonJSON["items"][i]["snippet"]["thumbnails"]["default"]["url"].string
                    print(imageURLString as Any)
                    //youtubeURLを取得
                    //オプショナルが付いてしまうため「！」を付与
                    let youtubeURL = "https://www.youtube.com/watch?v=\(videoIdString!)"
                    print(youtubeURL)
                    //channelTitleを取得
                    let channelTitleString = jsonJSON["items"][i]["snippet"]["channelTitle"].string
                    print(channelTitleString as Any)
                    
                    //配列に値を設定する
                    self.videoIDStringArray.append(videoIdString!)
                    self.publishedAtStringArray.append(publishedAtString!)
                    self.titleStringArray.append(titleString!)
                    self.imageURLStringArray.append(imageURLString!)
                    self.youtubeURLStringArray.append(youtubeURL)
                    self.channelTitleStringArray.append(channelTitleString!)
                    print("json取得完了")
                }
                break
            case .failure(let error):
                print(error)
                break
            }
            //テーブルビューを再読み込み
            self.tableView.reloadData()
        }
    }
    
    //セルがタップされたときの処理
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルがタップされたときの添字
        let thisNumber = indexPath.row
        //webViewControllerクラスのインスタンス
        let webViewController = WebViewController()
        //タップされた動画のURL
        let thisURL = youtubeURLStringArray[thisNumber]

        print("タップされたセルのURL")
        print(thisURL)
        //タップされた動画のURLをアプリ内に設定する
        UserDefaults.standard.set(thisURL, forKey: "url")
        //WebViewControllerに遷移する
        present(webViewController, animated: true, completion: nil)
    }
    
}
