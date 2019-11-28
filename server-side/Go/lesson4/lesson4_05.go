package main

import "fmt"

func main() {
	name := "John"
	fmt.Println(name)
	changeName(&name)
	fmt.Println(name)
}

func changeName(namePtr *string) {
  *namePtr = "Kate"
}