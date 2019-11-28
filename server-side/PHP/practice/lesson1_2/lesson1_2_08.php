<?php
$menu = array('name' => 'CURRY', 'price' => 900);
echo '$menuの値: ';
var_export($menu);
echo '<br>';
echo '-----';
echo '<br>';

echo "{$menu['name']}は{$menu['price']}円です"

?>