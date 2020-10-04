import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import * as serviceWorker from './serviceWorker';

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();

let title = "hoge";
let url = "https://github.com/KeisukeOmata/learning";
let flg = true;

// jsxを返す関数
let print = function (msg, size, color) {
  const style = {
    fontSize: size + "pt",
    fontWeight: '700',
    color: color,
    border: "1px solid " + color
  };
  return <p style={style}>{msg}</p>;
};

// 配列
let array = [
  {title: 'first', body: 'hoge'},
  {title: 'second', body: 'fuga'},
  {title: 'third', body: 'piyo'}
];
const tableStyle = {
  fontSize: "15pt",
  padding: "10px 30px"
};
const thStyle = {
  color: 'white',
  backgroundColor: '#006',
  padding: '10px 10px'
};
const tdStyle = {
  color: 'black',
  padding: '10px 10px',
  border: '1px solid gray'
};
let array2 = {
  url: 'https://github.com/KeisukeOmata/learning',
  title: 'github',
  body: 'githubのレポジトリです'
};
const dfnStyle = {
  fontSize: "30pt",
  padding: "20px"
};
const dtStyle = {
  fontSize: "15pt",
  color: 'white',
  backgroundColor: '#006',
  padding: '10px'
};
const ddStyle = {
  color: 'black',
  padding: '10px'
};

// 表示の更新
// var count = 0;
// // 1秒毎に処理を実施
// const intervalStyle = {
//   fontSyze: "20pt",
//   padding: "10px",
// };
// クリックする毎に処理を実施
// const actionStyle = {
//   fontSyze: "20pt",
//   padding: "10px",
//   backgroundColor:"blue",
//   color: "white",
//   // ポインターを表示する
//   cursor: "pointer"
// };
let message = "名前を入力してください"
let formValue = "";
const formStyle = {
  fontSize: "20pt",
  padding: "10px",
};
const formValueStyle = {
  fontSize: "20pt",
  padding: "5px 10px"
}

let change = (event) => {
  formValue = event.target.value;
  message = "hello " + formValue + "!";
}

let action = (event) => {
// 1秒毎に処理を実施
// setInterval(() => {
  // count++;
  let dom = document.querySelector('#root');
  let element = (
    // renderできるのは1つのエレメントだけ
    <div>
      {/* 条件分岐は{真偽値 ? trueのJSX : falseのJSX} */}
      {flg ?
        <div>
          {/* 変数展開は{} */}
          <h2>{title}</h2>
          <p><a href={url}>github</a></p>
          {/* jsxを返す関数 */}
          {print('first', 30, 'red')}
          {print('second', 20, 'blue')}
          {print('third', 10, 'green')}
          {/* 配列の展開 */}
          <table style={tableStyle}>
            <tr>
              <th style={thStyle}>title</th>
              <th style={thStyle}>body</th>
            </tr>
            {array.map((value) => (
              <tr>
                <td style={tdStyle}>{value.title}</td>
                <td style={tdStyle}>{value.body}</td>
              </tr>
            ))}
          </table>
          {/* 無名関数 */}
          {(() =>
            <dl>
              <dt style={dtStyle}>
                <dfn style={dfnStyle}>
                  {array2.title}
                </dfn>
              </dt>
              <dd style={ddStyle}>
                {array2.body}
              </dd>
              <dd style={ddStyle}>
                <a href={array2.url}>※{array2.title}に移動</a>
              </dd>
            </dl>
          )()}
          {/* 1秒毎に処理を実施 */}
          {/* <p style={intervalStyle}>count: {count}</p> */}
          {/* クリックする毎に処理を実施 */}
          {/* <p onClick={action} style={actionStyle}>
            count: {count}
          </p> */}
          <p style={formStyle}>{message}</p>
          <input type="text" id="input" style={formValueStyle} onChange={change} />
          <button  onClick={action} style={formValueStyle}>
            Click
          </button>
        </div>
      :
        <div>
          <h2>真偽値がfalse</h2>
        </div>
      }
    </div>  
  );
    
  ReactDOM.render(element, dom);
// 1秒毎に処理を実施  
// }, 1000);
};

action();
