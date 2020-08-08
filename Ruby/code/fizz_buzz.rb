# 入力した文字を判定するFizzBuzz
def fizz_buzz(input_integer)
  if input_integer % 15 == 0
    "Fizz Buzz"
  elsif input_integer % 3 == 0
    "Fizz"
  elsif
    input_integer % 5 == 0
    "Buzz"
  else
    input_integer.to_s
  end
end

p "数字を入力してください"
input_integer = gets.to_i
p fizz_buzz(input_integer)

# 1から入力した文字まで出力するFizzBuzz
def fizz_buzz_2(end_number_integer)
  for i in 1..end_number_integer do
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

p "数字を入力してください"
end_number_integer = gets.to_i
fizz_buzz_2(end_number_integer)