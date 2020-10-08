import React, { Component } from 'react';
import { connect } from 'react-redux';

// Itemコンポーネント
// テーブルの要素を作る
class Item extends Component {
  thStyle = {
    fontSize: "14pt",
    backgroundColor: "blue",
    color: "white",
    padding: "5px 10px",
    width: "50px"
  };
  tdStyle = {
    fontSize: "14pt",
    backgroundColor: "white",
    color: "darkblue",
    padding: "5px 10px",
    border: "1px solid lightblue",
    minWidth: "300px"
  };
  dateStyle = {
    fontSize: "14pt",
    backgroundColor: "white",
    color: "darkblue",
    padding: "5px 10px",
    border: "1px solid lightblue",
    width: "80px"
  };

  render(){
    let propsDate = this.props.value.created;
    let date = propsDate.getHours() + ':' + propsDate.getMinutes() + ':' + propsDate.getSeconds();
    
    return (
      <tr>
        <th style={this.thStyle}>
          {/* インデックス番号 */}
          No, {this.props.index}
        </th>
        <td style={this.tdStyle}>
          {/* メッセージ */}
          {this.props.value.message}
        </td>
        {/* 日時 */}
        <td style={this.dateStyle}>
          {date}
        </td>
    </tr>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// ストアの値は利用しないためconnect()
export default connect()(Item);