puts "素因数分解する数字を入力してください"
array = []
n = gets.to_i
a = 2
while n >= a * a do
  if n % a == 0
    array.push(a)
    n /= a
  else
    a += 1
  end
end
array.push(n)
puts "結果は"
puts array

# rubyではこう書く
n = 100
require 'prime'
p Prime.prime_division(n)