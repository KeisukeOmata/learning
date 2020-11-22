import React, { Component } from 'react';
import { connect } from 'react-redux';
// パーシストストアをimport
import persistorStore from '../index';

class PersistForm extends Component {
  checkStyle = {
    margin: "5px 0px"
  };
  labelStyle = {
    fontSize: "12pt",
    color: "#006",
    padding: "2px 10px"
  };

  constructor(props) {
    super(props);
    // ステイトの初期化
    this.state = {
      check:'on',
    }
    // アクションにメソッドをバインド
    this.doChange = this.doChange.bind(this);
  };

  doChange(e){
    let nowCheck = e.target.checked;
    // ステイトをセット
    this.setState({
      // 三項演算子
      // nowCheckに値が入っていれば'on'を代入
      check: nowCheck ? 'on' : ''
    });

    if (nowCheck) {
      // 永続化処理を再開
      persistorStore.persist();
      // 保留中の処理を反映させ最新にする
      persistorStore.flush();
    } else {
      // 永続化を停止する
      persistorStore.pause();
      // 保存されているデータを削除
      persistorStore.purge();
    }
  }

  render() {
    return (
      <div>
        <label style={this.labelStyle}>
          <input
            type="checkbox"
            id="check"
            size="40"
            onChange={this.doChange}
            style={this.checkStyle}
            checked={this.state.check}
          />
          Persist
        </label>
      </div>
    );
  };
};

export default connect((state)=>state)(PersistForm);
