rails s -b 0.0.0.0
# jsを編集する度にビルドしてくれる
bin/webpack-dev-server
localhost:3000
ルーティング→コントローラー(モデルからデータ取得)→ビュー→ルーティング
# デプロイ前は必須
bin/rails assets:precompile
--------------------------------
rails new hoge --database=mysql --skip-turbolinks --skip-test --skip-action-mailer --skip-action-mailbox --skip-action-text --skip-action-cable --skip-active-storage
# apiモード
rails new hoge --api
# react
rails new hoge --webpacker=react
# reactを後から導入
rails webpacker:install:react
# コントローラーの作成
bin/rails g controller hoges index
# コントローラーの削除
bin/rails destroy  controller hoges index
# config/routes.rb
root 'hoges#index'
# モデルの作成
bin/rails g model Hoge name:string
# モデルの削除
bin/rails destroy model Hoge
マイグレーションファイルにカラムを追加
rails db:create
rails db:migrate
--------------------------------
#カラムの追加と削除
# rails g migration AddNameToPosts category:string body:text
rails g migration Addカラム名Toテーブル名 カラム名:データ型 カラム名:データ型
rails g migration Removeカラム名Fromテーブル名 カラム名:型名
rails db:migrate
# 1つ前に戻す
rails db:rollback
# migrateされていないファイルを確認
rails db:abort_if_pending_migrations
# DBのリセット
rails db:migrate:reset
# モデルの削除
rails destroy model hoge
--------------------------------
# ルーティングの確認
rails routes
--------------------------------
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
# seedファイルの読み込み
rails db:seed
# リセット
rails db:seed:replant
--------------------------------
# jsファイル
# app/javascript/packs/配下におく
app/javascript/packs/hello.js
# application.html.erbに以下記載
<%= javascript_pack_tag 'hello', 'data-turbolinks-track': 'reload'
--------------------------------
#refile
gem "refile", require: "refile/rails", github: 'manfe/refile'
gem "refile-mini_magick"
sudo apt-get update
sudo apt-get -y install imagemagick libmagick++-dev
bundle install
モデルにhoge_idカラムを追加
モデルに以下を追加
------------------------
attachment :hoge
------------------------
rails db:migrate
runtimeエラーが出た場合は config/initializers/application_controller_renderer.rb にシークレットキーを追加
--------------------------------
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
--------------------------------
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
--------------------------------
#bootstrap
# rails6.0
# .scssファイルに以下を記載
@import "~bootstrap/scss/bootstrap";
yarn add bootstrap
yarn add jquery popper.js
# application.jsに以下を記載
require("jquery");
require("bootstrap");
# rails5.2
gem 'bootstrap-sass', '~> 3.3.6'
gem 'jquery-rails'
bundle install
app/asset/stylesheet のファイル名を .scssに変更
app/assets/stylesheets/application.scssを編集
------------------------
*= require_tree .
*= require_self
*
@import "bootstrap-sprockets";
@import "bootstrap";        
------------------------
app/assets/javascripts/application.jsを編集
------------------------
//= require rails-ujs
//= require turbolinks
//= require jquery
//= require bootstrap-sprockets
//= require_tree .
------------------------
--------------------------------
# nokogiriのエラーは以下で解消された
gem install nokogiri -- --use-system-libraries
bundle config build.nokogiri --use-system-libraries

# sassc 2.4.0がインストールできないとき
gem install sassc -- --disable-march-tune-nativa
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
ーーーーーーーーーーー
export PATH=$/usr/local/bin/node:$PATH
ーーーーーーーーーーー
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

# rails6のアップデート
gem 'rails', '~> 6.0'
bundle update rails
gem "webpacker"
bundle install
rails webpacker:install
# エラーが発生する場合はyarn add hoge
bin/rails assets:precompile
config/application.jsのconfig.load_defaultsを6.0に変更
--------------------------------
bin配下はbundle execが不要になる
--------------------------------
# シークレットの持ち方
EDITOR="vi" bin/rails credentials:edit
--------------------
github:
        client_id: ""
        client_secret: ""
omniauth.rb
--------------------
provider :github,
   Rails.application.credentials.github[:client_id],
   Rails.application.credentials.github[:client_secret]
