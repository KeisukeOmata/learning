import UIKit
import ChameleonFramework
import Firebase

class ChatViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var sendButton: UIButton!
    //スクリーンのサイズを取得
    let screanSize = UIScreen.main.bounds.size
    //チャットを格納する配列
    var chatArray = [MessageModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        messageTextField.delegate = self
        
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
        fetchChatData()
        
        //セルのハイライトを消す
        tableView.separatorStyle = .none
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
        //キーボードの高さを取得
        messageTextField.frame.origin.y = screanSize.height - messageTextField.frame.height
        
        //guard文はエラーの際に必ずスコープから抜ける
        //いずれかの条件が満たされない場合に処理を抜ける
        guard 
            let rect = (notification.userInfo?[UIResponder.keyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue,
            //キーボードが閉じる時間
            let duration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? TimeInterval
        else {return}
        
        //キーボードが閉じるアニメーション
        UIView.animate(withDuration: duration) {
            let transform = CGAffineTransform(translationX: 0, y: 0)
            
            //クロージャーの中なのでself
            self.view.transform = transform
        }
        
    }
    
    //キーボードを閉じる
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        messageTextField.resignFirstResponder()
    }
    
    //テキストフィールドを閉じる
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //メッセージの数
        chatArray.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //numberOfRowsInSectionのセルの数だけ呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
        
        //indexPath.rowは表示するセルの番号を0から取得する
        cell.messageLabel.text = chatArray[indexPath.row].message
        cell.userNameLabel.text = chatArray[indexPath.row].sender
        cell.iconImageView.image = UIImage(named: "dogAvatarImage")
        
        //import Firebase
        //ユーザーのメールアドレスで色分けする
        if cell.userNameLabel.text == Auth.auth().currentUser?.email as! String {
            //import ChameleonFramework
            cell.messageLabel.backgroundColor = UIColor.flatGreen()
            cell.messageLabel.layer.cornerRadius = 20
            cell.messageLabel.layer.masksToBounds = true
        } else {
            cell.messageLabel.backgroundColor = UIColor.flatBlue()
            cell.messageLabel.layer.cornerRadius = 20
            cell.messageLabel.layer.masksToBounds = true
        }
            
        return cell
    }
    
    //セルの高さを返す
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    @IBAction func sendAction(_ sender: Any) {
        //テキストを終了
        messageTextField.endEditing(true)
        //テキストを無効
        messageTextField.isEnabled = false
        //ボタンを無効
        sendButton.isEnabled = false
        
        //送信できるメッセージの文字数を制限
        if messageTextField.text!.count > 30 {
            print("入力できる文字数は30文字までです")
            
            return
        }
        
        //Firebase
        let chatDB = Database.database().reference().child("chats")
        //キーバリューで値を送信(Dictionary型)
        let messageInfo = ["sender": Auth.auth().currentUser?.email, "message": messageTextField.text!]
        
        //データベースに値を格納
        chatDB.childByAutoId().setValue(messageInfo) { (error, result) in
            if error != nil {
                print(error!)
            } else {
                print("送信完了")
                //テキストを有効
                self.messageTextField.isEnabled = true
                //ボタンを有効
                self.sendButton.isEnabled = true
                //テキストを空に
                self.messageTextField.text = ""
            }
        }
    }
    
    //Firebaseからデータをフェッチしてくる
    func fetchChatData() {
        //データベース名
        let fetchDataRef = Database.database().reference().child("chats")
        
        //更新があったデータを取得する
        fetchDataRef.observe(.childAdded) { (snapShot) in
            let snapShotData = snapShot.value as AnyObject
            let sender = snapShotData.value(forKey: "sender")
            let text = snapShotData.value(forKey: "message")
            //Messageクラスの実態に取得したデータを設定し、配列に追加する
            let message = MessageModel()
            message.message = text as! String
            message.sender = sender as! String
            self.chatArray.append(message)
            //デリゲートメソッドを再度呼び出し
            self.tableView.reloadData()
        }
    }
    
}
