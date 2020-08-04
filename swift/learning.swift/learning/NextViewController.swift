import UIKit

class NextViewController: UIViewController {
    
    var fuga = Int()
    @IBOutlet weak var labelUILabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelUILabel.text = String(fuga)
    }

}
