import React, { Component } from 'react';
import { connect } from 'react-redux';
import Item from './item';

// Memoコンポーネント
// tableを作りItemコンポーネントにtableの要素を作るプロパティを渡す
class Memo extends Component {
  render(){
    let data;
    let n = 0;

    // stateのmodeによって画面を出し分ける
    switch (this.props.mode) {
      // mode: add
      case 'default':
        data = this.props.data.map((value) => (
          // Itemコンポーネントにプロパティを渡す
          <Item key={value.message} value={value} index={n++} />
        ));
        break;
      case 'find':
        data = this.props.fdata.map((value) => (
          <Item key={value.message} value={value} index={n++}/>
        ));
        break;
      case 'delete':
        data = this.props.data.map((value) => (
          <Item key={value.message} value={value} index={n++} />
        ));
        break;
      default:
        data = this.props.data.map((value) => (
          <Item key={value.message} value={value} index={n++} />
        ));
    };

    return (
      <table>
        <tbody>
          {data}
        </tbody>
      </table>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// 引数のstateをそのまま返す
export default connect((state) => state)(Memo);