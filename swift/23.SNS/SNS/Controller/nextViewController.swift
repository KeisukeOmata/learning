import UIKit

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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
