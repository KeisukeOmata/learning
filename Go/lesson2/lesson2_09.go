package main

import "fmt"
import "math/rand"
import "time"

func main() {
	rand.Seed(time.Now().Unix())
	for i := 1; i <= 4; i++ {
		fmt.Printf("%d回目の占い結果:", i)
		number := rand.Intn(6)
		switch number {
		  case 0:
			  fmt.Println("悪い")
		  case 1, 2:
			  fmt.Println("普通")
		  case 3, 4:
			  fmt.Println("良い")
		  case 5:
			  fmt.Println("すごく良い")
    }
	}
}