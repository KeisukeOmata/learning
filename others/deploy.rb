#初期設定
#rubyをアンインストール
sudo yum remove -y ruby*
#rubyをインストール
sudo yum install -y ruby23 ruby23-devel
#必要なパッケージをインストール
sudo yum -y install gcc-c++ patch openssl-devel readline readline-devel libyaml-devel zlib zlib-devel libffi-devel make bzip2 autoconf automake libtool bison iconv-devel ImageMagick ImageMagick-devel libcurl-devel httpd-devel apr-devel apr-util-devel git sqlite-devel mysql-devel
#Nodeをインストール
curl --silent --location https://rpm.nodesource.com/setup_6.x | sudo bash -
sudo yum install -y nodejs
#bundlerをインストール
sudo gem install bundler
#railsをインストール
sudo gem install rails -v 5.2.3
#Passengerをインストール
sudo gem install -v 5.1.12 passenger
#以下コマンド実行時は全てリターンキー
sudo /usr/local/bin/passenger-install-apache2-module
#Apacheの設定ファイルの最後の行に追記
vi /etc/httpd/conf/httpd.conf
----------------------------
LoadModule passenger_module /usr/local/share/ruby/gems/2.3/gems/passenger-5.1.12/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /usr/local/share/ruby/gems/2.3/gems/passenger-5.1.12
  PassengerDefaultRuby /usr/bin/ruby2.3
</IfModule>
----------------------------
#確認
passenger-config --version
#Apacheを再起動
sudo service httpd restart

#git clone
cd /var/www/
#htmlフォルダのオーナーとグループをec2-userに変更
sudo chown -R ec2-user:ec2-user html
cd html
git clone https://github.com/hoge/hoge.git

#Apacheの設定ファイルの最後の行に追記
vi /etc/httpd/conf/httpd.conf
----------------------------
<VirtualHost *:80>
# 「EC2インスタンスのパブリックDNS」のところは、自身のパブリックDNSに変更してください。
   ServerName ec2-3-114-106-195.ap-northeast-1.compute.amazonaws.com
   # !!! Be sure to point DocumentRoot to 'public'!
#ご自身のアプリをデプロイする時はmeshiterro-demoの部分を変更してください。
   DocumentRoot /var/www/html/BandBund/public
   <Directory /var/www/html/BandBund/public>
      SetEnv RAILS_ENV production
      # This relaxes Apache security settings.
      AllowOverride all
      # MultiViews must be turned off.
      Options -MultiViews
      # Uncomment this if you're on Apache >= 2.4:
      #Require all granted
   </Directory>
</VirtualHost>
----------------------------

#Gemfile
gem 'json'
gem 'mysql2'
#既に記載されている'listen', '>= 3.0.5', '< 3.2'をコメントアウト
#gem 'listen', '>= 3.0.5', '< 3.2'
#最終行に追記
gem 'listen', '>= 3.0.5', '< 3.2'
#Your Ruby version is 2.3.8, but your Gemfile specified 2.5.3エラーとなる場合はviでバージョン2.3.8に変更
bundle install --path vendor/bundle --without test development
#データベースへの接続設定の修正
vi config/database.yml
----------------------------
production:
  <<: *default
  database: BandBund
  adapter: mysql2
  encoding: utf8mb4
  collation: utf8mb4_general_ci
  #RDSのエンドポイント名
  host: rds-mysql-server.cx0qmvhk3rmn.ap-northeast-1.rds.amazonaws.com
  #RDSのマスターユーザーネーム
  username: hoge
  #RDSのマスターパスワード
  password: hogehoge
----------------------------

#RDSにデータベースを作成する
#接続
#エンドポイントはRDSで確認
#求められるパスワードはマスターパスワード
mysql -u マスターユーザー名 -p -h エンドポイント
mysql> create database hoge;

#AWSから抜ける
#プロジェクト準備
vagrant環境内でrails --version
#5.2以上
scp -i ~/.ssh/キーペア名.pem master.key ec2-user@パブリックIP:/var/www/html/アプリ名/config
#5.1.〇
bundle exec rake secret
vi config/secrets.yml
4e3a82cc838104cceb6eb6f8c5c4a932e...（略）
----------------------------
production:
  secret_key_base: 4e3a82cc838104cceb6eb6f8c5c4a932e...（略）
----------------------------

#AWSに戻る
#マイグレーションファイルを全て編集
vi db/migrate/hoge.rb
#以下を追記
:options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC'
----------------------------
def change
  create_table :users, :options => 'ENGINE=InnoDB ROW_FORMAT=DYNAMIC' do |t|
----------------------------
vi config/initializers/devise.rb
#以下のコメントアウトを外す
config.secret_key = '834ea130dc4bb00851b7cc8aedf3ae3495c...（略）'
bundle exec rake assets:precompile RAILS_ENV=production
#Yarnのエラーは放置
bundle exec rake db:migrate RAILS_ENV=production
cd /var/www
sudo chown -R ec2-user:apache html
sudo service httpd restart

#git pull
ssh -i ~/.ssh/キーペア名.pem ec2-user@パブリックIP
cd /var/www/html/アプリ名/
sudo git pull origin master
cd..
sudo chown -R ec2-user:ec2-user .
cd アプリ名
bundle exec rake assets:precompile RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
cd /var/www
sudo chown -R apache:apache html
sudo service httpd restart

#git pullできないとき
sudo git checkout HEAD app/views/spots/index.html.erb

#GemfileもHEADしたとき
sudo git checkout HEAD Gemfile
#Gemfileに追記
gem 'json'
gem 'mysql2'
テストのgem 'listen', '>= 3.0.5', '< 3.2'をコメントアウト
gem 'listen', '>= 3.0.5', '< 3.2'
Ruby version is 2.3.8
gem 'responders', '~> 2.4.1'
mv Gemfile.lock Gemfile.lock6
bundle install --path vendor/bundle --without test development
#git pullへ戻る

#エラーログ
/var/log/httpd/error_log
/var/www/html/アプリ名/log/production.log 