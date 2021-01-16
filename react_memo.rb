# 1.dokerfile, docker-compose.ymlをフォルダに用意
# 2.コンテナ作成
docker-compose run --service-ports app
# 3.アプリ作成
# コンテナ内
yarn create next-app hoge
# 4.typescriptをインストール
touch tsconfig.json
mv pages/index.js pages/index.tsx
mv pages/_app.js pages/_app.tsx
yarn add --dev typescript @types/react @types/node
# src/components, foundations, layouts, pages, typesを作成
# tailwind
yarn add -D tailwindcss
yarn tailwindcss init 
yarn add -D postcss-preset-env
yarn add -D postcss  
yarn add -D @tailwindcss/ui
PostCSS Language Support # 拡張
# prettier
yarn add -D prettier
touch .prettierrc.js
# eslint
yarn add -D eslint eslint-plugin-react \
              eslint-config-prettier eslint-plugin-prettier \
        @typescript-eslint/parser @typescript-eslint/eslint-plugin
touch .eslintrc.js
# huskey
yarn add lint-staged
yarn add husky
# jest
yarn add -D jest identity-obj-proxy ts-jest @types/jest
touch jest.config.js
# react testing-library
yarn add -D @testing-library/react
# cypress
yarn add -D cypress
yarn run cypress open
find cypress -name "*.js" | sed 'p;s/.js$/.ts/' | xargs -n2 mv
touch cypress.json
touch cypress/integration/index_spec.ts
yarn cypress:open
# pwa
yarn add next-pwa
touch next.config.js
yarn add pwacompat
# apollo
yarn add apollo-boost @apollo/react-hooks graphql apollo-link-ws subscriptions-transport-ws
# storybook
yarn add -D @storybook/react @babel/core babel-loader babel-preset-react-app
# package.json
"storybook": "start-storybook -p 6006 -c .storybook"
mkdir .storybook
cd .storybook
main.js, preview.tsをコピーしてくる
cd src 
mkdir stories
cd stories
touch Button.stories.tsx
# src/stories/Button.stories.tsx
import * as React from 'react';
import { storiesOf } from '@storybook/react';
import Button from '../components/Button';

storiesOf('Button', module).add('with text', () => {
  return <Button text="Click Me" />;
});
yarn storybook
# storybookできないVer
npx sb init
yarn add -D @storybook/addon-storyshots
mkdir storyshots && \
  touch storyshots/storybook.test.ts
mv .storybook/preview.js .storybook/preview.ts
yarn add -D jest-svg-transformer
yarn add -D @storybook/addon-storyshots-puppeteer puppeteer
touch storyshots/puppeteer-storyshots.test.ts
touch storyshots/puppeteer-storyshots-ipad.test.ts
touch storyshots/puppeteer-storyshots-iphone.test.ts
npm i --save-dev @types/puppeteer

yarn add --dev @storybook/react ts-loader css-loader babel-preset-react-app babel-plugin-react-require 

yarn run storybook
yarn storyshots
yarn puppeteer-storyshots
# 各種インストール
yarn add -D classnames
yarn add -D keen-slider 
yarn add @types/swiper
yarn add vercel
yarn add @types/axios
yarn add @types/firebase
yarn add firebase-admin
yarn add types/recoil
yarn add bootstrap@next
yarn add sass
yarn add @material-ui/core
yarn add @material-ui/lab
# アニメーション
yarn add @types/react-toastify
# 日時を扱う
yarn add dayjs
# 画像
yarn add canvas
# リセットcss
yarn add minireset.css

yarn lint
yarn lint --fix

