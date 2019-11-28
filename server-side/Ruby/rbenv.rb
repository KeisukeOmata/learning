sudo apt-get update
sudo apt-get upgrade
sudo apt-get install git build-essential libssl-dev
git clone https://github.com/sstephenson/rbenv.git ~/.rbenv
git clone https://github.com/sstephenson/ruby-build.git ~/.rbenv/plugins/ruby-build
gem install bundler
rbenv rehash
bundle install
vi ~/.bash_profile
---------------------------------------
export PATH="~/vagrant/.rbenv/shims:/usr/local/bin:$PATH"
eval "$(rbenv init -)"
---------------------------------------
source ~/.bash_profile 

rbenv install --list
rbenv install 2.5.5
rbenv global 2.5.5
rbenv local 2.5.5
rbenv rehash
rbenv versions

# できないときはこちら
sudo apt install build-essential
sudo apt install clang
sudo apt install libboost-all-dev
sudo apt-get install -y libreadline-dev