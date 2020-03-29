#ライブラリの読み込み
require "ライブラリ名"
#フォルダを基準にライブラリを読み込む
require_relative "ライブラリ名"

#.rbは不要
#hello.rbを読み込む
require "hello"
hello()
------------------------
#例
#grep.rb
def grep(pattern, filename)
  file = File.open(filename)
  file.each_line do |line|
    if pattern =~ line
      print line
    end
  end
  file.close
end
#ライブラリの読み込み
require "grep"
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]
#ライブラリの起動
grep(pattern, filename)
#コマンドライン
ruby grep.rb パターン名 ファイル名
------------------------
#dateライブラリ
require "date"
#本日日付を取得
Date.today
#特定の日付のオブジェクトを作成
Date.new(yyyy, mm, dd)
------------------------
require "pp"
#適当に改行を行ってくれる
pp ハッシュ
------------------------