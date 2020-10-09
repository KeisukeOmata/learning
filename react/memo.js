// アプリ作成
// npx create-react-app アプリ名
// アプリ起動
// yarn start
// ビルド
// yarn build
ーーーーーーーーーーーーーーーーーーーーーーーー
// 関数コンポーネント
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}

const element = <Welcome name="Sara" />;
ReactDOM.render(
  element,
  document.getElementById('root')
);
ーーーーーーーーーーーーーーーーーーーーーーーー
// クラスコンポーネント
class Welcome extends React.Component {
  render() {
    return <h1>Hello, {this.props.name}</h1>;
  }
}

const element = <Welcome name="Sara" />;
ReactDOM.render(
  element,
  document.getElementById('root')
);
ーーーーーーーーーーーーーーーーーーーーーーーー
// class.js
ーーーーーーーーーーーーーー
export default class {
  // コンストラクタ
  constructor(r, g, b) {
    // プロパティ
    this.red = r;
    this.green = g;
    this.blue = b;
  };

  // メソッド
  // メソッドの中でプロパティを使うにはthisが必要
  print() {
    return '<p>RED: ' + this.red + '</p>'
      + '<p>GREEN:' + this.green + '</p>'
      + '<p>BLUE: ' + this.blue + '</p>';
  };
};
ーーーーーーーーーーーーーー
// newClass.js
ーーーーーーーーーーーーーー
// 継承
import object from './class.js';
export default class extends object {
  // プロパティは継承元で定義されている
  print(){
    return '<p>new RED: ' + this.red + '</p>'
      + '<p>new GREEN:' + this.green + '</p>'
      + '<p>new BLUE: ' + this.blue + '</p>';
  };
};
ーーーーーーーーーーーーーー
// index.html
ーーーーーーーーーーーーーー
import object from './class.js';
import newObject from './newClass.js';

// オブジェクトを初期化
let object1 = new object(255, 200, 200);
// オブジェクトのプロパティを呼ぶ
document.getElementById("class").innerHTML = object1.print();

let object2 = new newObject(0, 150, 200);
// 継承元のメソッドを上書きする
document.getElementById("class2").innerHTML = object2.print();
ーーーーーーーーーーーーーーーーーーーーーーーー
