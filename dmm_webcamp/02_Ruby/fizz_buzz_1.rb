def fizz_buzz()
    p "数字を入力"
    n = gets.to_i
    for i in 1..n do
        if i % 15 == 0
            p "FizzBuzz"
        elsif i % 3 == 0
            p "Fizz"
        elsif i % 5 == 0
            p "Buzz"
        else
            p i
        end
    end
end

fizz_buzz()