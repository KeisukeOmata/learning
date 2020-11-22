import React, { useState, useEffect } from "react";
// HTTP 通信をするモジュール
// 外部 API などと通信する時に利用する
import axios from "axios";

export default function UseEffect() {
  // APIから取得したデータ
  const [items, setItems] = useState([]);
  // 入力欄に入力した値
  const [inputValue, setInputValue] = useState("react");
  // APIへのリクエスト時に付与するパラメータ
  const [query, setQuery] = useState(inputValue);
  // ローディング状態
  const [isLoading, setIsLoading] = useState(false);

  // useEffect(副作用, 依存配列)
  // コンポーネントのレンダー後かアンマウント(コンポーネントをDOMから削除)後に、副作用を実行する
  // 副作用 => DOMの変更, API通信, 非同期処理, console.logなど
  useEffect(() => {
    const fetchData = async () => {
      setIsLoading(true);

      const result = await axios(
        "https://hn.algolia.com/api/v1/search?query=react"
      );

      setItems(result.data.hits);
      setIsLoading(false);
    };

    fetchData();

    // クリーンアップ関数
    // 副作用内で関数を返すと、コンポーネントがアンマウントするか副作用が実行される度に呼ばれる
    return () => {
      console.log("クリーンアップ");
    }
  // 依存配列を省略すると、コンポーネントがレンダー、アンマウントされる度に副作用を実行する
  // 依存配列を渡すと、その値が更新されたときだけ副作用を実行する
  // 依存配列に [] を渡すと、コンポーネントがレンダー、アンマウントされたときに1度だけ副作用を実行する
  // コンポーネントのレンダー後、state:queryが更新される度にAPIを取得する
  }, [query]);

  return (
    <>
      <form
        onSubmit={(event) => {
          event.preventDefault();
          setQuery(inputValue);
        }}
      >
        <input
          type="text"
          value={inputValue}
          onChange={(event) => setInputValue(event.target.value)}
        />
        <button type="submit">検索</button>
      </form>

      {isLoading ? (
        <p>Loading</p>
      ) : (
        <ul>
          {items.map((item) => (
            <li key={item.objectID}>
              <a href={item.url}>{item.title}</a>
            </li>
          ))}
        </ul>
      )}
    </>
  );
}
