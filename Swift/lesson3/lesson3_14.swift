func average(_ numbers: Int...) -> Int {
  var sum: Int = 0
  for number in numbers {
    sum += number
  }   
  return sum / numbers.count
}

print(average(60, 95, 77, 83, 52))