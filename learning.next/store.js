import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';
import firebase from "firebase";

// Firebaseの初期化
var config = {
  // 環境変数の読み込み
  apiKey: process.env.REACT_APP_apiKey,
  authDomain: process.env.REACT_APP_authDomain,
  databaseURL: "https://react-39d75.firebaseio.com",
  projectId: process.env.REACT_APP_projectId,
  storageBucket: process.env.REACT_APP_storageBucket,
  messagingSenderId: process.env.REACT_APP_messagingSenderId,
  appId: process.env.REACT_APP_appId,
  measurementId: process.env.REACT_APP_measurementId
};

// Firebase初期化
var fireapp;
try {
  fireapp = firebase.initializeApp(config);
} catch (error) {
  console.log(error.message);
}
export default fireapp;

// ステート初期化
const initial = {
  login: false,
  username: '(click here!)',
  email: '',
  data: [],
  items: []
}

// レデューサー
function fireReducer(state = intitial, action) {
  switch (action.type) {
    case 'UPDATE_USER':
      // アクションのvalueをそのまま返す
      return action.value;
    default:
      return state;
  }
}

// initStore
// redux-store.jsで必要
export function initStore(state = initial) {
  // ストアの作成
  // レデューサー、ステート、ミドルウェアを渡す
  return createStore(fireReducer, state, applyMiddleware(thunkMiddleware))
}

// ステート
// const countState = {
//   text: 'START',
//   count: 0
// };

// const calcState = {
//   message: 'START',
//   data: [],
//   number: [],
//   result: 0
// };

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

// function calcReducer (state = calcState, action) {
//   switch (action.type) {
//     case 'ENTER':
//       // 新たにstate配列を作成
//       let newState = state.data.slice();
//       let actionValue = action.value;
//       // state配列の先頭に要素を追加
//       newState.unshift(actionValue);
//       // replaceで正規表現により数値を取り出す
//       // 数字以外を空文字に変換
//       let actionValueNum = actionValue.replace(/[^0-9]/g, "");
//       // 新たにstate配列を作成
//       let stateNumber = state.number.slice();
//       // state配列の先頭に要素を追加
//       stateNumber.unshift(actionValueNum);
//       // * 1をすることで数値型であることを示す
//       let result = (state.result * 1) + (actionValueNum * 1);
//       return {
//         message: 'ENTER',
//         data: newState,
//         number: stateNumber,
//         result: result
//       };
//     // リセット
//     case 'RESET':
//       return {
//         message: 'RESET',
//         data: [],
//         number: [],
//         result: 0
//       };
//     default:
//       return state;
//   };
// };

// // initStore
// // redux-store.jsで必要
// export function initStore(state = calcState) {
//   // ストアの作成
//   // レデューサー、ステート、ミドルウェアを渡す
//   return createStore(calcReducer, state, applyMiddleware(thunkMiddleware))
// };
