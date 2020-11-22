import React, {Component} from 'react'
import firebase from "firebase";
import "firebase/storage";

class SampleData extends Component {

  // firebaseのstate
  constructor(props) {
    super(props);
    this.state = {
      data: []
    };
    this.getFireData();
  };

  // Firebaseからのデータ取得
  getFireData() {
    let db = firebase.database();
    let ref = db.ref('sample/');
    let self = this;
    // orderByKey キーによって並べ替える
    // orderByValue 値によって並べ替える
    // orderByChile 引数に指定した子ノードによって並べ替える
    ref.orderByKey()
      // limitToFirst 引数で渡した数だけ最初から取得する
      // limitToLast 引数で渡した数だけ最後から取得する
      // equalTo 引数の値と等しいものを取得する
      // startAt 引数で指定した値のデータから取得する
      // endAt 引数で指定した値のデータまで取得する
      .limitToFirst(10)
      // valueはイベント名
      .on('value', (snapshot) => {
        // 取得した値をstateにセット
        self.setState({
          data: snapshot.val()
        });
    });
  };

  // データ表示の生成
  getTableData() {
    let result = [];
    // データが取得できない場合
    if (this.state.data == null || this.state.data.length == 0) {
      return [
        <tr key="0">
          <th>
            NO DATA.
          </th>
        </tr>
      ];
    };
    // 取得したデータでテーブルを作成する
    for(let i in this.state.data) {
      result.push(
        <tr key={i}>
          <th>
            {/* firebaseで作成したカラム  */}
            {this.state.data[i].ID}
          </th>
          <td>
            {this.state.data[i].name}
          </td>
          <td>{
            this.state.data[i].message}
          </td>
        </tr>
      );
    };
    return result;
  };

  render(){ 
    if (this.state.data.length == 0) {
      this.getFireData();
    };
    return (
      <table>
        <tbody>
          {this.getTableData()}
        </tbody>
      </table>
    );
  };
};

export default SampleData;