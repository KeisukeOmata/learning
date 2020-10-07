import React, { Component } from 'react';
import ReactDOM from 'react-dom';

// childComponentコンポーネント
class ChildComponent extends Component {
  // コンストラクタ
  constructor(props) {
    super(props);
  };

  // レンダー
  render() {
    return <div>
      {/* Messageコンポーネントにタイトルプロパティを渡す */}
      <Message title="Children!">
        文章1。文章2。文章3。
      </Message>
    </div>;
  };
};

// Messageコンポーネント
class Message extends Component {
  listStyle = {
    fontSize: "16pt",
    color: "#06",
    margin: "0px",
    padding: "0px"
  };

  // レンダー
  render() {
    // this.props.childrenで子要素を代入
    let contents = this.props.children;
    // .splitで任意の文字で区切った配列にする
    let sentenceArray = contents.split('。');
    let sentenceArray2 = [];

    // .lengthで配列の要素数を取得
    for(let i = 0; i < sentenceArray.length; i++) {
      // .trimで文字列の両橋の空白を削除
      // 配列の要素が''でなければsentenceArray2に追加
      if(sentenceArray[i].trim() != '') {
        sentenceArray2.push(sentenceArray[i]);
      };
    };

    // .mapで配列を展開
    let lists = sentenceArray2.map((value,key) => (
      <li style={this.listStyle} key={key}>{value}.</li>)
    );

    // リターン
    return <div>
      {/* コンポーネントに渡されたプロパティはthis.propsで扱う */}
      <h2>{this.props.title}</h2>
      <ol>{lists}</ol>
    </div>;
  };
};

export default ChildComponent;