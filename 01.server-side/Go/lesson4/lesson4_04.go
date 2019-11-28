package main

import "fmt"

func main() {
	name := "John"
	fmt.Println(name)
	var namePtr *string = &name
	*namePtr = "Kate"
	fmt.Println(name)
}