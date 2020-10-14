import React, { useState } from "react";

export default function Hooks() {
  // countというstateを定義
  // setCountというstateを更新する関数を定義
  // useStateフックは、stateとstateを更新する関数を返す
  const [count, setCount] = useState(10);

  const decrement = () => {
    setCount(count - 1);
  };

  const increment = () => {
    setCount(count + 1);
  };

  return (
    <>
      <p>Count: {count}</p>
      <button onClick={decrement}>-</button>
      <button onClick={increment}>+</button>
    </>
  );
}
