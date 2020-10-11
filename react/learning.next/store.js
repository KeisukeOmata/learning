import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';

// ステート
// const countState = {
//   text: 'START',
//   count: 0
// };

const calcState = {
  message: 'START',
  data: [],
  number: [],
  result: 0
};

// レデューサー
// function countReducer(state = countState, action) {
//   switch (action.type) {
//     case 'INCREMENT':
//       return {
//         text: 'INCREMENT',
//         count: state.count + 1,
//       };
//     case 'DECREMENT':
//       return {
//         text: 'DECREMENT',
//         count: state.count - 1
//       };
//     case 'ZERO':
//       return {
//         text: 'RESET',
//         count: countState.count
//       };
//     default:
//       return state;
//   };
// };

function calcReducer (state = calcState, action) {
  switch (action.type) {
    case 'ENTER':
      // 新たにstate配列を作成
      let newState = state.data.slice();
      let actionValue = action.value;
      // state配列の先頭に要素を追加
      newState.unshift(actionValue);
      // replaceで正規表現により数値を取り出す
      // 数字以外を空文字に変換
      let actionValueNum = actionValue.replace(/[^0-9]/g, "");
      // 新たにstate配列を作成
      let stateNumber = state.number.slice();
      // state配列の先頭に要素を追加
      stateNumber.unshift(actionValueNum);
      // * 1をすることで数値型であることを示す
      let result = (state.result * 1) + (actionValueNum * 1);
      return {
        message: 'ENTER',
        data: newState,
        number: stateNumber,
        result: result
      };
    // リセット
    case 'RESET':
      return {
        message: 'RESET',
        data: [],
        number: [],
        result: 0
      };
    default:
      return state;
  };
};

// initStore
// redux-store.jsで必要
export function initStore(state = calcState) {
  // ストアの作成
  // レデューサー、ステート、ミドルウェアを渡す
  return createStore(calcReducer, state, applyMiddleware(thunkMiddleware))
};
