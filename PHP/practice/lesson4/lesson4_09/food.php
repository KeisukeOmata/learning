<?php 
require_once('menu.php');

class Food extends Menu {
  // $spicinessというprivateなプロパティを定義してください
  private $spiciness;
  
  // 親クラスの__constructをオーバーライドしてください
  public function __construct($name, $price, $image, $spiciness) {
    parent::__construct($name, $price, $image);
    $this->spiciness = $spiciness;
  }
  
  // getSpicinessメソッドを定義してください
  public function getSpiciness() {
    return $this->spiciness;
  }
  
}

?>