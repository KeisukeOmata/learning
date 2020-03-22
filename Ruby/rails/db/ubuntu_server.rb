# sshでログイン
ssh hoge@IPアドレス
# rubyのインストール
sudo add-apt-repository -y ppa:brightbox/ruby-ng
sudo apt-get update
sudo apt-get -y install ruby2.3
# 周辺アプリケーションのインストール
sudo apt-get -y install ruby2.3-dev nodejs libcurl4-openssl-dev apache2-dev libapr1-dev libaprutil1-dev libxml2 libxslt-dev build-essential patch
sudo apt-get -y install libssl-dev
--------------------------
# ruby2.3-dev : ruby2.3のライブラリ
# nodejs : jsのruntimeソフト
# libcurl4-openssl-dev : openssl用のライブラリ
# apache2-dev : apacheを開発するためのヘッダファイルを含んだパッケージ
# libapr1-dev : apacheのポータブルランタイムライブラリ
# libaprutil1-dev : apacheのポータブルランタイムライブラリの開発用ライブラリ
# build-essential patch : nokogiriに必要
--------------------------
# MySQLのインストール
sudo apt-get -y install mysql-server libmysqlclient-dev
# SQLite3の場合
# sudo apt-get -y install sqlite3 libsqlite3-dev

# MySQLのUTF-8対応
vi /etc/mysql/my.cnf
--------------------------
[client]
default-character-set = utf8

[mysqld]
skip-character-set-client-handshake
character-set-server = utf8
collation-server = utf8_general_ci
init-connect = SET NAMES utf8

[mysqldump]
default-character-set = utf8

[mysql]
default-character-set = utf8
--------------------------
# railsやapacheのインストール
sudo gem install rails -v 5.2.3
sudo apt-get -y install apache2
sudo gem install -v 5.1.12 passenger
sudo passenger-install-apache2-module
vi /etc/apache2/apache2.conf
-------------------------------------
LoadModule passenger_module /var/lib/gems/2.3.0/gems/passenger-5.1.12/buildout/apache2/mod_passenger.so
<IfModule mod_passenger.c>
  PassengerRoot /var/lib/gems/2.3.0/gems/passenger-5.1.12
  PassengerDefaultRuby /usr/bin/ruby2.3
</IfModule>
-------------------------------------
# デプロイ
sudo apt install git
# 公開鍵を登録
./root/.ssh/id_rsa.pub
vi id_rsa.pub
GitHubへ登録
cd /var/www/
# ファイルやディレクトリの検索は find ./ -name .ssh
# 権限を調べるときは ls -l
sudo chown -R root:root html
cd html
git clone アドレス
# ブランチをクローンするときは git clone -b ブランチ名 アドレス

vi /etc/apache2/sites-available/000-default.conf
-------------------------------------
<VirtualHost *:80>
  ServerName パブリックDNS
  DocumentRoot /var/www/html/hoge/public
  <Directory /var/www/html/hoge/public>
    SetEnv RAILS_ENV production
    # This relaxes Apache security settings.
    AllowOverride all
    # MultiViews must be turned off.
    Options -MultiViews
    Require all granted
  </Directory>
</VirtualHost>
-------------------------------------
# 設定の有効化
# sudo a2ensite 000-default.conf
sudo a2ensite
# 設定の無効化
sudo a2dissite
sudo /etc/init.d/apache2 restart

# バンドルインストール
vi Gemfile
-------------------------------------
gem 'json'
gem 'mysql2'
#gem 'listen', '>= 3.0.5', '< 3.2'
gem 'listen', '>= 3.0.5', '< 3.2'
-------------------------------------
cd /var/www
sudo chown -R root:root .
cd アプリ名
bundle install --path vendor/bundle --without test development

# 環境変数にDBのパスワードを追加
vim ~/.bash_profile
export HOGE_DATABASE_PASSWORD='hogehoge'
source ~/.bash_profile

# デプロイ後にGit pullするとき
cd アプリ名
sudo git pull origin master
cd ..
sudo chown -R root:root .
cd アプリ名
bundle exec rake assets:precompile RAILS_ENV=production
bundle exec rake db:migrate RAILS_ENV=production
sudo /etc/init.d/apache2 restart

# 再起動
sudo service apache2 restart
sudo /etc/init.d/apache2 restart
# 起動
sudo service apache2 start
# 停止
sudo service apache2 stop

# Passengerの確認
passenger-status
# Passenngerのエラー
sudo vi /lib/systemd/system/apache2.service
PrivateTmp=false
sudo /etc/init.d/apache2 restart
systemctl daemon-reload
# コンフィグファイルをpassenger.confとして作成した場合
sudo a2enconf passenger

# エラーログの確認
vi /var/log/apache2/error.log
# こんなの探す
Message from application: bootsnap doesnt have permission to write cache entries in
App 19449 stderr: Rails Error:
Message from application: Permission denied - bs_fetch:atomic_write_cache_file:open (Errno::EACCES)

# config/boot.rb
require 'bootsnap/setup'をコメントアウト

# Rails Error: Unable to access log file. Please ensure that /var/www/html/hoge/log/production.log
chmod 777 production.log
vi /var/www/html/hoge/log/production.log