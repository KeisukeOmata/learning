import React, {Component} from 'react'
import firebase from "firebase";
// 画面遷移
import Router from 'next/router';
import "firebase/storage";

class FireDel extends Component {

  constructor(props) {
    super(props);
    this.state = {
      id_str:'',
    }
    this.doChange = this.doChange.bind(this);
    this.doAction = this.doAction.bind(this);
  }

  doChange(e){
    this.setState({
      // 削除するIDをstateに設定
      id_str: e.target.value
    })
  }

  doAction() {
    // 削除処理を呼ぶ
    this.deleteFireData();
    // 画面遷移
    Router.push('/fire');
  }

  // 削除処理
  deleteFireData(){
    let id = this.state.id_str;
    let db = firebase.database();
    let ref = db.ref('sample/' + id);
    // データの削除
    ref.remove();
  }

  // レンダリング
  render(){
    return (
      <div>
        <table>
          <tbody>
            <tr>
              <th className="label">ID:</th>
              <td>
                <input
                  type="text"
                  placeholder="delete ID:"
                  onChange={this.doChange}
                  value={this.state.id_str}
                />
              </td>
            </tr>
            <tr>
              <th></th>
              <td>
                <button
                  onClick={this.doAction}
                >
                  Delete
                </button>
              </td>
            </tr>
          </tbody>
        </table>
      </div>
    )
  }
}

export default FireDel;