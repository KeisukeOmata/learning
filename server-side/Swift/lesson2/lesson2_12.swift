let user: [String: String] = [
    "name": "Omata", 
    "email": "omata@example.com"
]
if user["name"] != nil {
  let name: String = user["name"]!
  print(name)
}