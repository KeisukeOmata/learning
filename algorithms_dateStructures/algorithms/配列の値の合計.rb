puts "数字を5つ入力してください"
a = []
for i in 0..4 do
  puts "#{i + 1}つ目の数字を入力してください"
  a[i] = gets.to_i
end
sum = 0
for i in 0..4 do
  sum += a[i]
end
puts "数字の合計は#{sum}です"

# rubyではこう書く
sum = a.inject(:+)