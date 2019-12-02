<?php
$menus = array(
  array('name' => 'CURRY', 'price' => 900),
  array('name' => 'PASTA', 'price' => 1200),
  array('name' => 'COFFEE', 'price' => 600)
);

foreach($menus as $menu) {
  echo "{$menu['name']}は{$menu['price']}円です";
}

?>