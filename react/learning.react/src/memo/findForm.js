import React, { Component } from 'react';
import { connect } from 'react-redux';
import { findMemo } from './store';

// FindFormコンポーネント
class FindForm extends Component {
  inputStyle = {
    fontSize: "14pt",
    color: "#006",
    padding: "0px",
  };
  btnStyle = {
    fontSize: "12pt",
    color: "#006",
    padding: "1px 10px",
  };

  constructor(props) {
    super(props);
    // stateの初期化
    this.state = {
      find: ''
    };

    // メソッドをバインド
    this.nowState = this.nowState.bind(this);
    this.click = this.click.bind(this);
  };

  nowState(e) {
    // stateをセット
    this.setState({
      find: e.target.value
    });
  };

  click(e) {
    // イベントの終了
    e.preventDefault();
    // findMemoはstore.jsで定義している
    let action = findMemo(this.state.find);
    // ディスパッチ
    // レデューサーにアクションを渡す
    this.props.dispatch(action);
  };

  render(){
    return (
      // submitでclickメソッドを呼ぶ
      <form onSubmit={this.click}>
        {/* テキストを入力するとnowStateメソッドを呼ぶ */}
        <input type="text" size="10" onChange={this.nowState} style={this.inputStyle} value={this.state.message} />
        <input type="submit" style={this.btnStyle} value="Find"/>
      </form>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// 引数のstateをそのまま返す
export default connect((state) => state)(FindForm);