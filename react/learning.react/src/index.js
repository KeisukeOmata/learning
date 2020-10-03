import React from 'react';
import ReactDOM from 'react-dom';
import './index.css';
import * as serviceWorker from './serviceWorker';

// If you want your app to work offline and load faster, you can change
// unregister() to register() below. Note this comes with some pitfalls.
// Learn more about service workers: https://bit.ly/CRA-PWA
serviceWorker.unregister();

let title = "hoge"
let url = "https://github.com/KeisukeOmata/learning"
let flg = true;
let print = function(msg, size, color){
  const style = {
    fontSize: size + "pt",
    fontWeight:'700',
    color: color,
    border: "1px solid " + color
  };
  return <p style={style}>{msg}</p>;
}
let dom = document.querySelector('#root');
let el = (
  // renderできるのは1つのエレメントだけ
  // 変数展開は{}
  // 条件分岐は{真偽値 ? trueのJSX : falseのJSX}
  <div>
    {flg ?
      <div>
        <h2>{title}</h2>
        <p><a href={url}>github</a></p>
        {print('first', 30, 'red')}
        {print('second', 20, 'blue')}
        {print('third', 10, 'green')}
      </div>
    :
      <div>
        <h2>真偽値がfalse</h2>
      </div>
    }
  </div>  
);
  
ReactDOM.render(el, dom);
