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
image_idカラムを追加
rails db:migrate
モデルに attachment :image を追加
runtimeエラーが出た場合は config/initializers/application_controller_renderer.rb にシークレットキーを追加