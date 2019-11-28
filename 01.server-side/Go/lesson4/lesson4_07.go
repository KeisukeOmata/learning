package main

import "fmt"

func main() {
	a := 10
	b := 10
	calculate(a, &b)
	fmt.Println("引数に整数を指定した場合：", a)
	fmt.Println("引数にポインタを指定した場合：", b)
}

func calculate(a int, bPtr *int) {
	a += 1
	*bPtr += 1
}