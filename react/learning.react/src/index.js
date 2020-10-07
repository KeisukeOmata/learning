import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
// redux
import ReduxSample from './reduxSample';
import { createStore, combineReducers } from 'redux';
import { Provider } from 'react-redux';
// コンポーネントクラス
import Square from './square';
import State from './state';
import ListComponent from './listComponent';
import ChildComponent from './childComponent';
import FormComponent from './formComponent';
import SentenceContext from './sentenceContext';

// ステートの作成
let countState = {
  counter: 0,
  text: "state"
};

// レデューサーの作成
// ストアのステートを変更する
// ステートとアクションを渡す
function countReducer(state = countState, action) {
  switch (action.type) {
    case 'up':
      return {
        counter: state.counter + 1,
        text: "up"
      };
    case 'down':
      return {
        counter: state.counter - 1,
        text: "down"
      };
    default:
      return state;
  };
};

// ストアを作成
// レデューサーを渡す
let countStore = createStore(countReducer);

// 表示をレンダリング
ReactDOM.render(
  // プロバイダー
  // ストアを他のコンポーネントに渡す
  <Provider store={countStore}>
    <ReduxSample />
  </Provider>,
  document.getElementById('reduxSample')
);

// コンポーネントクラス
ReactDOM.render(<App />, document.getElementById('root'));
ReactDOM.render(<Square x="100" y="100" w="100" h="100" c="cyan" />, document.getElementById('square1'));
ReactDOM.render(<Square x="150" y="150" w="100" h="100" c="magenta" />, document.getElementById('square2'));
ReactDOM.render(<State />, document.getElementById('state'));
ReactDOM.render(<ListComponent />, document.getElementById('listComponent'));
ReactDOM.render(<ChildComponent />, document.getElementById('childComponent'));
ReactDOM.render(<FormComponent />, document.getElementById('formComponent'));
ReactDOM.render(<SentenceContext />, document.getElementById('sentenceContext'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
