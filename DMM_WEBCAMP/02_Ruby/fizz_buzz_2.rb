def fizz_buzz(n)
    if n % 15 == 0
        "FizzBuzz"
    elsif n % 3 == 0
        "Fizz"
    elsif n % 5 == 0
        "Buzz"
    else
        n.to_s
    end
end

p "数字を入力"
input = gets.to_i
p "結果は"
p fizz_buzz(input)
