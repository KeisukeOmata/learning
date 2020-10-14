import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import App from './App';
import * as serviceWorker from './serviceWorker';
// hooks
import Hooks from './hooks';
// redux
import ReduxSample from './reduxSample';
import MemoRedux from './memoRedux';
// import MemoStore from './memo/store';
import { createStore, combineReducers } from 'redux';
import { Provider } from 'react-redux';
// データの永続化
import MemoStore, { memoReducer } from './memo/store';
import { persistStore, persistReducer } from 'redux-persist';
import storage from 'redux-persist/lib/storage';
import { PersistGate } from 'redux-persist/integration/react';
// コンポーネントクラス
import Square from './square';
import State from './state';
import ListComponent from './listComponent';
import ChildComponent from './childComponent';
import FormComponent from './formComponent';
import SentenceContext from './sentenceContext';

// hooks
ReactDOM.render(<Hooks />, document.getElementById('hooks'));

// パーシストの設定
const persistConfig = {
  key: 'memo',
  storage: storage,
  // stateの永続化するデータを設定
  blacklist: ['message', 'mode', 'fdate'],
  whitelist: ['data']
};

// パーシストレデューサーの作成
// パーシストの設定とレデューサーを渡す
// レデューサーはstore.jsで作成したものをmemoReducerとしてimportしている
const persistedReducer = persistReducer(persistConfig, memoReducer);

// ストアの作成
// パーシストレデューサーを渡す
let store = createStore(persistedReducer);
// パーシスター(パーシストストア)の作成
// 永続化されたストア
// ストアを渡す
let persistorStore = persistStore(store);

// 表示をレンダリング
ReactDOM.render(
  // プロバイダー
  // ストアを他のコンポーネントに渡す
  <Provider store={store}>
    {/* パーシストゲート */}
    {/* ローディングが完了してからコンポーネントを表示する */}
    {/* 値のローディング中の表示と、パーシスターを渡す */}
    <PersistGate loading={<p>loading...</p>} persistor={persistorStore}>
      <MemoRedux />
    </PersistGate>
  </Provider>,
  document.getElementById('memo')
);

export default persistorStore;

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
ReactDOM.render(<Square x="600" y="100" w="100" h="100" c="cyan" />, document.getElementById('square1'));
ReactDOM.render(<Square x="650" y="150" w="100" h="100" c="magenta" />, document.getElementById('square2'));
ReactDOM.render(<State />, document.getElementById('state'));
ReactDOM.render(<ListComponent />, document.getElementById('listComponent'));
ReactDOM.render(<ChildComponent />, document.getElementById('childComponent'));
ReactDOM.render(<FormComponent />, document.getElementById('formComponent'));
ReactDOM.render(<SentenceContext />, document.getElementById('sentenceContext'));

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();
