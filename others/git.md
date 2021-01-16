echo "# hoge" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:KeisukeOmata/hoge.git
git push -u origin master
----------------------------------
git branch
git branch omata
git checkout omata
git add -A
git commit -m "hoge"
git push origin omata
----------------------------------
# gitignoreに追加する前にpushしてしまった場合
# キャッシュ削除
git rm -r --cached .
----------------------------------
# コミットを間違えた時
# 1つ前に戻す
git reset --soft HEAD^
----------------------------------
# 更新したファイルを確認
git status
# 差分確認
git diff 
----------------------------------
# ローカルで削除したファイルをcommitに含める
git rm
----------------------------------
# ブランチの行き来
# まずは今のブランチにコミット
git commit
# ブランチを切ってプルする
git branch
git checkout
git pull
# 再度移動するときはコミット
git commit
----------------------------------
# リポジトリ統合
cd learning 
mkdir fav_map_rails
touch fav_map_rails/.gitkeep 
git add -A fav_map_rails
git commit -m "Add fav_map_rails"
git remote add fav_map_rails ../fav_map_rails
git fetch fav_map_rails
git merge --allow-unrelated-histories -X subtree=fav_map_rails fav_map_rails/master
rm fav_map_rails/.gitkeep