//Table View
//Table View Cell

import UIKit

//UITableViewDelegate => テーブルビューのプロトコル
//UITableViewDataSource => テーブルビューのプロトコル
class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableUITableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //UITableViewDelegate
        tableUITableView.delegate = self
        //UITableViewDataSource
        tableUITableView.dataSource = self
    }

}
