import { createStore, applyMiddleware } from 'redux';
import thunkMiddleware from 'redux-thunk';

// ステート
const stateInit = {
  message: 'START',
  count: 0
};

// レデューサー
function counterReducer (state = stateInit, action) {
  switch (action.type) {
    case 'INCREMENT':
      return {
        message: 'INCREMENT',
        count: state.count + 1
      };
    case 'DECREMENT':
      return {
        message: 'DECREMENT',
        count: state.count - 1
      };
    case 'RESET':
      return {
        message: 'RESET',
        count: stateInit.count
      };
    default:
      return state;
  };
};

// initStore
// redux-store.jsで必要
export function initStore(state = stateInit) {
  // ストアの作成
  // レデューサー、ステート、ミドルウェアを渡す
  return createStore(counterReducer, state, applyMiddleware(thunkMiddleware))
};
