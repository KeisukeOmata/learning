import React, { useState, useEffect, useRef } from 'react';

export default function UseRef() {
  const [count, setCount] = useState(0);
  // const refオブジェクト = useRef(初期値)
  // stateを更新してもコンポーネントが再レンダーされない
  // レンダーに関係ないstateを扱いたい時に使う
  const isInitialRender = useRef(true);

  useEffect(() => {
    if (isInitialRender.current) {
      // コンポーネントのレンダー後に副作用が呼ばれるが、refオブジェクトが更新されてもコンポーネントは再レンダーされない
      isInitialRender.current = false;
    }
  });

  // refオブジェクトでDOMを参照する場合、HTML要素のref属性に指定する
  const inputEl = useRef(null);
  const onClick = () => {
    if (!inputEl.current) return;
    inputEl.current.focus();
  };


  return (
    <>
      {/* stateが更新されるので再レンダーされる */}
      <p>{isInitialRender.current ? "初回レンダー" : "再レンダー"}</p>
      <p>count: {count}</p>
      <button onClick={() => setCount(count + 1)}>+</button>
      <br></br>
      {/* refオブジェクトでDOMを参照する場合、HTML要素のref属性に指定する */}
      <input ref={inputEl} type="text" />
      <button onClick={onClick}>input要素をフォーカスする</button>
    </>
  );
}
