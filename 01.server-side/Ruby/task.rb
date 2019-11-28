gem 'whenever'
budle install
cd アプリ
wheneverize .
config/schedule.rb

cd config/locales/application.rb
------------------------------
config.autoload_paths += Dir["#{config.root}/lib/**/"]
config.eager_load_paths += Dir["#{config.root}/lib/**/"]
------------------------------

rails g task hoge
cd lib/tasks/hoge.rake
------------------------------
namespace :hoge do
  desc "説明を入力"
  #モデルにアクセスする場合は :enviromentを付ける
  task :hoge_task => :environment do
    hoge = Hoge.new(hoge: hoge)
    hoge.save
  end    
end
------------------------------
# taskが実行できるか確認
rake hoge:hoge_task

cd config/schedule.rb
------------------------------
require File.expand_path(File.dirname(__FILE__) + "/environment")
set :environment, "development"
set :output, 'log/cron.log'
env :PATH, ENV['PATH']

every 1.minute do
  rake 'hoge:hoge_task'
end
------------------------------
bundle exec whenever --update-crontab 
bundle exec whenever --clear-crontab
# 開発環境の場合は
RAILS_ENV=development bundle exec whenever --update-crontab;
RAILS_ENV=development bundle exec whenever --clear-crontab;