--------------------
# 環境変数
vim ~/.bash_profile
export HOGE_DATABASE_PASSWORD='hogehoge'
source ~/.bash_profile
--------------------------------
# link_to
# ルーティングで指定する
<%= link_to 'hoge', edit_user_path(@hoge)
# コントローラーで指定する
<%= link_to 'hoge', controller: :hoges, action: :edit, id: 1234
--------------------------------
# CSRF(クロスサイトリクエストフォージェリ)
formヘルパーではGET以外でセキュリティトークンが必須になっている
# Mass Assignment機能の脆弱性
ストロングパラメータ
# XSS(クロスサイトスクリプティング)
CSP(コンテンツセキュリティポリシー)
config/initializers/content_security_policy.rb
--------------------------------
# rails6.0でloaderを使う
# rails-erb-loader => js内でerbを使える
bin/rails webpacker:install:erb
config/webpack/environment.jsが更新される
# rails6.0でpluginを使う
# ProvidePlugin => requireをせずにライブラリを参照できる
bin/yarn add jquery
config/webpack/plugins/provide.jsを作成
------------------
const webpack = require('webpack')
module.exports = new webpack.ProvidePlugin({
  $: 'jquery',
  jquery: 'jquery'
});
------------------
config/webpack/environment.jsに以下を追記
------------------
const provide = require('./plugins/provide')
environment.plugins.prepend('provide', provide)
------------------
--------------------------------
# メールアドレスの正規表現
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
# 正規表現の開始を示す
/
# 文字列の先頭
\A
# 英数字、アンダースコア (_)、プラス (+)、ハイフン (-)、ドット (.) のいずれかを少なくとも1文字以上繰り返す
[\w+\-.]+
# 英小文字、数字、ハイフン、ドットのいずれかを少なくとも1文字以上繰り返す
[a-z\d\-.]+
# ドット
\.
# 英小文字を少なくとも1文字以上繰り返す
[a-z]+
# 文字列の末尾
\z
# 正規表現の終わりを示す
/
# 大文字小文字を無視するオプション
i
# メールアドレスのバリデーション
# データベースによって扱いが異なるので、メールアドレスを全て小文字に変換
before_save { self.email = email.downcase }
VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
validates :email, presence: true, length: { maximum: 255 }, uniqueness: { case_sensitive: false }, format: { with: VALID_EMAIL_REGEX }
--------------------------------
# インデックスを後から追加する
rails g migration add_index_to_users_email
------------------
class AddIndexToUsersEmail < ActiveRecord::Migration[5.1]
   def change
     add_index :users, :email, unique: true
   end
end
------------------
--------------------------------
# ssl(https)接続を強制する
config/environments/production.rb
------------------
config.force_ssl = true
------------------
--------------------------------
# Action Cable
# アクションケーブル用のファイル作成
bin/rails g channel room speak
------------------
app/controllers/rooms_controller.rb 
app/javascript/channels/room_channel.js
app/channels/room_channel.rb 
--------------------------------
# Action Mailer
# アクションメーラー用のファイル作成
bin/rails g mailer UserMailer
EDITOR="vim" bin/rails credentials:edit
------------------
# sendgrid
   smtp_user_name:
   smtp_password:
------------------
------------------
app/controllers/users_controller.rb
app/mailers/application_mailer.rb 
app/mailers/user_mailer.rb 
app/views/user_mailer/welcome.html.erb 
app/views/user_mailer/welcome.text.erb
config/environment.rb
config/environments/development.rb 
test/mailers/previews/user_mailer_preview.rb 
--------------------------------
# Active Job
bin/rails g job async_log
gem 'sidekiq'
# sudo apt-get install redis
# 起動
# sudo systemctl start redis-server
docker pull redis
docker run -p 6379:6379 redis
bin/rails c
AsyncLogJob.perform_later(message: "from sidekiq")
bin/bundle exec sidekiq
AsyncLog.last
------------------
app/jobs/async_log_job.rb
config/application.rb
config/routes.rb
--------------------------------
# Active Strage
bin/rails active_storage:install
# モデル
has_one_attached :portrait
# 複数枚の場合
has_many_attached :portrait
# new
<div class="field">
   <%= form.label :portrait %
   <!-- ダイレクトアップロード -->
   <!-- multiple: trueで複数ファイル -->
   <%= form.file_field :portrait, direct_upload: true, multiple: true %
</div>
# ストロングパラメーター
params.require(:user).permit(:name, :email, portrait: [])
# Gemfile
gem 'image_processing', '~> 1.2'
# show
<p>
  <strong>Image:</strong>
  <% @user.portrait.each do |image| %
    <%= image_tag image.variant(resize_to_limit: [100, 100]) %
  <% end %>
</p>
------------------
app/controllers/users_controller.rb
app/models/user.rb
app/views/users/_form.html.erb
app/views/users/show.html.erb
--------------------------------
# Action Mailbox
bin/rails action_mailbox:install
bin/rails db:migrate
EDITOR="vim" bin/rails credentials:edit
------------------
action_mailbox:
   ingress_passeord: hoge
------------------
# 環境変数でも代用可能
# vim ~/.bash_profile
# ------------------
# RAILS_INBOUND_EMAIL_PASSWORD=''
# ------------------
# クラスを作る
bin/rails g mailbox comments
# クラスに処理を記載
# Web UI
http://localhost:3000/rails/conductor/action_mailbox/inbound_emails/new
Board.first.comments.map(&:body)
------------------
config/environments/production.rb
app/mailboxes/application_mailbox.rb
app/mailboxes/comments_mailbox.rb
--------------------------------
# Action Text
bin/rails action_text:install
bin/rails db:migrate
モデルに has_rich_text :hoge を記載
コントローラーでは.with_rich_text_nameを使う
