package main

import "fmt"

func main() {
	ask()
}

func ask() {
  var input string
	fmt.Println("次の単語を入力してください: dog")
	fmt.Scan(&input)
	fmt.Printf("%sと入力されました", input)
}