<?php
class Menu {
  private $name;
  private $price;
  private $image;
  // $orderCountというプロパティを定義してください。ただし、初期値を数値の0としてください。
  private $orderCount = 0;
  
  public function __construct($name, $price, $image) {
    $this->name = $name;
    $this->price = $price;
    $this->image = $image;
  }
  
  public function hello() {
    echo '私は'.$this->name.'です';
  }
  
  public function getName() {
    return $this->name;
  }
  
  public function getImage() {
    return $this->image;
  }
  
  // getOrderCountメソッドを定義してください
  public function getOrderCount() {
    return $this->orderCount;
  }
  
  // setOrderCountメソッドを定義してください
  public function setOrderCount($orderCount) {
    $this->orderCount = $orderCount;
  }
  
  public function getTaxIncludedPrice() {
    return floor($this->price * 1.08);
  }
  
}
?>