package main

func main() {
	x := 20
	if x >= 10 && x <= 30 {
		println("xは10以上30以下です")
	}
	y := 60
	if 10 > y || 30 < y {
		println("yは10未満または30より大きいです")
	}
	z := 55
	if !(z ==  77) {
		println("zは77ではありません")
	}
}