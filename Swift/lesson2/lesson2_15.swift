let user: [String: Int] = [
  "age": 10,
  "height": 151
]

if let age = user["age"] {
  print("年齢は\(age)歳です")
} else {
  print("年齢は定義されていません")
}