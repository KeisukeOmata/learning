import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  // 接続時
  connected() {
    document.
      querySelector('input[data-behavior="room_speaker"]').
      addEventListener('keypress', (event) => {
        if (event.key === 'Enter') {
          // ①エンターキーが押された時にspeakメソッドを呼び出す
          this.speak(event.target.value);
          // フォームを初期化
          event.target.value = '';
          // イベントを終了
          return event.preventDefault();
        }
      });
  },

  // 切断時
  disconnected() {
  },

  // ④サーバーからの通信を受信したとき
  received(data) {
    const element = document.querySelector('#messages')
    // テキストを最後の子要素の後に挿入する
    element.insertAdjacentHTML('beforeend', data['message'])
  },

  // speakメソッド
  speak: function (message) {
    // ②サーバーサイドのspeakメソッドを呼び出す
    return this.perform('speak', {message: message});
  },
});
