#入力
#引数から取得したデータを"文字列"で持つ
ruby hoge.rb hoge fuga
ARGV[0] => hoge
ARGV[1] => fuga
------------------------
#ファイル
filename = ARGV[0]
#ファイルを開く
file = File.open(filename)
#ファイルのテキストデータを読み込む
text = file.read
#読み込んだテキストデータを出力する
print text
#ファイルを閉じる
file.close

#1行で書く
print File.read(ARGV[0])
------------------------
#ファイルを1行ずつ読み込む
filename = ARGV[0]
file = File.open(filename)
file.each_line do |line|
  print line
end
file.close
------------------------
#grep.rb
#正規表現オブジェクトを作る
Regexp.new(str)
pattern = Regexp.new(ARGV[0])
filename = ARGV[1]

file = File.open(filename)
file.each_line do |line|
  if pattern =~ line
    print line
  end
end
file.close

ruby grep.rb パターン ファイル名