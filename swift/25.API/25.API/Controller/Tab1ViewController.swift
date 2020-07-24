import UIKit
//タブを付ける
import SegementSlide
//httpリクエストを行う
import Alamofire
//jsonを扱う
import SwiftyJSON
//キャッシュを扱う
import SDWebImage

class Tab1ViewController: UITableViewController, SegementSlideContentScrollViewDelegate {

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

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //APIを叩く
        getData()
    }
    
//    //SegementSlideContentScrollViewDelegateに必要
//    @objc var scrollView: UIScrollView {
//        return tableView
//    }
//
//    //セクションの数
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//
//    //1セクション中のセルの数
//   override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//       //JsonDataクラスの配列の数分セルを返す
//       return titleStringArray.count
//   }
//
//    //セルの高さを決める
//    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        //画面の高さを5分割
//        return view.frame.size.height / 5
//    }
//
//    //セルを作成する
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        <#code#>
//    }

    //APIを叩く
    func getData() {
        //1.リクエストを作成する
        //maxResultsは取得件数
        let urlText = "https://www.googleapis.com/youtube/v3/search?key=&q=猫&part=snippet&maxResults=2&order=date"
        //日本語を含む検索ワードをURLに変換する
        let urlURL = urlText.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        //2.Alamofireでhttpリクエストを行う
        AF.request(urlURL, method: .get, parameters: nil, encoding: JSONEncoding.default).responseJSON { (responce) in
            //Json解析
            print("Json取得開始")
            print(responce)
            
            switch responce.result {
            case .success:
                //40件取得する設定
                for i in 0...1 {
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
                    let youtubeURL = "https://www.youtube.com/watch?v=\(videoIdString)"
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
    
}
