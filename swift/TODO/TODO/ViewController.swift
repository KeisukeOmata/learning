//
//  ViewController.swift
//  TODO
//
//  Created by 小俣圭佑 on 2020/05/10.
//  Copyright © 2020 KeisukeOmata. All rights reserved.
//

import UIKit

//tableViewにはUITableViewDelegateとUITableViewDataSourceが必要
//キーボードを使うにはUITextFieldDelegateが必要
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textField: UITextField!
    var textArray = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        textField.delegate = self
    }
    
    //ナビゲーションバーを非表示にする
    //他のviewコントローラーにも書く
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }

    //どの順番で実行されるか？
    //セクションの数を確認
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    //セクションの中のセルの数を確認
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return textArray.count
    }
    
    //セルの数だけcellForRowAt(セル構築)が呼ばれる
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //withIdentifierに　は、Table View Sellに付けたIdentifierを入れる
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = textArray[indexPath.row]
        cell.imageView!.image = UIImage(named: "checkImage")
        return cell
    }
    
    //セルがタップされたとき呼ばれる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = storyboard?.instantiateViewController(identifier: "next") as! nextViewController
        nextVC.todoString = textArray[indexPath.row]
        navigationController?.pushViewController(nextVC, animated: true)
    }
    
    //セルの高さを決める
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return view.frame.size.height / 6
    }
    
    //キーボードのリターンキー押下時
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textArray.append(textField.text!)
        //キーボードを閉じる
        textField.resignFirstResponder()
        textField.text = ""
        //一連の処理(セルの構築)を再実行する
        tableView.reloadData()
        
        return true
    }

}

