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

$high = 0;
for($j = 0; $j < $l; $j++) {
  if($high <= $prices[$j]) {
    $high = $prices[$j];
  }
}
echo "最高価格は{$high}円です";

?>