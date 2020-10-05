import React, { Component } from 'react';
import ReactDOM from 'react-dom';

// Squareコンポーネント
class Square extends Component {
  // プロパティ
  x = 0;
  y = 0;
  width = 0;
  height = 0;
  color = "white";
  classStyle = {};

  // コンストラクタ
  // 引数はpropsに格納されている
  constructor(props){
    super();
    this.x = props.x;
    this.y = props.y;
    this.width = props.w;
    this.height = props.h;
    this.color = props.c;
    this.classStyle = {
      backgroundColor: this.color,
      position: "absolute",
      left: this.x + "px",
      top: this.y + "px",
      width: this.width + "px",
      height: this.height + "px"
    };
  };

  // コンポーネントクラスにはrenderが必須
  render() {
    return <div style={this.classStyle}></div>;
  };
};

export default Square;