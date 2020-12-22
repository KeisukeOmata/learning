# nextの環境構築2
# 1.dokerfile, docker-compose.ymlをフォルダに用意
# 2.コンテナ作成
docker-compose run --service-ports next_blog
# 3.アプリ作成
# コンテナ内
yarn create next-app next_blog
# 4.typescriptをインストール
touch tsconfig.json
mv pages/index.js pages/index.tsx
mv pages/_app.js pages/_app.tsx
yarn add --dev typescript @types/react @types/node
# src/components, foundations, layouts, pages, typesを作成
# 各種インストール
yarn add vercel
yarn add @types/axios
yarn add @types/firebase
yarn add firebase-admin
yarn add @types/recoil
yarn add bootstrap@next
yarn add sass
import { useState } from "react";
yarn add @material-ui/core
yarn add @material-ui/icons
# アニメーション
yarn add @types/react-toastify
# 日時を扱う
yarn add dayjs
# 画像
yarn add canvas
# リセットcss
yarn add minireset.css

# 環境変数にbase64でエンコードしたjsonファイルの内容を指定し、それを実行時にデコードして利用
# .env.localにエンコードした文字列を環境変数として設定
base64 -i next-57fd0-firebase-adminsdk-7tp80-f1525cff04.json > encoded.txt
----------------------------
# docker-compose
# 1.利用するイメージをpullしておく
docker pull docker.elastic.co/elasticsearch/elasticsearch:7.9.1
# 2.mysqlコンテナを作成し、バックグラウンドで起動
docker-compose up -d mysql
# 3.execコマンドで既に起動中のmysqlコンテナに対して、コマンド(mysql -u root -p)を実行する
docker-compose exec mysql mysql -u root -p
-------------------
CREATE database appdb CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
CREATE database appdb_test CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
GRANT ALL on appdb.* TO app@'%' IDENTIFIED BY 'password';
GRANT ALL on appdb_test.* TO app@'%';
-------------------
# 4.Gemを追加
gem 'mysql2', '>=0.4.4'
# 5.database.ymlを更新
# 6.appイメージとコンテナの作成
docker-compose run --service-ports app
# 7.各種インストール
yarn install
apt-get update
apt-get install -y vim
bundle install
# assets:precompileでエラーが発生する場合はyarn add hoge
bin/rails assets:precompile
# 8.起動
bin/rails db:migrate
# nginx
# http://localhost:8080/
bundle exec puma -b unix:///app/sockets/puma.sock
# bin/rails s -b 0.0.0.0
----------------------------
# reactの環境構築
# 1.Dockerfileを作成
# 2.イメージ作成
docker build -t イメージ名 .
# 3.コンテナ作成
docker run -it コンテナ名
# 4.reactアプリの作成
npx create-react-app アプリ名
# 5.コンテナからローカルにアプリをコピー
docker cp コンテナid:app/アプリ名 ローカルのパス/付けたい名前
# 6.docker-compose.ymlを作成
# 7.appイメージとコンテナの作成
docker-compose run --service-ports app
# 8.各種インストール
npm install redux
npm install react-redux
npm install redux-devtools
npm install redux-persist
npm install redux-thunk
npm install next
npm install react
npm install react-dom
npm install firebase
npm install typescript
npm install @material-ui/core
npm install @material-ui/icons
npm install @types/react-router-dom
npm install react-router-dom
apt-get update
apt-get install -y vim
# yarn install
# 9.起動
yarn start
----------------------------
# nextの環境構築1
# 1.dokerfile, docker-compose.ymlをフォルダに用意
# 2.package.jsonを作成
ーーーーーーーーーーーーーー
{
  "scripts": {
    "dev": "next",
    "build": "next build",
    "start": "next start",
    "export": "next export"
  }
}
ーーーーーーーーーーーーーー
# 3.コンテナ作成
docker-compose run --service-ports app
# 4./lib/redux-store.jsを配置
# 5./pages/_app.jsを配置
# 6./store.jsでcreateStoreにthunkMiddlewareを渡す
# 7.各種インストール
npm install redux
npm install react-redux
npm install redux-devtools
npm install redux-persist
npm install redux-thunk
npm install next
npm install react
npm install react-dom
npm install firebase
npm install typescript
npm install @material-ui/core
npm install @material-ui/icons
npm install @types/react-router-dom
npm install react-router-dom
apt-get update
apt-get install -y vim
yarn install
# 8.起動
npm run dev
----------------------------
# コンテナに入る(アタッチ)
docker attach
# コンテナから抜ける(デタッチ)
Ctrl + Q + P
# コンテナ開始
docker start
# コンポーズコンテナ開始
docker-compose start
# コンテナ停止
docker stop
# コンポーズコンテナ停止
docker-compose stop
# コンポーズコンテナの再起動
docker-compose restart
----------------------------
# コンテナ一覧
docker ps -a
# コンポーズコンテナ一覧
docker-compose ps
# コンテナ削除
docker rm -f コンテナID
# コンポーズコンテナ削除
docker-compose rm -f
# イメージ一覧
docker images
# イメージ削除
docker rmi -f イメージID
# <none>一括削除
docker image prune
# イメージの取得
docker pull
----------------------------
# # イメージ作成
# docker build -t イメージ名 .
# # マウントキャッシュを使う場合
# DOCKER_BUILDKIT=1 docker build -t イメージ名 -f Dockerfile-buildkit .
----------------------------
# # コンテナの作成とログイン
# docker run -it コンテナ名
# # ポートを指定
# docker run -p 3000:3000 コンテナ名
----------------------------
# # rails単体で動かす
# docker build -t fav_map .
# docker volume create fav_map_bundle
# docker volume create fav_map_node_modules
# docker run -i -t \
# -v $(pwd):/app:cached \
# -v fav_map_bundle:/app/vendor/bundle \
# -v fav_map_node_modules:/app/node_modules \
# -p 3000:3000 \
# fav_map
# bundle install
# yarn install
# bin/rails s -b 0.0.0.0
----------------------------
# コンテナを使う場合はログを標準出力に変更する(config/environments/production.rb)
config.logger = ActiveSupport::Logger.new($stdout)
$stdout.sync = true
----------------------------
# railsの環境変数
EDITOR="vim" bin/rails credentials:edit
# 使い方
Rails.application.credentials.rollbar[:ROLLBAR_ACCESS_TOKEN]
----------------------------
# Dockerのインストール
# 古いDockerを削除
1. sudo apt-get remove docker docker-engine docker.io containerd runc
2. sudo apt-get update
# 前提ソフトウェアのインストール
3. sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
# GPG公開鍵をインストール
4. curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
# 公開鍵のフィンガープリントを確認
5. sudo apt-key fingerprint 0EBFCD88
# aptリポジトリの設定
6. sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
7. sudo apt-get update
# Dockerのインストール
8. sudo apt-get install -y docker-ce
9. docker -v
# Docker Composeのインストール
10. sudo curl -L "https://github.com/docker/compose/releases/download/1.22.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
11. sudo chmod +x /usr/local/bin/docker-compose
12. docker-compose --version
