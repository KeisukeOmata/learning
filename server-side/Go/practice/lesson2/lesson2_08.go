package main

import "fmt"
import "math/rand"
import "time"

func main() {
	rand.Seed(time.Now().Unix())
	for i := 1; i <= 5; i++ {
		fmt.Println(rand.Intn(10))
	}
}