//入力した数字を判定するFizzBuzz
func fizzBuzz(inputInt: Int) {
  if inputInt % 15 == 0 {
    print("FizzBuzz")
  } else if inputInt % 3 == 0 {
    print("Fizz")
  } else if inputInt % 5 == 0 {
    print("Buzz")
  } else {
    print("\(inputInt)")
  }
}

//1から渡した数字まで出力するFizzBuzz
func fizzBuzz2(endNumberInt: Int) {
  for i in 1...endNumberInt {
    if i % 15 == 0 {
      print("FizzBuzz")
    } else if i % 3 == 0 {
      print("Fizz")
    } else if i % 5 == 0 {
      print("Buzz")
    } else {
      print("\(i)")
    } 
  }
}