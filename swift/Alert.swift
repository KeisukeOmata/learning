//非同期でアラートを出す
import EMAlertController

class ViewController: UIViewController {

  @IBOutlet weak var hogeUIImageView: UIImageView!

  override func viewDidLoad() {
        super.viewDidLoad()
  }

  @IBAction func fuga(_ sender: Any) {
    if hogeUIImageView.image == nil {
      //非同期処理
      DispatchQueue.main.async {
        self.alert()                
      }
      return
    }
  }

  func alert(){   
    let alert = EMAlertController(icon: UIImage(named: "Alert"), title: "画像が設定されていません", message: "画像を設定してください。")
    //OKを押すとアラートが消える
    let action = EMAlertAction(title: "OK", style: .normal) {
    }
    alert.addAction(action)
    self.present(alert, animated: true, completion: nil)     
  }

}