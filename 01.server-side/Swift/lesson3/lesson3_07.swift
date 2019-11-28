func difference(price1: Int, price2: Int) -> Int {
  if price2 > price1 {
    return price2 - price1
  } else {
    return price1 - price2
  }
}

print(difference(price1: 48000, price2: 17000))
print(difference(price1: 17000, price2: 48000))