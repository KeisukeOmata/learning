let taxRate: Double = 1.08
func addTax(price: Int) -> Double {
    return Double(price) * taxRate
}

print(addTax(price: 46000))