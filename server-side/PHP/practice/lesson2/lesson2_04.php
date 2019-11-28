<?php
class Menu {
  public $name;
  
  public function hello() {
    echo "私はMenuクラスのインスタンスです";
  }
}

$curry = new Menu();
$pasta = new Menu();
$curry->name = 'CURRY';
$pasta->name = 'PASTA';
$curry -> hello();
echo '<br>';
$pasta -> hello();
?>