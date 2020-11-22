import React, { useState, useCallback, useMemo } from "react";

// React.memo(関数コンポーネント)
// コンポーネントのレンダー結果をメモ化し、再レンダーをスキップする
// props.stateが更新されない限り、再レンダーされない
// 関数コンポーネント内ではReact.memoは使えない => useMemoを使う
const Child = React.memo(({ handleClick }) => {
  console.log('render Child');
  return <button onClick={handleClick}>Child</button>;
});

export default function UseMemo() {
  console.log('render App');
  const [count, setCount] = useState(0);
  // useCallback(コールバック関数, 依存配列);
  // メモ化された関数を返すhooks
  // 依存配列が更新された場合、関数が再作成される
  // 依存配列が空の場合、関数は再作成されない
  // コールバック関数を受け取ったコンポーネントは再レンダーされてしまう(関数はコンポーネントが再レンダーされる度に再生成される)
  // React.memoでメモ化していなかったり、useCallbackでメモ化したコールバック関数を作成したコンポーネント自身で呼び出すと、再レンダーされてしまう
  const handleClick = useCallback(() => {
    console.log('click');
  // 依存配列が空の場合、関数は再作成されない
  // useCallbackを用いた場合、新しいhandleClickと前回のhandleClickが等価になるため、Childコンポーネントは再レンダーされない
  }, []);

  // 不要なループを実行しているため計算にかなりの時間がかかる。
  const [count1, setCount1] = useState(0);
  const [count2, setCount2] = useState(0);
  const double = count => {
    let i = 0;
    while (i < 1000000000) i++;
    return count * 2;
  };
  // useMemo(() => 値を計算するロジック, 依存している値);
  // メモ化された値を返すhooks
  // 関数コンポーネント内ではReact.memoは使えない => useMemoを使う
  // 依存している値が更新された場合、値を再計算する
  // count2を２倍にした値をメモ化する
  const doubledCount = useMemo(() => {
    double(count2)
  }, [count2]);

  // レンダー結果(計算結果)をメモ化する
  // count1が更新され、コンポーネントが再レンダーされたときはメモ化したレンダー結果を利用するため再レンダーされない
  // 第２引数にcount2を渡しているため、count2が更新された時だけ再レンダーされる
  const renderCounter = useMemo(() => {
    console.log("renderCounter");
    const renderDoubledCount = double(count2);
    return (
      <p>
        renderCounter: {count2}, {doubledCount}
      </p>
    );
  }, [count2]);

  return (
    <>
      {/* useCallbackを用いた場合、新しいhandleClickと前回のhandleClickが等価になるため、Childコンポーネントは再レンダーされない */}
      <h2>Increment(Childコンポーネントは再レンダーされない)</h2>
      <p>Counter: {count}</p>
      <button onClick={() => setCount(count + 1)}>Increment count</button>
      <Child handleClick={handleClick} />

    {/* count1が更新されコンポーネントが再レンダーされた時はメモ化した値を利用するため再計算されない */}
      <h2>Increment(メモ化した値を利用するため再計算されない)</h2>
      <p>Counter: {count1}</p>
      <button onClick={() => setCount1(count1 + 1)}>Increment(fast)</button>
    {/* 第２引数にcount2を渡しているため、値が再計算される */}
      <h2>Increment(count2を渡しているため、値が再計算される)</h2>
      <p>
        Counter: {count2}, {doubledCount}
      </p>
      <button onClick={() => setCount2(count2 + 1)}>Increment(slow)</button>

      {/* レンダー結果(計算結果)をメモ化する */}
      <h2>Increment(rendet結果をメモ化。count2を渡しているため、値が再計算される)</h2>
      {renderCounter}
      <button onClick={() => setCount2(count2 + 1)}>Increment count2</button>
    </>
  );
}

// Appコンポーネントが再レンダーされると、Childコンポーネントも再レンダーされる

// function Child({ count }) {
//   return <p>Child: {count}</p>;
// }

// export default function App() {
//   const [count1, setCount1] = useState(0);
//   const [count2, setCount2] = useState(0);

//   return (
//     <>
//       <button onClick={() => setCount1(count1 + 1)}>countup App count</button>
//       <button onClick={() => setCount2(count2 + 1)}>countup Child count</button>
//       <p>App: {count1}</p>
//       <Child count={count2} />
//     </>
//   );
// }