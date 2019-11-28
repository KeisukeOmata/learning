package main

import "fmt"
import "math/rand"

func main() {
	for i :=1; i <= 6; i++ {
    fmt.Println(rand.Intn(10))
	}
}