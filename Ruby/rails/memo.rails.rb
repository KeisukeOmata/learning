rails s -b 0.0.0.0
localhost:3000

rails new hoge
rails g controller hoges new edit show index 
#rails g model Hoge name:stringでもよい 
rails g model Hoge name:string
マイグレーションファイルにカラムを追加
rails db:create
rails db:migrate
#カラムの追加と削除
# rails g migration AddNameToPosts category:string body:text
rails g migration Addカラム名Toテーブル名 カラム名:データ型 カラム名:データ型
rails g migration Removeカラム名Fromテーブル名 カラム名:型名
rails db:migrate
#DBのリセット
rails db:migrate:reset
# ルーティングの確認
rails routes
# DBはコンソールから触る
rails c
# プライマリーキー
Hoge.find(1)
# それ以外のカラム
Hoge.find_by(name: "fuga")
# 複数レコード
Hoge.where("cost > ?", 1000)
# レコード追加
Hoge.create(hoge: hoge, fuga: fuga)

#refile
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
sudo apt-get update
sudo apt-get -y install imagemagick libmagick++-dev
bundle install
モデルにhoge_idカラムを追加
モデルに以下を追加
--------------------------------
attachment :hoge
--------------------------------
rails db:migrate
runtimeエラーが出た場合は config/initializers/application_controller_renderer.rb にシークレットキーを追加

#devise
gem 'devise'
bundle install
rails g devise:install
#ログイン機能を利用するモデル
rails g devise Hoge
Trackableのコメントアウトを外す
カラムを追加
rails db:migrate
#ログイン画面
rails g devise:views
#コントローラー
rails g devise:controllers users

#kaminari
gem 'kaminari','~> 1.1.1'
bundle install
rails g kaminari:config
rails g kaminari:views default
#view
<% paginate @hoges, class: "paginate" %
#controller
@hoges = Hoge.page(params[:page]).reverse_order
#config/initializers/kaminari_config.rb
config.default_per_page = 5

#bootstrap
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
bundle install
app/asset/stylesheet のファイル名を .scssに変更
app/assets/stylesheets/application.scssを編集
--------------------------------
*= require_tree .
*= require_self
*
@import "bootstrap-sprockets";
@import "bootstrap";        
--------------------------------
app/assets/javascripts/application.jsを編集
--------------------------------
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
--------------------------------

# nokogiriのエラーは以下で解消された
gem install nokogiri -- --use-system-libraries
bundle config build.nokogiri --use-system-libraries

--------------------------------

# Node.jsのアップデート
1. sudo apt install nodejs npm
# エラーが出るとき
sudo apt install libssl1.0-dev
sudo apt install npm
2. sudo npm install -g n
# nパッケージでNode.jsをインストール
# 最新版
3. sudo n latest
# 安定版
   sudo n lts
# nodejs npmを削除
4. sudo apt purge nodejs npm
   sudo apt autoremove
# シェルにパスを追記
5. vi ~/.bash_profile
ーーーーーーーーーーーーーーーーー
export PATH=$/usr/local/bin/node:$PATH
ーーーーーーーーーーーーーーーーー
# シェルを読み込ませる
6. source ~/.bash_profile
node -v

--------------------------------

# Yarnのインストール
sudo apt install curl
sudo apt install libcurl4
sudo apt install curl
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt-get update && sudo apt-get install yarn
yarn --version

--------------------------------

# imagemagickのインストール
sudo apt-get -y install imagemagick
which convert

--------------------------------

# Dockerのインストール
# 古いDockerを削除
1. sudo apt-get remove docker docker-engine docker.io containerd runc
2. udo apt-get update
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

--------------------------------

# railsのインストール
gem install rails -v 6.0.3
rails -v
# インストール済みのrailsのバージョン
gem list rails 
# railsコマンドは最新版を実行するため、バージョン指定方法
rails _5.2.3_ hoge

--------------------------------

bin配下はbundle execが不要になる