import UIKit
import SDWebImage

class showViewController: UIViewController {

    var userName = String()
    var contentImage = String()
    var date = String()
    var profileImage = String()
    var comment = String()
    @IBOutlet weak var userImageImageView: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var contentImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var shareButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shareButton.layer.cornerRadius = 20.0
        
        //それぞれの値を設定する
        userImageImageView.sd_setImage(with: URL(string: profileImage), completed: nil)
        userNameLabel.text = userName
        dateLabel.text = date
        contentImageView.sd_setImage(with: URL(string: contentImage), completed: nil)
        commentLabel.text = comment
    }
    
    @IBAction func share(_ sender: Any) {
        let image = [contentImageView.image] as Any
        //アクションシートに画像を渡す
        let activityVC = UIActivityViewController(activityItems: image as! [Any], applicationActivities: nil)
        present(activityVC, animated: true, completion: nil)
    }
    
}
