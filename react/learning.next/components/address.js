import React, {Component} from 'react';
import { connect } from 'react-redux';
import Router from 'next/router';
import firebase from "firebase";
import Lib from '../static/address_lib';
import Account from '../components/account';

class Address extends Component {
  constructor(props) {
    super(props);
    // バインド
    this.logined = this.logined.bind(this);
  }

  // ログイン済みであればgetFireDataメソッドを呼ぶ
  logined() {
  // Firebaseからデータを取得
  this.getFireData();
  }

  // 未ログインであればリダイレクト
  logouted() {
    // 画面遷移
    Router.push('/address');
  }

  // Firebaseからデータを取得
  getFireData() {
    // emailが未定義かnullであればreturn
    if (this.props.email == undefined || this.props.email == '') {
      return;
    }
    // LibクラスのencodeEmailメソッド
    // emailを置換
    let email = Lib.encodeEmail(this.props.email);
    let db = firebase.database();
    let ref = db.ref('address/');
    let self = this;
    ref.orderByKey()
      // firebaseからstateに紐づくデータを取得
      .equalTo(email)
      .on('value', (snapshot) => {
        // LibクラスのencodeEmailメソッド
        // 取得結果をjsonで保持
        let firebaseData = Lib.deepcopy(snapshot.val());
        // ディスパッチ
        this.props.dispatch({
          // アクション
          type: 'UPDATE_USER',
          // 渡す値
          value: {
            login: this.props.login,
            username: this.props.username,
            email: this.props.email,
            data: firebaseData,
            items: self.getItem(firebaseData)
          }
        });
    });
  }

  // dataを元に表示項目を作成
  getItem(data) {
    if (data == undefined) {
      return;
    }
    let res = [];
    for (let i in data) {
      for(let j in data[i]) {
        let email = Lib.decodeEmail(j);
        let s = data[i][j]['name'];
        res.push(
          <li key={j} data-tag={email} onClick={this.go.bind(null, email)}>
            {data[i][j]['check'] == true ?
            <b>✓</b> : ''}{s} ({email})
          </li>
        );
      }
      break;
    }
    return res;
  }

  go(email) {
    // 画面遷移
    Router.push('/addressShow?email=' + email);
  }

  render(){
    return (
      <div>
        {/* アカウントコンポーネントにプロパティを渡す */}
        <Account onLogined={this.logined} onLogouted={this.logouted}/>
        <ul>
          {this.props.items == []
          ?
          <li key="0">no item.</li>
          :
          this.props.items
          }
        </ul>
      </div>
    )
  }
}

Address = connect((state) => state)(Address);
export default Address;