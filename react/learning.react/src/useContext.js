import React, { useState, useContext, createContext } from "react";

// コンテキストオブジェクトを作成
// function GreatGrandChildで読み込む
const MyContext = createContext();

export default function UseContext() {
  const [count, setCount] = useState(0);
  const value = {
    handleClick: () => setCount((count) => count + 1)
  };

  return (
    <div>
      <p>count: {count}</p>
      {/* Provider */}
      {/*valueプロパティの値を共有する。 */}
      <MyContext.Provider value={value}>
        <Child />
      </MyContext.Provider>
    </div>
  );
}

function Child() {
  return <GrandChild />;
}

function GrandChild() {
  return <GreatGrandChild />;
}

function GreatGrandChild() {
  // useContext
  // const Context オブジェクトの値 = useContext(Contextオブジェクト);
  // なぜ使うの？
  // Propdrilling問題(バケツリレー問題)を解消できるから
  // Providerからコンテキスト(valueプロパティの値)を取得する
  // Consumer(コンシューマ) => コンテキストから値を取得しているオブジェクト
  const context = useContext(MyContext);

  return (
    <>
      <p>{context.name}</p>
      <button onClick={context.handleClick}>increment</button>
    </>
  );
}

///////////////////////////////////////////////
// コンテキストの更新による不要な再レンダーを防ぐ方法//
///////////////////////////////////////////////

// 1.Contextオブジェクトを分割する
// // コンテキストオブジェクトを作成
// const CountStateContext = createContext();
// const CountDispatchContext = createContext();

// function countReducer(state, action) {
//   switch (action.type) {
//     case 'INCREMENT': {
//       return { count: state.count + 1 };
//     }
//     case 'DECREMENT': {
//       return { count: state.count - 1 };
//     }
//     default: {
//       return state;
//     }
//   }
// }

// function CountProvider({ children }) {
//   const [state, dispatch] = useReducer(countReducer, { count: 0 });
//   // CountStateContext.Providerのvalueが更新した場合、
//     // CountStateContextの値を取得している全てのコンシューマーが再レンダーされる
//   // CountDispatchContext.Providerのvalueが更新した場合、
//     //CountDispatchContextの値を取得している全てのコンシューマーが再レンダーされる
//   return (
//     <CountStateContext.Provider value={state}>
//       <CountDispatchContext.Provider value={dispatch}>
//         {children}
//       </CountDispatchContext.Provider>
//     </CountStateContext.Provider>
//   );
// }

// function Count() {
//   console.log('render Count');
//   // stateとdispatchを保持するContextオブジェクトが異なるので、dispatchが更新されてもこのコンポーネントは再レンダーされない
//   const state = useContext(CountStateContext);

//   return <h1>{state.count}</h1>;
// }

// function Counter() {
//   console.log('render Counter');
//   // stateとdispatchを保持するContextオブジェクトが異なるので、stateが更新されてもこのコンポーネントは再レンダーされない
//   const dispatch = useContext(CountDispatchContext);

//   return (
//     <>
//       <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
//       <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
//     </>
//   );
// }

// export default function App() {
//   return (
//     <CountProvider>
//       <Count />
//       <Counter />
//     </CountProvider>
//   );
// }

//////////////////////////////////////////////////////////////////////

// 2.React.memoを利用する
// // コンテキストオブジェクトを作成
// const CountContext = createContext();

// function countReducer(state, action) {
//   switch (action.type) {
//     case 'INCREMENT': {
//       return { count: state.count + 1 };
//     }
//     case 'DECREMENT': {
//       return { count: state.count - 1 };
//     }
//     default: {
//       return state;
//     }
//   }
// }

// function CountProvider({ children }) {
//   const [state, dispatch] = useReducer(countReducer, { count: 0 });
//   const value = {
//     state,
//     dispatch
//   };

//   return (
//     // value(stateかdispatchのどちらか)が更新したら、CountContext.Provider内のすべてのコンシューマーが再レンダーされる
//     <CountContext.Provider value={value}>{children}</CountContext.Provider>
//   );
// }

