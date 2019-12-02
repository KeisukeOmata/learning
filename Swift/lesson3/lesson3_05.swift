func printPrice(price: Int, productName: String = "この商品") {
    print("\(productName)は\(price)円です")
}

printPrice(price: 92000, productName: "PC")
printPrice(price: 46000)