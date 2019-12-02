package main

import "fmt"

func main() {
	name := "John"
	fmt.Println(name)            
	fmt.Println(&name)
	var namePtr *string = &name 
	fmt.Println(namePtr)
}