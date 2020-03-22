rails s -b 0.0.0.0
localhost:3000

rails new hoge
rails g controller hoges new edit show index 
#rails g model Hoge name:stringでもよい 
rails g model Hoge name:string
マイグレーションファイルにカラムを追加
rails db:migrate
#カラムの追加と削除
# rails g migration AddNameToPosts category:string body:text
rails g migration Addカラム名Toテーブル名 カラム名:データ型 カラム名:データ型
rails g migration Removeカラム名Fromテーブル名 カラム名:型名
rails db:migrate
#必殺技
rails db:migrate:reset

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
rails g devise:controllers admins

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
