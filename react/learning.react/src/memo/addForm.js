import React, { Component } from 'react';
import { connect } from 'react-redux';
import { addMemo } from './store';

// AddFormコンポーネント
class AddForm extends Component {
  inputStyle = {
    fontSize: "16pt",
    color: "#006",
    padding: "1px",
    margin: "5px 0px"
  };
  btnStyle = {
    fontSize: "14pt",
    color: "#006",
    padding: "2px 10px"
  };

  constructor(props) {
    super(props);
    // stateの初期化
    this.state = {
      message: ''
    };
    // メソッドをバインド
    this.nowState = this.nowState.bind(this);
    this.click = this.click.bind(this);
  };

  nowState(e) {
    // stateをセット
    this.setState({
      message: e.target.value
    });
  };

  click(e) {
    // イベントの終了
    e.preventDefault();
    // addMemoはstore.jsで定義している
    let action = addMemo(this.state.message);
    // ディスパッチ
    // レデューサーにアクションを渡す
    this.props.dispatch(action);
    // stateをセット
    this.setState({
      message: ''
    });
  };

  render() {
    return (
      <div>
        <p style={this.message}>
          {this.props.message}
        </p>
        {/* submitでclickメソッドを呼ぶ */}
        <form onSubmit={this.click}>
          {/* テキストを入力するとnowStateメソッドを呼ぶ */}
          <input type="text" size="40" onChange={this.nowState} style={this.inputStyle} value={this.state.message} required />
          <input type="submit" style={this.btnStyle} value="Add"/>
        </form>
      </div>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// 引数のstateをそのまま返す
export default connect((state) => state)(AddForm);