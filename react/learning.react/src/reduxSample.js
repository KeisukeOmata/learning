import React, { Component } from 'react';
import { connect } from 'react-redux';

// ステートのマッピング
function mappingState(state) {
  return state;
};

// ReduxSampleコンポーネント
class ReduxSample extends Component {
  constructor(props) {
    super(props);
  };

  render() {
    return (
      <div>
        <Message />
        <Button />
      </div>
    );
  };
};

// メッセージコンポーネント
class Message extends Component {
  messageStyle = {
    fontSize: "20pt",
    padding: "20px 5px"
  };

  render(){
    return (
      <p style={this.messageStyle}>
        {this.props.text}: {this.props.counter}
      </p>
    );
  };
};

// コネクト
// コンポーネントにストアを接続する
// コネクトで渡されたステートはthis.propsで利用できる
Message = connect(mappingState)(Message);

// Buttonコンポーネント
class Button extends Component {
  buttonStyle = {
    fontSize: "16pt",
    padding: "5px 10px"
  };

  constructor(props){
    super(props);
    // アクションをメソッドにバインド
    this.clickButton = this.clickButton.bind(this);
  };

  clickButton(e){
    if (e.shiftKey) {
      // ディスパッチ
      // レデューサーにアクションを渡す
      this.props.dispatch({ type:'down' });
    } else {
      this.props.dispatch({ type:'up' });
    }
  }

  render(){
    return (
      <button style={this.buttonStyle} onClick={this.clickButton}>
        click
      </button>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
Button = connect()(Button);

export default ReduxSample;
