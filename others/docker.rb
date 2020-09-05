# コンテナに入る(アタッチ)
docker attach コンテナID
# コンテナから抜ける(デタッチ)
Ctrl + Q + P
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
----------------------------
# コンテナの再起動
docker-compose restart
# コンテナの開始
docker-compose start
# コンテナの停止
docker-compose stop
----------------------------
# docker-composeの作成
# 複数のコンテナイメージを組み合わせる
# up => コンテナの作成と開始
docker-compose up -d mysql
docker-compose exec mysql mysql -u root -p
CREATE database appdb CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
CREATE database appdb_test CHARACTER SET = utf8mb4 COLLATE = utf8mb4_bin;
GRANT ALL on appdb.* TO app@'%' IDENTIFIED BY 'password';
GRANT ALL on appdb_test.* TO app@'%';
# database.ymlを更新
# run => コンテナの作成と開始、引数で指定したサービスのコンテナ内でコマンドを実行
docker-compose run --service-ports app
bundle install
yarn install
bin/rails db:migrate
bin/rails s -b 0.0.0.0
----------------------------
# コンテナの作成とログイン
docker run -it コンテナ名
# ポートを指定
docker run -p 3000:3000 コンテナ名
----------------------------
# イメージ作成
docker build -t イメージ名 .
# マウントキャッシュを使う場合
DOCKER_BUILDKIT=1 docker build -t イメージ名 -f Dockerfile-buildkit .
----------------------------
# 開発環境用の場合
docker volume create learning_rails_bundle
docker volume create learning_rails_node_modules
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