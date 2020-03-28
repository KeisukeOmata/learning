puts "1つ目の時刻を入力してください。"
puts "時"
h1 = gets.to_i
puts "分"
m1 = gets.to_i
puts "秒"
s1 = gets.to_i
puts "2つ目の時刻を入力してください。"
puts "時"
h2 = gets.to_i
puts "分"
m2 = gets.to_i
puts "秒"
s2 = gets.to_i
# それぞれの時間を秒に変換
second1 = h1 * 3600 + m1 * 60 + s1
second2 = h2 * 3600 + m2 * 60 + s2
# 差分を求める
if second1 > second2
  diff = second1 - second2 
else
  diff = second2 - second1
end 
h = diff / 3600
#余り(分)をnに代入
n = diff % 3600
m = n / 60
# 余り(秒)をsに代入
s = n % 60
puts "時刻の差分は#{h}時間#{m}分#{s}秒です"