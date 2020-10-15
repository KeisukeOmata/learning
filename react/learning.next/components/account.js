import React, {Component} from 'react';
import { connect } from 'react-redux';
import firebase from "firebase";

class Account extends Component {
  
  constructor(props) {
    super(props);
    // バインド
    this.login_check = this.login_check.bind(this);
  }

  // ログイン処理
  login() {
    // firebaseでログイン
    let provider = new firebase.auth.GoogleAuthProvider();
    var self = this;
    firebase.auth().signInWithPopup(provider)
      .then((result) => {
        // ディスパッチ
        this.props.dispatch({
          // アクションのタイプ
          type: 'UPDATE_USER',
          // 渡す値
          value: {
            login: true,
            username: result.user.displayName,
            email: result.user.email,
            data: this.props.data,
            items: this.props.items
          }
        });
        // 呼び出し元で渡されるonLoginedプロパティ
        this.props.onLogined();
    });
  }

  // ログアウト処理
  logout(){
    console.log("logout");
    // farebaseでログアウト
    firebase.auth().signOut();
    // ディスパッチ
    this.props.dispatch({
      // アクションの値
      type: 'UPDATE_USER',
      // 渡す値
      value: {
        login: false,
        username: '(click here!)',
        email: '',
        data: [],
        items: []
      }
    });
    // 呼び出し元で渡されるonLogoutedプロパティ
    this.props.onLogouted();
  }

  // login,loguoutのチェック
  login_check() {
    // stateが未ログインであればログイン処理を呼ぶ
    if (this.props.login == false) {
        this.login();
    } else {
      // stateがログイン済みであればログアウト処理を呼ぶ
      this.logout();
    }
  }

  // レンダリング
  render() {
    return (
      <p className="login">
        <span className="account" onClick={this.login_check}>
          LOGINED: {this.props.username}
        </span>
      </p>
    );
  }
}

Account = connect((state) => state)(Account);
export default Account;