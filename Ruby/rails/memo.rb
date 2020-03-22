rails s -b 0.0.0.0
  rails new hoge
  rails g model Hoge name:string
  マイグレーションファイルにカラムを追加
  rails db:migrate
  rails g migration Addカラム名Toテーブル名 カラム名:データ型 カラム名:データ型
  # $ rails g migration AddNameToPosts name:string
  # https://ruby-rails.hatenadiary.com/entry/20140810/1407634200#migration-change-column-null
  rails g controller blogs show index new edit
  # $ rails g devise:controllers admins