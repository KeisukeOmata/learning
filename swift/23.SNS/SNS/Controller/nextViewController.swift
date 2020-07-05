import UIKit
//キャッシュを扱う
import SDWebImage

//テーブルビューで使うプロトコル
//UITableViewDelegatem
//UITableViewDataSource
class nextViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var timeLine: UITableView!
    @IBOutlet weak var cameraButton: UIButton!
    var selectedImage = UIImage()
    var userName = String()
    var userImageData = Data()
    var userImage = UIImage()
    var comment = String()
    var createDate = String()
    var contentImage = String()
    var profileImage = String()
    var contentsArray = [Contents]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLine.delegate = self
        timeLine.dataSource = self
        
        //前ページで保存した値を呼び出す
        //"userName"
        if UserDefaults.standard.object(forKey: "userName") != nil {
            userName = UserDefaults.standard.object(forKey: "userName") as! String
        }
        
        //前ページで保存した値を呼び出す
        //"logo"
        if UserDefaults.standard.object(forKey: "logo") != nil {
            userImageData = UserDefaults.standard.object(forKey: "logo") as! Data
            //Data型をUIImage型に変換
            userImage = UIImage(data: userImageData)!
        }
    }
    
    //セクションの中のセルの数
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contentsArray.count
    }
    
    //セルを構築する
    //indexPathは配列の数だけインクリメントされる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = timeLine.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //先にコンテンツそれぞれにtagをつけておく
        //profileImageView
        let profileImageView = cell.viewWithTag(1) as! UIImageView
        //配列のrow番目のprofileImageStringをURL型にキャストし、sd_setImageに渡す
        profileImageView.sd_setImage(with: URL(string: contentsArray[indexPath.row].profileImageString), completed: nil)
        profileImageView.layer.cornerRadius = 30.0
        
    }
    
    //セクションの数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
}
