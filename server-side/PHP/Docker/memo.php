git clone　hoge
名前をアプリ名に変える、gitinitとかもよしなに
cd hoge
docker-compose up -d --build
docker-compose exec app ash
composer install
cp .env.example .env
php artisan key:generate
php artisan migrate
exit
http://127.0.0.1:10080/

起動
docker-compose up -d --build
停止
docker stop $(docker ps -q)
再起動
docker restart $(docker ps -q)

MySQL接続
docker-compose exec db bash -c 'mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}'

滅びの呪文
docker-compose down --volumes --rmi all
-------------------------------------------
コントローラーの作成
cd src
php artisan make:controller HogeController

マイグレーションファイルの作成
cd src
php artisan make:migration create_hoges_table --create=hoges
docker-compose exec app ash
php artisan migrate

モデルの作成
cd src
php artisan make:model Hoge
テストデータの挿入
php artisan make:seeder HogesTableSeeder
docker-compose exec app ash
composer dump-autoload
php artisan db:seed --class=FoldersTableSeeder
テストデータの確認
docker-compose exec db bash -c 'mysql -u${MYSQL_USER} -p${MYSQL_PASSWORD} ${MYSQL_DATABASE}'
SELECT * FROM hoges;