# Shopify
# 管理ストア
ストア作成(https://www.shopify.jp/)
パートナーアカウント作成(https://www.shopify.jp/partners)
ストア管理から管理ストアを追加する

パートナーのビジネスメールが異なる必要がある
アプリ管理内からストアフロントのアクセストークンが確認できる
# 開発ストア
パートナーで開発ストアを作成
ストア側で[アプリ管理] > [プライベートアプリを管理する]と移動し、[プライベートアプリを有効にする]
アプリ管理内からストアフロントのアクセストークンが確認できる

brew tap shopify/shopify
brew install shopify-cli
shopify version
# gem list shopify_api
# gem install shopify_api
# gem uninstall shopify_api -v x.y.z
shopify create
shopify serve
ーーーーーーーーーーーーーーーーーーーーーーーー
# jsonを環境変数に設定
# 環境変数にbase64でエンコードしたjsonファイルの内容を指定し、それを実行時にデコードして利用
# .env.localにエンコードした文字列を環境変数として設定
base64 -i next-57fd0-firebase-adminsdk-7tp80-f1525cff04.json > encoded.txt
ーーーーーーーーーーーーーーーーーーーーーーーー
# フォルダ構成
src
  # ページコンポーネント（Next.js標準）
  pages
  # ページ全体に関わるロジックを含むコンポーネントたち（認証処理/スプラッシュ画面など）
  foundations
  # ページ全体のUIに関わるコンポーネントたち（ヘッダやフッタなど）
  layouts
  # 再利用性の高いコンポーネントたち
  components
ーーーーーーーーーーーーーーーーーーーーーーーー
# Listにはkeyを設定する
import Link from 'next/link'

function Posts({ posts }) {
  return (
    <ul>
      {posts.map((post) => (
        <li key={post.id}>
          <Link href={`/blog/${encodeURIComponent(post.slug)}`}>
            <a>{post.title}</a>
          </Link>
        </li>
      ))}
    </ul>
  )
}

export default Posts
ーーーーーーーーーーーーーーーーーーーーーーーー
# 環境変数の設定
# 環境変数は.envに記載
# 環境変数を呼び出したいファイル
ーーーーーーーーーーーー
import dotenv from "dotenv";

dotenv.config(process.env.REACT_APP_API)
ーーーーーーーーーーーー
ーーーーーーーーーーーーーーーーーーーーーーーー
# next.js 環境変数の設定
# next.config.js
ーーーーーーーーーーーー
module.exports = {
  env: {
    REACT_APP_apiKey: 'hogehoge',
  },
}
# 環境変数を呼び出したいファイル
ーーーーーーーーーーーー
process.env.REACT_APP_API
ーーーーーーーーーーーー
ーーーーーーーーーーーーーーーーーーーーーーーー
# Webhook
# Versel
settings => Git Integration => Deploy HooksでWebhookを作成で、WebhookのURLが発行される
# microCMS
API設定 => Webhook => カスタム通知からURLを入力
ーーーーーーーーーーーーーーーーーーーーーーーー
# 他のAPIを参照する
参照するAPIを作成(カテゴリーなど)
API設定 => APIスキーマ => 種類をコンテンツ参照を選択する
ーーーーーーーーーーーーーーーーーーーーーーーー
# 関数コンポーネント
function Welcome(props) {
  return <h1>Hello, {props.name}</h1>;
}
const element = <Welcome name="Sara" />;
ReactDOM.render(
  element,
  document.getElementById('root')
);
ーーーーーーーーーーーーーーーーーーーーーーーー
# クラスコンポーネント
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
# class.js
ーーーーーーーーーーーーーー
export default class {
  # コンストラクタ
  constructor(r, g, b) {
    # プロパティ
    this.red = r;
    this.green = g;
    this.blue = b;
  };

  # メソッド
  # メソッドの中でプロパティを使うにはthisが必要
  print() {
    return '<p>RED: ' + this.red + '</p>'
      + '<p>GREEN:' + this.green + '</p>'
      + '<p>BLUE: ' + this.blue + '</p>';
  };
};
ーーーーーーーーーーーーーー
# newClass.js
ーーーーーーーーーーーーーー
# 継承
import object from './class.js';
export default class extends object {
  # プロパティは継承元で定義されている
  print(){
    return '<p>new RED: ' + this.red + '</p>'
      + '<p>new GREEN:' + this.green + '</p>'
      + '<p>new BLUE: ' + this.blue + '</p>';
  };
};
ーーーーーーーーーーーーーー
# index.html
ーーーーーーーーーーーーーー
import object from './class.js';
import _app from './learning.next/pages/_app.js'
import newObject from './newClass.js';

# オブジェクトを初期化
let object1 = new object(255, 200, 200);
# オブジェクトのプロパティを呼ぶ
document.getElementById("class").innerHTML = object1.print();

let object2 = new newObject(0, 150, 200);
# 継承元のメソッドを上書きする
document.getElementById("class2").innerHTML = object2.print();
