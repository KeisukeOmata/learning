例外処理

begin
  例外を発生させる可能性のある処理
rescue case1, case2 => 変数
  例外が起こった場合の処理
  #begin以下をやり直す
  retry
rescue case3 => 変数
  例外が起こった場合の処理
ensure
  例外の有無にかかわらず実行される処理
end

#例外処理のみ
式1 rescue 式2

#beginとendを省略
def hoge
  命令
rescue => exception
  例外処理
ensure
  後処理
end
-------------------------
def file(file)
  src = File.open(file)
end

begin
  file(file)
rescue => exception
  p exception.message
ensure
  src.close
end
-------------------------