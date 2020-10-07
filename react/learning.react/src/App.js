import React, { Component } from 'react';
import ReactDOM from 'react-dom';
import './App.css';

// Appコンポーネント
class App extends Component {
  // mainをレンダー
  render() {
    let title = "hoge";
    let url = "https://github.com/KeisukeOmata/learning";
    let flg = true;

    // jsxを返す関数
    function print(msg, size, color) {
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
    // const mainStyle = {
    //   fontSyze: "20pt",
    //   padding: "10px",
    //   backgroundColor:"blue",
    //   color: "white",
    //   // ポインターを表示する
    //   cursor: "pointer"
    // };
    // フォーム
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

    // コンポーネントを表示
    const componentStyle1 = {
      fontSize: "30pt",
      fontWeight:"bold",
      padding: "15px",
      color:"white",
      backgroundColor:"darkblue"
    }
    const componentStyle2 = {
      fontSize: "30pt",
      fontWeight:"bold",
      padding: "15px",
      color:"white",
      backgroundColor:"darkred"
    }
    // コンポーネントは大文字で始める
    function HogeComponent(props) {
      let num = 0;
      // コンポーネントに渡されたプロパティはpropsで扱う
      for (let i = 1; i <= props.number; i++) {
        num += i
      }
      // コンポーネントに渡されたプロパティはpropsで扱う
      return <p style={props.style}>hello, {props.name}, {num}</p>;
    }

    let main = (event) => {
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
              {/* <p onClick={main} style={actionStyle}>
                count: {count}
              </p> */}
              {/* フォーム */}
              <p style={formStyle}>{message}</p>
              <input type="text" id="input" style={formValueStyle} onChange={change} />
              <button  onClick={main} style={formValueStyle}>
                Click
              </button>
              {/* コンポーネント */}
              {/* コンポーネントに渡すプロパティ */}
              <HogeComponent name="hoge" style={componentStyle1} number="100" />
              <HogeComponent name="fuga" style={componentStyle2} number="200" />
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

    return <div>{main()}</div>
  };
};

export default App;
