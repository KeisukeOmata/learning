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
    return <div>
      {/* // Listコンポーネントにtitleとlistsプロパティを渡す */}
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
    // コンポーネントに渡されたプロパティはthis.propsで扱う
    let lists = this.props.lists;
    return (
      <div>
        {/* タイトルを描画 */}
        {/* コンポーネントに渡されたプロパティはthis.propsで扱う */}
        <p style={this.titleStyle}>{this.props.title}</p>
        <ul>
          {/* // Itemコンポーネントに配列を渡す */}
          {lists.map((item) =>
            // numをインクリメント
            // valueに展開した配列の値を渡す
            // Itemコンポーネントにnum, value, keyプロパティを渡す
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
  numStyle = {
    fontWeight: "bold",
    color: "blue"
  };

  // レンダー
  render(){
    return (
      <li style={this.listStyle}>
        {/* コンポーネントに渡されたプロパティはthis.propsで扱う */}
        <span style={this.numStyle}>[{this.props.num}]</span>
        {/* valueプロパティにはListコンポーネントの配列の値が入っている */}
        {this.props.value}
      </li>
    );
  }
};

export default ListComponent;