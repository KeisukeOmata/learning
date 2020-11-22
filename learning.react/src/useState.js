import React, { useState } from "react";

export default function UseState() {
  // countというstateを定義
  // setCountというstateを更新する関数を定義
  // useStateフックは、stateとstateを更新する関数を返す
  // useStateフックで初期値を設定する count.hoge = 0, count.fuga = 0
  const [count, setCount] = useState({ hoge: 0, fuga: 0 });

  const hoge = () => {
    // 可変長引数
    setCount({ ...count, hoge: count.hoge + 1 });
  };

  const fuga = () => {
    // 可変長引数
    setCount({ ...count, fuga: count.fuga + 1 });
  };

  return (
    <>
      <p>hoge: {count.hoge}</p>
      <p>fuga: {count.fuga}</p>
      <button onClick={hoge}>hoge</button>
      <button onClick={fuga}>fuga</button>
    </>
  );
}
