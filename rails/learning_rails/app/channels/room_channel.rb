class RoomChannel < ApplicationCable::Channel
  # 購読 => チャネルとクライアントとの関連付けのこと
  # 購読後に呼ばれる
  def subscribed
    # ブロードキャスト用のストリーム名を設定
    stream_from "room_channel"
  end

  # 購読解除後に呼ばれる
  def unsubscribed
  end

  # speakメソッド
  def speak(data)
    # テキストを保存
    message = Message.create!(content: data["message"])
    ActionCable.server.broadcast(
      # ③ストリーム名"room_channel"にmessageを送信
      "room_channel", { message: render_message(message) }
    )
  end

  private

  def render_message(message)
    # テンプレートのレンダリングを行う
    ApplicationController.render(
      partial: "messages/message",
      locals: { message: message }
    )
  end
end
