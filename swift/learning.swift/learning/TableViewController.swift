//Table View
//Table View Cell

import UIKit

//UITableViewDelegate => テーブルビューのプロトコル
//UITableViewDataSource => テーブルビューのプロトコル
//UITextFieldDelegate => テキストフィールドのプロトコル
class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    //String型の配列を宣言
    var textArrayString = [String]()
    //テキストフィールド
    @IBOutlet weak var textUITextField: UITextField!
    //テーブルビュー
    @IBOutlet weak var tableUITableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        //UITableViewDelegate
        tableUITableView.delegate = self
        //UITableViewDataSource
        tableUITableView.dataSource = self
        //UITextFieldDelegate
        textUITextField.delegate = self
    }
    
    //キーボードのリターンキー押下時
    //UITextFieldDelegate
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        //String型の配列にテキストフィールドのtextを格納
        textArrayString.append(textUITextField.text!)
        //キーボードを閉じる
        textUITextField.resignFirstResponder()
        //テキストフィールドを空に
        textUITextField.text = ""
        //テーブルビューを再読み込み
        tableUITableView.reloadData()
        
        return true
    }
    
    //セクションの数を決める
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //セクションの中のセルの数を決める
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArrayString.count
    }
    
    //セルの内容を決める
    //セルの数だけcellForRowAtが呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //withIdentifierには、Table View Sellに付けたIdentifierを入れる
        let cell = tableUITableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        //セルのスタイルをなくす
        cell.selectionStyle = .none
        cell.textLabel?.text = textArrayString[indexPath.row]
        return cell
    }
    
    //セルがタップされたとき呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(textArrayString[indexPath.row])
    }
    
    //セルの高さを決める
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }

}
