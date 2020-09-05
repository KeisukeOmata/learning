# Rubyのインストール
1. git clone https://github.com/rbenv/rbenv.git ~/.rbenv
2. echo 'export PATH="$HOME/.rbenv/bin:$PATH"' >> ~/.zshrc
3. ~/.rbenv/bin/rbenv init
----------------------------
# Load rbenv automatically by appending
# the following to ~/.bash_profile:

eval "$(rbenv init -)"
----------------------------
4. vi .bash_profileで3の内容を.bash_profileに追記
5. mkdir -p "$(rbenv root)"/plugins
6. git clone https://github.com/rbenv/ruby-build.git "$(rbenv root)"/plugins/ruby-build
7. rbenv install 2.6.6
8. rbenv versions
9. rbenv global 2.6.6
# できなければこちら
vi /home/vagrant/.ruby-version
10. ruby -v
# rbenvとruby-buildのアップデート
cd ~/.rbenv
git pull origin master
cd ~/.rbenv/plugins/ruby-build
git pull origin master