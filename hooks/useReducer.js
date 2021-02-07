import React, { useReducer } from 'react';

//////////////////////////////
// state
// count: 0
//////////////////////////////

// リデューサー
// stateとactionを受け取り、actionに応じて更新したstateを返す関数
// stateの更新ロジックをリデューサーに集約する
function reducer(state, action) {
  switch (action.type) {
    case 'INCEREMENT':
      return { count: state.count + 1 };
    case 'DECREMENT':
      return { count: state.count - 1 };
    case 'RESET':
      return { count: 0 };
    default:
      return state;
  }
}

// ディスパッチ
// Counterコンポーネントをメモ化
// ディスパッチ関数は変化しないため、state.countを更新してUseReducerコンポーネントを再レンダーしても、Counterコンポーネントは再レンダーされない
const Counter = React.memo(({ dispatch }) => {
  console.log('render Counter');
  return (
    <>
      <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
      <button onClick={() => dispatch({ type: 'INCEREMENT' })}>+</button>
      <button onClick={() => dispatch({ type: 'RESET' })}>reset</button>
    </>
  );
});

export default function UseReducer() {
  // const [state, dispatch] = useReducer(reducer, stateの初期値);
  // いつ使うの?
  // stateを更新するために、別のstateを参照する必要があるとき
  // stateを更新したら、別のstateも一緒に更新する必要があるとき
  // stateを更新するロジックが複雑であるとき
  const [state, dispatch] = useReducer(reducer, { count: 0 });

  return (
    <>
      <p>Count: {state.count}</p>
      <Counter dispatch={dispatch} />
    </>
  );
}

// useStateとの使い分け

// import React, { useState, useCallback } from 'react';

// const Counter = React.memo(({ decrement, increment, reset }) => {
//   console.log('render Counter');
//   return (
//     <>
//       <button onClick={decrement}>-</button>
//       <button onClick={increment}>+</button>
//       <button onClick={reset}>reset</button>
//     </>
//   );
// });

// export default function App() {
//   const [count, setCount] = useState(0);

//   const decrement = useCallback(() => {
//     setCount(currentCount => currentCount - 1);
//   }, [setCount]);

//   const increment = useCallback(() => {
//     setCount(currentCount => currentCount + 1);
//   }, [setCount]);

//   const reset = useCallback(() => {
//     setCount(() => 0);
//   }, [setCount]);

//   return (
//     <>
//       <p>Count: {count}</p>
//       <Counter decrement={decrement} increment={increment} reset={reset} />
//     </>
//   );
// }
