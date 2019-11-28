<?php
$prices = array(1000, 650, 750, 800);
echo '$pricesの値: ';
foreach ($prices as $price) {
  echo $price.' ';
}
echo '<br>';
echo '-----';
echo '<br>';

$l = count($prices);
$all = 0;
for($i = 0; $i < $l; $i++) {
  $all += $prices[$i];
}
echo "合計金額は{$all}円です";

?>