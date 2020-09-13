# AsyncLogJob.perform_later
# 起動間隔や引数を指定
# AsyncLogJob.set(wait: 1.minute).perform_later(message: "fuga")

class AsyncLogJob < ApplicationJob
  # ジョブの内容でキューを決める
  # ジョブの例外処理はSidekiqで指定
  queue_as do
    case self.arguments.first[:message]
    when "to async_log"
      :async_log
    else
      :default
    end
  end

  def perform(message: "hello")
    AsyncLog.create!(message: message)
  end

end
