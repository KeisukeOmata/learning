<?php 
require_once('menu.php');

class Drink extends Menu {
  // $typeというprivateなプロパティを定義してください
  private $type;
  
  // getTypeメソッドを定義してください
  public function getType() {
    return $this->type;
  }
  
  // setTypeメソッドを定義してください
  public function setType($type) {
    $this->type = $type;
  }
  
}

?>