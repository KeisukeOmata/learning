# Active jobによる非同期実行
# rails g model async_log message
# rails db:migrate
# rails g job async_log
# rails c
# AsyncLogJob.perform_later
# 起動間隔や引数を指定
# AsyncLogJob.set(wait: 1.minute).perform_later(message: "fuga")

class AsyncLogJob < ApplicationJob
  queue_as :default

  def perform(message: "hello")
    AsyncLog.create!(message: message)
  end

end
