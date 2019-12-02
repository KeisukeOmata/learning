package main

import "fmt"

func main() {
	ask(1, "dog")
	ask(2, "cat")
	ask(3, "fish")
}

func ask(number int, question string) {
  var input string
	fmt.Printf("[質問%d]次の単語を入力してください: %s\n", number,  question)
	fmt.Scan(&input)
	fmt.Printf("%sと入力されました", input)
} 