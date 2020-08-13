echo "# hoge" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:KeisukeOmata/hoge.git
git push -u origin master
git branch
git branch omata
git checkout omata
git add -A
git commit -m "hoge"
git push origin omata