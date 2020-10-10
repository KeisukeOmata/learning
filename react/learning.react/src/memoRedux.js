import React, { Component } from 'react';
import { connect } from 'react-redux';
import Memo from './memo/memo';
import AddForm from './memo/addForm';
import FindForm from './memo/findForm';
import DelForm from './memo/delForm';
import PersistForm from './memo/persistForm';

// MemoReduxコンポーネント
class MemoRedux extends Component {
  tdStyle = {
    width: "250px"
  };

  constructor(props) {
    super(props);
  };

  render() {
    return (
      <div>
        <h1>Memo</h1>
        <AddForm />
        <table>
          <tbody>
            <tr>
              <td style={this.tdStyle}>
                <FindForm />
              </td>
              <td style={this.tdStyle}>
                <DelForm />
              </td>
              <td style={this.tdStyle}>
                <PersistForm />
              </td>
            </tr>
          </tbody>
        </table>
        <Memo />
      </div>
    );
  };
};

// ストアのコネクト
// コンポーネントにストアを接続する
// ストアの値は利用しないためconnect()
export default connect()(MemoRedux);