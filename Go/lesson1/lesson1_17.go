package main

func main() {
	n := 3
	switch n {
	case  0:
		println("凶です")
	case 1, 2:
		println("吉です")
	case 3, 4:
		println("中吉です")
	case 5:
		println("大吉です")
	}
}