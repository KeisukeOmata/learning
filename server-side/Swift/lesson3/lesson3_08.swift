func addTax(price: Int) -> Double {
    let taxRate: Double = 1.08
    return Double(price) * taxRate
}

print(addTax(price: 46000))
// スコープの外ではエラー
print(taxRate)