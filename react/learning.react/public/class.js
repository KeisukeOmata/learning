export default class {
  // コンストラクタ
  constructor(r, g, b) {
    // プロパティ
    this.red = r;
    this.green = g;
    this.blue = b;
  }

  // メソッド
  // メソッドの中でプロパティを使うにはthisが必要
  print() {
    return '<p>RED: ' + this.red + '</p>'
      + '<p>GREEN:' + this.green + '</p>'
      + '<p>BLUE: ' + this.blue + '</p>';
  }
};