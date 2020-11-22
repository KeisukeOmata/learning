import React, { Component } from 'react';

let data = {
  title: 'タイトル',
  body: '本文',
  // テーマで出し分ける
  // this.context.light
  light:{
    backgroundColor:"#eef",
    color:"#006",
    padding:"10px",
  },
  // this.context.dark
  dark:{
    backgroundColor:"#006",
    color:"#eef",
    padding:"10px",
  }
};

// コンテキスト
const SampleContext = React.createContext(data);

// SentenceContextコンポーネント
class SentenceContext extends Component {
  data1 = {
    title: 'タイトル1',
    body: '本文1'
  };
  
  // レンダー
  render() {
    return <div>
      <Title />
      <Body />
      {/* Context.Providerでスコープ内におけるコンテキストを上書きできる */}
      <SampleContext.Provider value={this.data1}>
        <Title />
        <Body />
      </SampleContext.Provider>
    </div>;
  };
}

// Titleコンポーネント
class Title extends Component {
  // コンテキスト
  static contextType = SampleContext;

  render() {
    // テーマでstyleを出し分ける
    return <div style={this.context.light}>
      <h2>{this.context.title}</h2>
    </div>;
  }
}

// Bodyコンポーネント
class Body extends Component {
  // コンテキスト
  static contextType = SampleContext;

  render() {
    // テーマでstyleを出し分ける
    return <div style={this.context.dark}>
      <p>{this.context.body}</p>
    </div>;
  }
}

export default SentenceContext;