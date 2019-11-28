let entranceFee: Int = 1200

func halfPrice(_ price: Int) -> Int {
  return price / 2
}

func getPrice(age: Int) -> Int {
  if age <= 15 {
    let kidsEntranceFee: Int = halfPrice(entranceFee)
    return kidsEntranceFee
  } else {
    return entranceFee
  }   
}

print("23歳の入場料は、\(getPrice(age: 23))円です")
print("12歳の入場料は、\(getPrice(age: 12))円です")