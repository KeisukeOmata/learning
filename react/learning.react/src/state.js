import React, { Component } from 'react';
import ReactDOM from 'react-dom';

class State extends Component {

  // // ボタンをクリックするとカウントアップ
  // stateStyle = {
  //   fontSize: "20pt",
  //   color: "#900",
  //   margin: "20px 0px",
  //   padding: "5px",
  //   borderBottom: "2px solid #900"
  // };
  // stateStyle2 = {
  //   fontSize: "20pt",
  //   color: "blue",
  //   margin: "20px 0px",
  //   padding: "5px",
  //   borderBottom: "2px solid #900"
  // };
  // stateBtnStyle = {
  //   fontSize:"20pt",
  //   padding:"0px 10px"
  // }

  // クリックすると四角形が描画される
  array = [];
  spaceStyle = {
    width:"600px",
    height:"600px",
    border:"1px solid red"
  }

    // コンストラクタ
    constructor(props) {
      super(props);
      // stateを初期化
      this.state = {
        // count: 0,
        // msg: "state",
        // flg: true,

        // 配列をstateに持たせる
        list: this.array
      };

      // 1秒毎に！を描画
      // let timer = setInterval(()=>{
      //   this.setState((state)=>({
      //     msg: state.msg + "!"
      //   }));
      // }, 1000);

      // バインドすることで、イベントからメソッドが実行できる
      this.clickAction = this.clickAction.bind(this);
  };
  
  // メソッド
  clickAction(e) {
    // // クリックする毎にstateをセットする
    // this.setState((state) => ({
    //   count: state.count + 1,
    //   msg: 'count: ' + state.count,
    //   // !state.flgで真偽値を切り替える
    //   flg: !state.flg
    // }));

    let x = e.pageX;
    let y = e.pageY;
    // 配列にx,yを追加
    this.array.push({ x: x, y: y });
    // クリックする毎に座標をstateの配列にセット
    this.setState({
      list: this.array
    });
  }

  // 描画される四角形のスタイルを設定
  draw(d) {
    let positionStyle = {
      position: "absolute",
        left: (d.x - 25) + "px",
        top: (d.y - 25) + "px",
        width: "50px",
        height: "50px",
        backgroundColor: "#66f3"
    };
    return <div style={positionStyle}></div>;
  };

  render() {
    return <div>
      {/* 三項演算子
      {this.state.flg ?
        // flgがtrueの場合
        <p style={this.stateStyle}>{this.state.msg}</p>
      :
        // flgがfalseの場合
        <p style={this.stateStyle2}>{this.state.msg}</p>
      }
      <button style={this.stateBtnStyle} onClick={this.clickAction}>Click</button> */}
      <div style={this.spaceStyle} onClick={this.clickAction}>
        {/* 配列の展開 */}
        {this.array.map((value) => this.draw(value))}
      </div>
    </div>
  }
};

export default State;