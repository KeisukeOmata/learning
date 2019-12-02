package main

import "fmt"

func main() {
	totalScore := ask(1, "dog")
	totalScore += ask(2, "cat")
	totalScore += ask(3, "fish")
	fmt.Println("スコア", totalScore)
}

// mainのtotalScoreがコピーされているが、元のtotalScoreは変更されない
func ask(number int, question string, totalScore int) int {
	var input string
	fmt.Printf("[質問%d] 次の単語を入力してください: %s\n", number, question)
	fmt.Scan(&input)
	fmt.Printf("%sと入力されました\n", input)
	if question == input {
		fmt.Println("正解!")
		// スコープの外では使えない
		totalScore += 10
		return 10
	} else {
		fmt.Println("不正解!")
		return 0
	}
}