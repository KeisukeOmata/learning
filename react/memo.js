nextアプリ起動
// npm run dev
ビルド
// npm run build
エクスポート
// npm run export

アプリ作成
//npx create-react-app アプリ名
アプリ起動
// yarn start
ビルド
// yarn build
ーーーーーーーーーーーーーーーーーーーーーーーー
nextの環境構築
dokerfile, docker-compose.ymlをフォルダに用意
package.jsonを作成
`ーーーーーーーーーーーーーー
{
  "scripts": {
    "dev": "next",
    "build": "next build",
    "start": "next start",
    "export": "next export"
  }
}
ーーーーーーーーーーーーーー`
// docker-compose run --service-ports app
// /lib/redux-store.jsを配置
// /pages/_app.jsを配置
// /store.jsでcreateStoreにthunkMiddlewareを渡す
各種インストール
// npm install redux
// npm install react-redux
// npm install redux-devtools
// npm install redux-persist
// npm install redux-thunk
// npm install next
// npm install react
// npm install react-dom
// npm install firebase
// npm install typescript
// npm install @material-ui/core
// npm install @material-ui/icons
// npm install @types/react-router-dom
// npm install react-router-dom
// apt-get update
// apt-get install -y vim
起動
// npm run dev
ーーーーーーーーーーーーーーーーーーーーーーーー
reactの環境構築
// 1.Dockerfileを作成
// 2.イメージ作成
// docker build -t イメージ名 .
// 3.コンテナ作成
// docker run -it コンテナ名
// 4.reactアプリの作成
// npx create-react-app アプリ名
// 5.コンテナからローカルにアプリをコピー
// docker cp コンテナid:app/アプリ名 ローカルのパス/付けたい名前
// 6.docker-compose.ymlを作成
// 7.appイメージとコンテナの作成
// docker-compose run --service-ports app
// 8.各種インストール
// npm install redux
// npm install react-redux
// npm install redux-devtools
// npm install redux-persist
// npm install redux-thunk
// npm install next
// npm install react
// npm install react-dom
// npm install firebase
// npm install typescript
// npm install @material-ui/core
// npm install @material-ui/icons
// npm install @types/react-router-dom
// npm install react-router-dom
// apt-get update
// apt-get install -y vim
// yarn install
// 9.起動
// yarn start
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
import _app from './learning.next/pages/_app.js'
import newObject from './newClass.js';

// オブジェクトを初期化
let object1 = new object(255, 200, 200);
// オブジェクトのプロパティを呼ぶ
document.getElementById("class").innerHTML = object1.print();

let object2 = new newObject(0, 150, 200);
// 継承元のメソッドを上書きする
document.getElementById("class2").innerHTML = object2.print();
ーーーーーーーーーーーーーーーーーーーーーーーー
// react 環境変数の設定
// 環境変数は.envに記載
// 環境変数を呼び出したいファイル
ーーーーーーーーーーーー
import dotenv from "dotenv";

dotenv.config(process.env.REACT_APP_API)
ーーーーーーーーーーーー
ーーーーーーーーーーーーーーーーーーーーーーーー
// next.js 環境変数の設定
// next.config.js
ーーーーーーーーーーーー
module.exports = {
  env: {
    REACT_APP_apiKey: 'hogehoge',
  },
}
// 環境変数を呼び出したいファイル
ーーーーーーーーーーーー
process.env.REACT_APP_API
ーーーーーーーーーーーー
ーーーーーーーーーーーーーーーーーーーーーーーー
// Webhook
Versel
settings => Git Integration => Deploy HooksでWebhookを作成で、WebhookのURLが発行される
microCMS
API設定 => Webhook => カスタム通知からURLを入力

// 他のAPIを参照する
参照するAPIを作成(カテゴリーなど)
API設定 => APIスキーマ => 種類をコンテンツ参照を選択する
ーーーーーーーーーーーーーーーーーーーーーーーー

src/
  + pages/       ... ページコンポーネント（Next.js標準）
  + foundations/ ... ページ全体に関わるロジックを含むコンポーネントたち（認証処理/スプラッシュ画面など）
  + layouts/     ... ページ全体のUIに関わるコンポーネントたち（ヘッダやフッタなど）
  + components/  ... 再利用性の高いコンポーネントたち