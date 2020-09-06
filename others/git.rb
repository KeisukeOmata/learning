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