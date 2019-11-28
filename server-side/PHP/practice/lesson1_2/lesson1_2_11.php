<?php
$menus = array(
  array('name' => 'CURRY', 'price' => 900),
  array('name' => 'PASTA', 'price' => 1200),
  array('name' => 'COFFEE', 'price' => 600)
);

$all = 0;
$highPrice = 0;
$highMenu = "a";
foreach($menus as $menu) {
  echo "{$menu['name']}は{$menu['price']}円です";
  $all += $menu['price'];
  if($highPrice < $menu['price']) {
    $highPrice = $menu['price'];
    $highMenu = "{$menu['name']}";
  }
}
echo "合計金額は{$all}円です";
echo "{$highMenu}が最高価格で{$highPrice}円です";

?>