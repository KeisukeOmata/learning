# コンテナに入る(アタッチ)
docker attach コンテナID
# コンテナから抜ける(デタッチ)
Ctrl + Q + P
# コンテナ起動
docker start コンテナID
# コンテナ停止
docker stop コンテナID
----------------------------
# コンテナ一覧
docker ps -a
docker-compose ps
# コンテナ削除
docker rm -f コンテナID
# イメージ一覧
docker images
# イメージ削除
docker rmi -f イメージID
# <none>一括削除
docker image prune
----------------------------
# コンテナの再起動
docker-compose restart
# コンテナの開始
docker-compose start
# コンテナの停止
docker-compose stop
----------------------------
# docker-composeの作成
# イメージも作成される
# 複数のコンテナイメージを組み合わせる
# up => コンテナの作成と開始
docker-compose up -d mysql
# mysql起動
docker-compose exec mysql mysql -u root -p
CREATE database hoge CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
CREATE database hoge_test CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
GRANT ALL on appdb.* TO hoge@'%' IDENTIFIED BY 'password';
GRANT ALL on appdb_test.* TO hoge@'%';
# gem 'mysql2', '>=0.4.4'
# database.ymlを更新
# run => コンテナの作成と開始、引数で指定したサービスのコンテナ内でコマンドを実行
docker-compose run --service-ports app
bundle install
yarn install
apt update; apt -y upgrade
apt install vim apt-utils
bin/rails db:migrate
bin/rails s -b 0.0.0.0
----------------------------
# # コンテナの作成とログイン
# docker run -it コンテナ名
# # ポートを指定
# docker run -p 3000:3000 コンテナ名
# ----------------------------
# # イメージ作成
# docker build -t イメージ名 .
# # マウントキャッシュを使う場合
# DOCKER_BUILDKIT=1 docker build -t イメージ名 -f Dockerfile-buildkit .
----------------------------
# 開発環境用の場合
docker volume create fav_map_rails_bundle
docker volume create fav_map_rails_node_modules
docker run -i -t \
-v $(pwd):/app:cached \
-v learning_rails_bundle:/app/vendor/bundle \
-v learning_rails_node_modules:/app/node_modules \
-p 3000:3000 \
learning_rails
----------------------------
# コンテナを使う場合はログを標準出力に変更する(config/environments/production.rb)
config.logger = ActiveSupport::Logger.new($stdout)
$stdout.sync = true