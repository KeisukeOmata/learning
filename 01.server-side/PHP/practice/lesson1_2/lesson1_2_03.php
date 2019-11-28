<?php
$price = 1000;
$taxRate = 0.08;
echo '変数$priceの値: '.$price;
echo '<br>';
echo '変数$taxRateの値: '.$taxRate;
echo '<br>';
echo '-----';
echo '<br>';

$totalPrice = $price + $price * $taxRate;
echo "税込価格は{$totalPrice}円です";
?>