#pry-byebug
gem 'pry-byebug'
binding.pry
#view
<% binding.pry %


#RSpec
Gemfileに以下を追記
--------------------------------
group :test do
  　　:
      gem 'rspec-rails'
      gem "factory_bot_rails"
      gem 'rspec-parameterized'
      gem 'faker'
      gem 'shoulda-matchers'
      gem 'rails-controller-testing'
end
--------------------------------
bundle install
config/environments/test.rbを編集
--------------------------------
config.active_support.deprecation = :stderr
↓
config.active_support.deprecation = :silence
--------------------------------
rails db:migrate RAILS_ENV=test
#テスト実行
bundle exec rspec spec/ --format documentation


#テストの記述
#controller
#RSpecを先にインストールしていれば自動で作成されている
#rails g controller posts
spec/controllers/hoges_controller_spec.rb
--------------------------------
require 'rails_helper'
RSpec.describe PostsController, type: :controller do
    describe '新規投稿ページ' do
      context "新規投稿ページが正しく表示される" do
        before do
          get :new
        end
        it 'リクエストは200 OKとなること' do
          expect(response.status).to eq 200
        end
        render_views
        it 'タイトルが正しく表示されていること' do
            expect(response.body).to include("新規投稿")
        end
      end
    end
end

#ページが正しく表示されるか
response.status = 200
#htmlのデータが入っている
response.body
#文字列の検証
include("文字列")
--------------------------------

#model
#spec/models/hoge_spec.rb
--------------------------------
require 'rails_helper'
RSpec.describe Post, type: :model do
  #この行をコメントアウトする
  #pending "add some examples to (or delete) #{__FILE__}"
    
    context "データが正しく保存される" do
        before do
            @post = Post.new
            @post.title = "Hello World"
            @post.content = "今日も晴れです。"
            @post.save
        end
        it "全て入力してあるので保存される" do
            expect(@post).to be_valid
        end

        context "データが正しく保存されない" do
          before do
              @post = Post.new
              @post.title = ""
              @post.content = "今日も晴れです。"
              @post.save
          end
          it "titleが入力されていないので保存されない" do
              expect(@post).to be_invalid
              expect(@post.errors[:title]).to include("can't be blank")
          end
      end
    end
end

#データが保存されている
be_valid
#データが保存されていない
be_invalid