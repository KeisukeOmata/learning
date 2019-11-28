package main

func main() {
	money := 200
	price := 200
	if money > price {
		println("商品を買うことができます")
	} else if money == price {
		println("商品を買うことができますが所持金が0円になります")
	} else {
		println("お金が足りません")
	}
}