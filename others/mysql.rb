# インストール
brew install mysql
mysql --version
# 起動
mysql.server start
# パスワード無しでログイン
mysql.server start --skip-grant-tables
# 停止
mysql.server stop
#root実行
mysql -uroot
# docker-composeでの起動
docker-compose exec mysql mysql -u root -p
------------------------------------
# DB作成
CREATE DATABASE hoge;
# DB一覧
show databases;
# DB削除
drop database hoge;
# 使用するDBを選択
USE Hoge
# select文
SELECT * FROM hoges;
# delete文
DELETE FROM hoges WHERE id=;
# ユーザー作成
CREATE USER 'hoge'@'localhost' IDENTIFIED BY 'hogehoge';
# ユーザー一覧
select user, host from mysql.user;
------------------------------------
# ERROR! The server quit without updating PID file (/usr/local/var/mysql/MacBook.local.pid).
# pidファイル作成
# マシン名は uname -n で調べる
touch /usr/local/var/mysql/MacBook.local.pid
# pidファイルに権限付与
sudo chown -R _mysql:_mysql /usr/local/var/mysql/MacBook.local.pid
mysql.server start
------------------------------------
# mysql再インストール
sudo rm -rf /usr/local/var/mysql
brew uninstall mysql
sudo rm -rf /usr/local/mysql
sudo rm -rf /Library/StartupItems/MYSQL
sudo rm -rf /Library/PreferencePanes/MySQL.prefPane
sudo rm -rf /Library/Receipts/mysql-.pkg
sudo rm -rf /usr/local/Cellar/mysql*
sudo rm -rf /usr/local/bin/mysql*
sudo rm -rf /usr/local/var/mysql*
sudo rm -rf /usr/local/etc/my.cnf
sudo rm -rf /usr/local/share/mysql*
sudo rm -rf /usr/local/opt/mysql
brew install mysql
mysql.server start
-----------------------------------------
# ubuntuにmysqlをインストールする
sudo apt-get update
sudo apt-get install aptitude
sudo aptitude update
sudo aptitude safe-upgrade
sudo aptitude install mysql-server
# IDとパスワードを設定する
mysql_secure_installation

# アンインストール
sudo apt-get remove --purge mysql-server* mysql-common 
sudo apt-get autoremove --purge 
sudo rm -r /etc/mysql
sudo rm -r /var/lib/mysql
sudo apt-get remove --purge mysql-server mysql-client mysql-common && sudo apt-get autoremove && sudo apt-get autoclean && sudo deluser mysql && sudo rm -rf /var/lib/mysql && sudo apt-get purge mysql-server-core-5.7 && sudo apt-get purge mysql-client-core-5.7 && sudo rm -rf /var/log/mysql && sudo rm -rf /etc/mysql
-----------------------------------------
# 状態を確認
sudo service mysql status
# MySQLサーバを停止
sudo service mysql stop
# MySQLサーバを開始
sudo service mysql start
# ログイン
sudo mysql -uroot
-----------------------------------------
# railsのDBをmysqlにする
rails new hoge -d mysql
config/database.ymlにrootのパスワードを入力
rails g model Hoge カラム名:データ型
データベース作成
rails db:migrate
-----------------------------------------
DBダンプの書き出し
mysqldump -u root -p -t データベース名 テーブル1 テーブル2> mysql.dump
-----------------------------------------
# rootのパスワードが設定できなかった場合
sudo rm -f /var/run/mysqld/mysqld.sock
sudo rm -f /tmp/mysql.sock
sudo /etc/init.d/mysql start
sudo /etc/init.d/mysql stop
sudo mysqld_safe --skip-grant-tables &
# 別のターミナルで以下を実行
mysql -u root
sudo mkdir /var/run/mysqld/
sudo chown mysql:mysql /var/run/mysqld/
cd /var/run/mysqld
sudo touch mysqld.sock
sudo chown mysql:mysql /var/run/mysqld/mysqld.sock
sudo chmod 777 mysqld.sock
# 元のターミナルで以下を実行
sudo mysqld_safe --skip-grant-tables &
# 別のターミナルで以下を実行
sudo mysql -u root
# MySQL内で以下を実行
update mysql.user set authentication_string=PASSWORD('hogehoge') where user='root';
--------------------------------------------
# 正規化
# 第一正規化
繰り返しているカラムをPKと一緒に抜き出す
=>オーダー(PK)に含まれる商品A,b,c...
# 第二正規化
PKに関数従属するカラムを抜き出す
=>商品番号(PK)が分かれば、商品名や単価が分かる
# 第三正規化
PK以外に関数従属するカラムを抜き出す
=>ユーザーIDが分かれば、氏名や住所が分かる
# FK(外部キー)
テーブルに、別のテーブルの項目しか入力できないようにする制約
=>オーダーテーブルのユーザーIDの列に、ユーザーテーブルのユーザーIDの列を外部キーとして設定
=>ユーザーテーブルに登録されていないユーザーIDをオーダーテーブルに誤って入力してしまうことを防げる
--------------------------------------------
# 集約関数
SELECT 集約関数(カラム名) FROM テーブル名;
# 内部結合
SELECT ＊ FROM テーブル名 INNER JOIN テーブル名 ON 結合条件；
=>一致したもののみ取り出す
# 外部結合
SELECT * FROM テーブル名 LEFT OUTER JOIN テーブル名 ON 結合条件；
=>一致したもの + FROMで指定したテーブルのレコード全て
=>SELECT * FROM オーダー LEFT OUTER JOIN ユーザー ON 結合条件であればオーダーは全て取り出される
# 副問合せ
SELECT オーダーID, 金額 FROM オーダー WHERE 金額 = (SELECT MAX(金額) FROM オーダー)；
WHERE EXISTS () => trueならば、主問合せの結果を返す