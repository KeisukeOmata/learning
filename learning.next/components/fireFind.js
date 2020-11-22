import React, {Component} from 'react'
import firebase from "firebase";
import "firebase/storage";

class FireFind extends Component {
  textStyle = {
    borderBottom:"1px solid gray"
  }

  constructor(props) {
    super(props);
    this.state = {
      input:'',
      data:[]
    }
    this.doChange = this.doChange.bind(this);
    this.doAction = this.doAction.bind(this);
  }

  // stateにフォームの入力値を設定
  doChange(e) {
    this.setState({
      input: e.target.value
    })
  }

  // ボタンが押下されたときのstateをfindFireDataメソッドに渡す
  doAction() {
    this.findFireData(this.state.input);
  }

  findFireData(stateInput) {
    let db = firebase.database();
    let ref = db.ref('sample/');
    let self = this;
    ref.orderByKey()
      // keyがstate(フォームの入力値)を同じものを取得する
      .equalTo(stateInput)
      .on('value', (snapshot) => {
        self.setState({
          data:snapshot.val()
        });
    });
  }

  // 取得したデータでテーブルを作成
  getTableData() {
    let result = [];
    if (this.state.data == null || this.state.data.length == 0) {
      return [
        <tr key="0">
          <th>
            NO DATA.
          </th>
        </tr>];
    }
    for(let i in this.state.data) {
      result.push(
        <tr key={i}>
          <th>
            {this.state.data[i].ID}
          </th>
          <th>
            {this.state.data[i].name}
          </th>
          <td>{
            this.state.data[i].message}
          </td>
        </tr>
      );
    }
    return result;
  }

  render() {
    return (
      <div>
        <input
          type="text"
          onChange={this.doChange}
          style={this.textStyle}
          value={this.state.input}
        />
        <button
          onClick={this.doAction}
        >
          Find
        </button>
        <table>
          <tbody>
            {this.getTableData()}
          </tbody>
        </table>
      </div>
    );
  };
};

export default FireFind;