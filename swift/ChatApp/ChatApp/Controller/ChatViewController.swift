import UIKit

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    //スクリーンのサイズを取得
    let screanSize = UIScreen.main.bounds.size
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        //テーブルビューにはユーザー情報を表示
        //テーブルビューにCustomCell.xibを設定する
        tableView.register(UINib(nibName: "CustomCell", bundle: nil), forCellReuseIdentifier: "cell")
        //テーブルビューの高さを可変にする
        tableView.rowHeight = UITableView.automaticDimension
        //CustomCell.xibの高さに合わせる
        tableView.estimatedRowHeight = 82
        
        //チャット機能
        //テキストフィールドを上げる
        //keyboardWillShow(_ :)で引数を渡せる
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillShow(_ :)), name: UIResponder.keyboardWillShowNotification, object: nil)
        //テキストフィールドを下げる
        //keyboardWillHide(_ :)で引数を渡せる
        NotificationCenter.default.addObserver(self, selector: #selector(ChatViewController.keyboardWillHide(_ :)), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        //Firebaseからデータをフェッチしてくる
        
    }
    
    //キーボードを上げる
    //引数としてNSNotification型をとる
    //#selecterで用いる関数には@objcが必要
    @objc func keyboardWillShow(_ notification: NSNotification) {
        //キーボードの高さを取得
        let keyboardHight = ((notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as Any) as AnyObject).cgRectValue.height
        //スクリーンサイズからキーボードの高さとメッセージ入力欄を引いた高さ
        messageTextField.frame.origin.y = screanSize.height - keyboardHight - messageTextField.frame.height
    }
    
    //キーボードを下げる
    //引数としてNSNotification型をとる
    //#selecterで用いる関数には@objcが必要
    @objc func keyboardWillHide(_ notification: NSNotification) {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    
}
