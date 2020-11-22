import React, {Component} from 'react'
import firebase from "firebase";
import Router from 'next/router';
import "firebase/storage";

class FireAdd extends Component {
  
  constructor(props) {
    super(props);
    this.state = {
      name_str: '',
      msg_str: '',
      lastID: -1,
      data: []
    };
    // firebaseから最後のIDを取得
    this.getLastID();
    this.doChangeName = this.doChangeName.bind(this);
    this.doChangeMsg = this.doChangeMsg.bind(this);
    this.doAction = this.doAction.bind(this);
  }

  doChangeName(e) {
    this.setState({
      name_str: e.target.value
    });
  };

  doChangeMsg(e) {
    this.setState({
      msg_str: e.target.value
    });
  };

  doAction() {
    this.addFireData();
    // ページ遷移
    Router.push('/fire');
  };

  // firebaseから最後のIDを取得
  getLastID() {
    let db = firebase.database();
    let ref = db.ref('sample/');
    let self = this;
    // orderByKey キーによって並べ替える
    ref.orderByKey()
      // limitToLast 引数で渡した数だけ最後から取得する
      .limitToLast(1)
      .on('value', (snapshot) => {
        // 取得した値を代入
        let res = snapshot.val();
        // stateに設定する
        for(let i in res) {
          self.setState({
            lastID: i
          });
          return;
        };
    });
  };

  // データを追加する
  addFireData() {
    // 初期値の場合終了
    if (this.state.lastID == -1) {
      return;
    };
    // 数値型を取得するために * 1 を行う
    // + 1 で最新のIDに変更
    let id = this.state.lastID * 1 + 1;
    let db = firebase.database();
    // refはsample/idとなる
    let ref = db.ref('sample/' + id);
    // ref.setでDBに追加
    ref.set( {
      ID: id,
      message: this.state.msg_str,
      name: this.state.name_str
    });
  };

  render() {
    if (this.state.lastID == -1) {
      this.getLastID();
    }
    return (
      <div>
        {/* 三項演算子 */}
        {(this.state.lastID == -1)
        ?
        // 初期値の場合
        <p>please wait...</p>
        :
        // 初期値以外の場合  
        <table>
          <tbody>
            <tr>
              <th className="label">name</th>
              <td>
                <input
                  type="text"
                  placeholder="your name."
                  onChange={this.doChangeName}
                  value={this.state.name_str}
                />
              </td>
            </tr>
            <tr>
              <th className="label">message</th>
              <td>
                <input
                  type="text"
                  size="40"
                  placeholder="type message..."
                  onChange={this.doChangeMsg}
                  value={this.state.msg_str}
                />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <button
                  onClick={this.doAction}
                >
                  Add
                </button>
              </td>
            </tr>
          </tbody>
        </table>
        }
      </div>
    )
  };
};

export default FireAdd;