import React, {Component} from 'react'
import { connect } from 'react-redux'

class Calc extends Component {
  calcStyle = {
    fontSize:"12pt",
    padding:"5px 10px"
  }

  constructor(props) {
    super(props);
    // stateの初期化
    this.state = {
      input: '',
    };
    // アクションをメソッドにバインド
    this.onChange = this.onChange.bind(this);
    this.onKeyPress = this.onKeyPress.bind(this);
    this.doAction = this.doAction.bind(this);
    this.reset = this.reset.bind(this);
  }

  // stateにテキストフィールドの値をセット
  onChange(e) {
    // stateをセット
    this.setState({
      input: e.target.value
    });
    e.preventDefault();
  };

  // エンター(keyCode == 13)が押下されたときdoActionメソッドを呼ぶ
  onKeyPress(e) {
    if (e.key == 'Enter') {
      this.doAction(e);
    };
  };

  doAction(e) {
    // stateをセット
    this.setState({
      input: '',
    });
    // ディスパッチ
    // レデューサーにアクションを渡す
    return this.props.dispatch({
      type: 'ENTER',
      value: this.state.input
    });
  };

  reset() {
    // stateをセット
    this.setState({
      input: '',
    });
    // ディスパッチ
    // レデューサーにアクションを渡す
    return this.props.dispatch({ type:'RESET' });
  }

  render () {
    let result = [];
    let dataLength = this.props.data.length;
    for(let i = 0; i < dataLength; i++) {
      result.push(
        <tr key={i}>
          <th>
            {this.props.data[i]}
          </th>
          <td>
            {this.props.number[i]}
          </td>
        </tr>
      );
    };
    return (
      <div>
        <p>
          TOTAL: {this.props.result}
        </p>
        <input
          type="text"
          style={this.calcStyle}
          size="40"
          value={this.state.input}
          // テキストフィールドに入力されるとonChangeメソッドを呼ぶ
          onChange={this.onChange}
          // キーが押下されるとonKeyPressメソッドを呼ぶ
          onKeyPress={this.onKeyPress}
        />
        <button
          style={this.calcStyle}
          onClick={this.doAction}
        >
          Enter
        </button>
        <button
          style={this.calcStyle}
          onClick={this.reset}
        >
          Reset
        </button>
        <table>
          <tbody>
            {result}
          </tbody>
        </table>
        <p>
          {this.props.message}
        </p>
      </div>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// 引数のstateをそのまま返す
Calc = connect((state) => state)(Calc);
export default Calc;
