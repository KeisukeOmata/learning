let user: [String: String] = [
    "name": "Suzuki", 
    "email": "suzuki@example.com"
]

if let name: String = user["name"] {
  print("名前は\(name)です")
} else {
  print("名前は定義されていません")
}

if let address: String = user["address"] {
    print("住所は\(address)です")
} else {
  print("住所は定義されていません")
}