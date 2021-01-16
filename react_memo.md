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
ーーーーーーーーーーーーーーーーーーーーーーーー
# 各種インストール
# tailwind
yarn add -D tailwindcss
yarn tailwindcss init 
yarn add -D postcss-preset-env
yarn add -D postcss  
yarn add -D @tailwindcss/ui
# 拡張
PostCSS Language Support

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
ーーーーーーーーーーーーーーーーーーーーーーーー
# jsonを環境変数に設定
# 環境変数にbase64でエンコードしたjsonファイルの内容を指定し、それを実行時にデコードして利用
# .env.localにエンコードした文字列を環境変数として設定
base64 -i next-57fd0-firebase-adminsdk-7tp80-f1525cff04.json > encoded.txt
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
