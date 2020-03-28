インスタンスの作成
#手順1：Amazonマシンイメージ
Amazon Linux AMI
#2. インスタンスタイプの選択
t2.micro
#3. インスタンスの設定
次の手順：ストレージの追加
#4. ストレージの追加
次の手順：タグの追加
#5. タグの追加
次の手順：セキュリティグループの設定
#6. セキュリティグループの設定
ルールの追加
#カスタムTCP
HTTP 80
#7. 確認
起動
キーペア名を入力しダウンロード
#キーペアをsshに移動
sudo mv ~/Downloads/キーペア名.pem ~/.ssh
#権限を変更
sudo chmod 600 ~/.ssh/キーペア名.pem
#サーバーにアクセス
ssh -i ~/.ssh/キーペア名.pem ec2-user@パブリックIPアドレス
#Permission deniedの場合
ls -ld ~/.ssh
chmod 700 ~/.ssh
sudo ls -l ~/.ssh/キーペア名.pem
sudo chmod 600 ~/.ssh/キーペア名.pem

#nginxのインストール
sudo yum install -y nginx
#自動で起動
sudo chkconfig nginx on
#起動
sudo service nginx start

#EIP
新しいアドレスの割り当て
割り当て
IPアドレス→アクション→アドレスの関連付け
#リソースタイプ
インスタンス
インスタンス選択→関連付け

#AMI(バックアップ)
EC2ダッシュボード→インスタンス
アクション→イメージ→イメージの作成
イメージ名、イメージの説明は任意→イメージの作成
#起動
アクションメニュー→起動
インスタンスの作成と同一
#5. タグの追加
キー:Hoge、値:hogehoge
既存のセキュリティグループを利用する
既存のキーペアを利用する

#RDS
すべてのサービス→データベース→RDS→データベースの作成
標準作成
#エンジンのオプション
MySQL
#バージョン
MySQL 5.7.22
#テンプレート
無料利用枠
#DBインスタンス識別子
hoge
#マスターユーザー名
#マスターパスワード情報
hoge
hogehoge
#DBインスタンスサイズ
バースト可能クラス
db.t2.micro
#接続
#追加の接続設定
#パブリックアクセス可能
あり
#追加設定
#最初のデータベースの名前
fuga
データベースの作成
*エンドポイントを確認

#セキュリティグループのルール
インバウンド→編集
#ソース
#/32を付ける
プライベートIPアドレス/32

#日本語対応
RDSダッシュボード→パラメータグループ
パラメータグループの作成
#パラメータグループファミリー
mysql5.7
#グループ名、説明
Hoge、fuga
パラメータグループアクション→編集
検索欄にcharacterで絞り込み
#character_set_client
utf8mb4
#character_set_client_handshake
変更なし（空欄まま）
#character_set_connection
utf8mb4
#character_set_database
utf8mb4
#character_set_filesystem
utf8mb4
#character_set_results
utf8mb4
#character_set_server
utf8mb4
#skip-character-set-client-handshake
1
検索欄にinnodb_fileで絞り込み
#innodb_file_format
Barracuda
#innodb_file_per_table
変更なし（「1」のまま）
検索欄にinnodb_largeで絞り込み
#innodb_large_prefix	
1
変更の保存

#パラメータグループを設定する
対象のDBの画面
設定→パラメータグループ
作成したパラメータグループを設定→次へ
#変更のスケジュール
すぐに適用
DBインスタンスの変更
アクション→再起動

#MySQLをインストール
sudo yum -y install mysql
#接続
#エンドポイントはRDSで確認
#パスワードはマスターパスワード
mysql -u マスターユーザー名 -p -h エンドポイント