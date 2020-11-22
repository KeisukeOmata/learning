import React, { Component } from 'react';
import { connect } from 'react-redux';
import { deleteMemo } from './store';

// DelFormコンポーネント
class DelForm extends Component {
  inputStyle = {
    fontSize: "12pt",
    color: "#006",
    padding: "1px",
    margin: "5px 0px"
  };
  btnStyle = {
    fontSize: "10pt",
    color: "#006",
    padding: "2px 10px"
  };

  constructor(props) {
    super(props);
    // stateの初期化
    this.state = {
      number: 0
    };
    // メソッドをバインド
    this.nowState = this.nowState.bind(this);
    this.click = this.click.bind(this);
  };

  nowState(e) {
    // stateをセット
    this.setState({
      number: e.target.value
    });
  };

  click(e) {
    // イベントの終了
    e.preventDefault();
    // deleteMemoはstore.jsで定義している
    let action = deleteMemo(this.state.number);
    // ディスパッチ
    // レデューサーにアクションを渡す
    this.props.dispatch(action);
    // stateをセット
    this.setState({
      number: 0
    });
  };

  render(){
    let n = 0;
    // プルダウンに表示する配列
    let items = this.props.data.map((value) => (
      // selectタグの要素なのでoption
      <option key={n} value={n++}>
        {/* substringで10文字目までを返す */}
        {value.message.substring(0, 10)}
      </option>
    ));

    return (
      <div>
        {/* submitでclickメソッドを呼ぶ */}
        <form onSubmit={this.click}>
          {/* プルダウンの表示でnowStateメソッドを呼ぶ */}
          <select onChange={this.nowState} defaultValue="-1" style={this.inputStyle}>
            {items}
          </select>
          <input type="submit" style={this.btnStyle} value="Del"/>
        </form>
      </div>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// 引数のstateをそのまま返す
export default connect((state) => state)(DelForm);