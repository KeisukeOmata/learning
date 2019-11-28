<?php 
require_once('menu.php');

class Drink extends Menu {
  private $type;
  
  // Menuクラスの__constructをコピーしてください
  // 引数に$typeを追加してください
  public function __construct($name, $price, $image, $type) {
    $this->name = $name;
    $this->price = $price;
    $this->image = $image;
    self::$count++;
    // typeプロパティに$typeを代入してください
    $this->type = $type;
    
  }
  
  public function getType() {
    return $this->type;
  }
  
  public function setType($type) {
    $this->type = $type;
  }
  
}

?>