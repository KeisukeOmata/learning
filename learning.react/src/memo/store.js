import { createStore } from 'redux';

// ステートの作成
const initState = {
  data: [],
  message: 'メッセージを入力してください:',
  mode: 'default',
  fdata: []
};

// レデューサーの作成
// ストアのステートを変更する
// ステートとアクションを渡す
export function memoReducer(state = initState, action) {
  switch (action.type) {
    case 'ADD':
      // アクションがADDの場合、addReduceを呼ぶ
      return addReduce(state, action);
    case 'DELETE':
      // アクションがDELETEの場合、deleteReduceを呼ぶ
      return deleteReduce(state, action);
    case 'FIND':
      // アクションがFINDの場合、findReduceを呼ぶ
      return findReduce(state, action);
    default:
      return state;
  };
};

// レデュースアクション
// メモ追加
function addReduce(state, action) {
  let newDate = new Date();
  // Dateオブジェクトを保存できるように文字列に変換する
  let getDate = newDate.getHours() + ':' + newDate.getMinutes() + ':' + newDate.getSeconds();
  let data = {
    message: action.message,
    created: getDate
  };
  // slice()でstateを配列として作成し直す
  // state.dataを更新して返しても反映されない
  let newdata = state.data.slice();
  // unshiftで配列の最初に追加する
  newdata.unshift(data);
  // 新しいstateをリターンする
  return {
    data: newdata,
    message: 'Added!',
    mode: 'default',
    fdata: []
  };
}

// レデュースアクション
// メモ検索
function findReduce(state, action) {
  let f = action.find;
  let fdata = [];
  state.data.forEach((value) => {
    if (value.message.indexOf(f) >= 0) {
      // 配列の最後に追加する
      // state.dataを更新して返しても反映されない
      fdata.push(value);
    };
  });
  // 新しいstateをリターンする
  return {
    data: state.data,
    message: 'find "' + f + '":',
    mode: 'find',
    fdata: fdata
  };
};

// レデュースアクション
// メモ削除
function deleteReduce(state, action) {
  // slice()でstateを配列として作成し直す
  // state.dataを更新して返しても反映されない
  let newdata = state.data.slice();
  // spliceで配列の内容(action.indexを1に)を置き換える
  newdata.splice(action.index, 1);
  // 新しいstateをリターンする
  return {
    data: newdata,
    message: 'delete "' + action.index + '":',
    mode: 'delete',
    fdata: []
  };
};

// アクションクリエーター
// ディスパッチの引数として渡されるアクション
// メモ追加
export function addMemo(text) {
  return {
    type: 'ADD',
    message: text
  };
};

// アクションクリエーター
// ディスパッチの引数として渡されるアクション
// メモ検索
export function findMemo(text) {
  return {
    type: 'FIND',
    find: text
  };
};

// アクションクリエーター
// ディスパッチの引数として渡されるアクション
// メモ削除
export function deleteMemo(num) {
  return {
    type: 'DELETE',
    index: num
  };
};

// ストアを作成してエクスポート
// ストア名は呼び出し側で付ける
export default createStore(memoReducer);
