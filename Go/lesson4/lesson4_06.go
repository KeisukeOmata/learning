package main

import "fmt"

func main() {
	totalScore := 0
	fn(totalScore)
	fmt.Println(totalScore)
	// &と付けるとアドレス
	fmt.Println(&totalScore)
}

func fn(totalScore int) {
	totalScore += 10
	fmt.Println(totalScore)
	fmt.Println(&totalScore)
}