puts "数字を5つ入力してください"
a = []
for i in 0..4 do
  puts "#{i + 1}つ目の数字を入力してください"
  a[i] = gets.to_i
end
max = 0
for i in 0..4 do
  if a[i] > max
    max = a[i]
  end
end
puts "配列内の最大値は#{max}です"

# rubyではこう書く
max = a.max