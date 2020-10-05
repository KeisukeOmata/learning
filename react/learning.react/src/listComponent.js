import React, { Component } from 'react';
import ReactDOM from 'react-dom';

// ListComponentコンポーネント
class ListComponent extends Component {
  lists = [
    "本文1",
    "本文2",
    "本文3"
  ];

  // 初期化
  constructor(props){
    super(props);
    this.state = {
      // stateに配列を持たせる
      list: this.lists
    };
  }

  // レンダー
  render() {
    // Listコンポーネントにタイトルと配列を渡す
    return <div>
      <List title="タイトル" lists={this.lists} />
    </div>;
  }
}

// Listコンポーネント
class List extends Component {
  num = 1;

  titleStyle = {
    fontSize:"15pt",
    fontWeight:"bold",
    color:"red",
  };

  // レンダー
  render() {
    let lists = this.props.lists;
    return (
      <div>
        {/* タイトルを描画 */}
        <p style={this.titleStyle}>{this.props.title}</p>
        <ul>
          {/* // Itemコンポーネントに配列を渡す */}
          {lists.map((item) =>
            // numをインクリメント
            // valueに展開した配列の値を渡す
            <Item num={this.num++} value={item} key={this.num} />
          )}
        </ul>
      </div>
    );
  }
}

// Itemコンポーネント
class Item extends Component {
  listStyle = {
    listStyleType: "square",
    fontSize: "15pt",
    color: "#06",
    margin: "0px",
    padding: "0px",
  };
  num = {
    fontWeight: "bold",
    color: "blue"
  };

  // レンダー
  render(){
    return (
      <li style={this.listStyle}>
        <span style={this.num}>[{this.props.num}]</span>
        {/* valueにはListコンポーネントの配列の値が入っている */}
        {this.props.value}
      </li>
    );
  }
};

export default ListComponent;