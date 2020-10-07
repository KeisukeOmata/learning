import React, { Component } from 'react';
import ReactDOM from 'react-dom';

// FormComponentコンポーネント
class FormComponent extends Component {
  // コンストラクタ
  constructor(props) {
    super(props);
    // バインドすることで、イベントからメソッドが実行できる
    this.alertMethod = this.alertMethod.bind(this);
  };

  // メソッド
  // Messageコンポーネントで行うalertMethodメソッド
  alertMethod(event) {
    alert(event.target.value + "は長すぎます。(最大10文字)");
  }

  // レンダー
  render() {
    return <div>
      {/* MessageコンポーネントにmaxlengthとonCheckを渡す */}
      <Message maxlength="10" onCheck={this.alertMethod} />
    </div>;
  };
};

// Messageコンポーネント
class Message extends Component {
  // フォームの入力値を持つ
  input = '';
  inputStyle = {
    fontSize: "12pt",
    padding: "5px"
  };

  // コンストラクタ
  constructor(props){
    super(props);
    // stateに変数を持たせる
    this.state = {
      title:'type your name:'
    };
    // バインドすることで、イベントからメソッドが実行できる
    this.submit = this.submit.bind(this);
    this.doCheck = this.doCheck.bind(this);
  };

  // フォームの入力値をstateにセットする
  submit(e) {
    // stateに値をセット
    this.setState({
      title: 'hello, ' + this.input + '!'
    });
    // 次にボタンが押下されるまでフォームが送信されない
    e.preventDefault();
  };

  // 入力値がMessageメソッド呼び出し時に渡されたmaxlength以上の長さであれば、
  // Messageメソッド呼び出し時に渡されたonCheck(alertMethodメソッド)を呼ぶ
  // そうでなければフォームの入力値を変数に代入する
  doCheck(e) {
    // maxlengthはMessageメソッド呼び出し時に渡される
    if (e.target.value.length > this.props.maxlength) {
      // this.props.onCheckで、Messageメソッド呼び出し時に渡されたonCheck(alertMethod)メソッドを呼ぶ
      this.props.onCheck(e);
    } else {
      // フォームの入力値を代入
      this.input = e.target.value;
    }
  };

  render() {
    // onChangeでdoCheckメソッドを呼ぶ
    return <div>
      {/* stateのtitleを表示 */}
      <h2>{this.state.title}</h2>
      {/* onSubmitでフォームが送信されるときのイベント処理を設定 */}
      <form onSubmit={this.submit}>
        <label>
          <span style={this.inputStyle}></span>title:
          <input
            type="text"
            style={this.inputStyle}
            // フォームに入力されたとき、doCheckメソッドを呼ぶ
            onChange={this.doCheck}
            // required patternで必須入力、正規表現のパターンを指定
            required pattern="[A-Za-z _,.]+"
            minlength="3"
          />
        </label>
        <input type="submit" style={this.inputStyle} value="Click" />
      </form>
    </div>
  };
};

export default FormComponent;