// function Count() {
//   console.log('render Count');
//   // CountContextからはstat のみを取得しているが、dispatchが更新されても再レンダーされる
//   const { state } = useContext(CountContext);

//   return <h1>{state.count}</h1>;
// }

// function Counter() {
//   console.log('render Counter');
//   // CountContextからはdispatchのみを取得しているが、stateが更新されても再レンダーされる
//   const { dispatch } = useContext(CountContext);

//   // CountContext.Providerのvalueの更新によるCounterコンポーネントの再レンダーは避けられない
//   // そのため、このコンポーネントはCountContextから値を取得するだけとして、メモ化したコンポーネントに取得したdispatchを渡すようにする
//   return <DispatchButton dispatch={dispatch} />;
// }

// // dispatchをPropsとして受け取るコンポーネントをメモ化し、不要な再レンダーを防ぐ
// const DispatchButton = React.memo(({ dispatch }) => {
//   console.log('render DispatchButton');

//   return (
//     <>
//       <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
//       <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
//     </>
//   );
// });

// export default function App() {
//   return (
//     <CountProvider>
//       <Count />
//       <Counter />
//     </CountProvider>
//   );
// }

//////////////////////////////////////////////////////////////////////

// 3.setMemoを利用する
// コンテキストオブジェクトを作成
// const CountContext = createContext();

// function countReducer(state, action) {
//   switch (action.type) {
//     case 'INCREMENT': {
//       return { count: state.count + 1 };
//     }
//     case 'DECREMENT': {
//       return { count: state.count - 1 };
//     }
//     default: {
//       return state;
//     }
//   }
// }

// function CountProvider({ children }) {
//   const [state, dispatch] = useReducer(countReducer, { count: 0 });
//   const value = {
//     state,
//     dispatch
//   };

//   return (
//     // value(stateかdispatchのどちらか)が更新したら、CountContext.Provider内のすべてのコンシューマーが再レンダーされる
//     <CountContext.Provider value={value}>{children}</CountContext.Provider>
//   );
// }

// function Count() {
//   console.log('render Count');
//   // CountContextからはstateのみを取得しているが、dispatchが更新されても再レンダーされる
//   const { state } = useContext(CountContext);

//   return <h1>{state.count}</h1>;
// }

// function Counter() {
//   console.log('render Counter');
//   // CountContextからはdispatchのみを取得しているが、stateが更新されても再レンダーされる
//   const { dispatch } = useContext(CountContext);

//   // CountContext.Providerのvalueの更新によるCounterコンポーネントの再レンダーは避けられない
//   // そのためdispatchを利用するレンダリング結果(計算結果)をメモ化し、不要な再レンダーを防ぐ
//   return useMemo(() => {
//     console.log('rerender Counter');
//     return (
//       <>
//         <button onClick={() => dispatch({ type: 'DECREMENT' })}>-</button>
//         <button onClick={() => dispatch({ type: 'INCREMENT' })}>+</button>
//       </>
//     );
//   }, [dispatch]);
// }

// export default function App() {
//   return (
//     <CountProvider>
//       <Count />
//       <Counter />
//     </CountProvider>
//   );
// }

//////////////////////////////////////////////////////////////////////

// useStateで行う場合

// export default function App() {
//   const [count, setCount] = useState(0);
//   const value = {
//     handleClick: () => setCount((count) => count + 1)
//   };

//   return (
//     <div>
//       <p>count: {count}</p>
//       <Child value={value} />
//     </div>
//   );
// }

// // Child コンポーネント自体はvalueを利用しないが、GrandChildコンポーネントにPropsとして渡すためにvalueを受け取る必要がある
// function Child({ value }) {
//   return <GrandChild value={value} />;
// }

// // GrandChild コンポーネント自体はvalueを利用しないが、GreatGrandChild コンポーネントにPropsとして渡すためにvalueを受け取る必要がある
// function GrandChild({ value }) {
//   return <GreatGrandChild value={value} />;
// }

// function GreatGrandChild({ value }) {
//   return (
//     <>
//       <p>{value.name}</p>
//       <button onClick={value.handleClick}>increment</button>
//     </>
//   );
// }
