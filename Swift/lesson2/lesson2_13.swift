let user: [String: String] = [
  "name": "Omata", 
  "email": "omata@example.com"
]

if let name: String = user["name"] {
  print("名前は\(name)です")
}

if let address: String = user["address"] {
  print("住所は\(address)です")
}