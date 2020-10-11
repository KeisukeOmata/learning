import React, {Component} from 'react';
import { connect } from 'react-redux';

class Counter extends Component {
  counterStyle = {
    fontSize: "12pt",
    padding: "5px 15px",
    margin: "10px"
  };

  constructor(props) {
    super(props);
    // アクションにメソッドをバインド
    this.doAction = this.doAction.bind(this);
    this.reset = this.reset.bind(this);
  };

  doAction(e){
    if (e.shiftKey) {
      // ディスパッチ
      // レデューサーにアクションを渡す
      return this.props.dispatch({ type:'DECREMENT' });
    } else {
      return this.props.dispatch({ type:'INCREMENT' });
    };
  };

  reset() {
    return this.props.dispatch({ type:'ZERO' });
  };

  render() {
    return (
      <div>
        <p>
          {this.props.text}: {this.props.count}
        </p>
        <button
          style={this.counterStyle}
          onClick={this.doAction}
        >
          Count
        </button>
        <button
          style={this.counterStyle}
          onClick={this.reset}
        >
          Reset
        </button>
      </div>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// 引数のstateをそのまま返す
Counter = connect((state) => state)(Counter);
export default Counter;
