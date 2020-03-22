アプリ直下に spec フォルダを配置
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