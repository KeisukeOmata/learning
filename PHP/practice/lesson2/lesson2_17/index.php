<?php require_once('data.php') ?>

<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Café Progate</title>
  <link rel="stylesheet" type="text/css" href="stylesheet.css">
  <link href='https://fonts.googleapis.com/css?family=Pacifico|Lato' rel='stylesheet' type='text/css'>
</head>
<body>
  <div class="menu-wrapper container">
    <h1 class="logo">Café Progate</h1>
    <!-- ここに<form>の開始タグを書いてください -->
    <form method="post" action="confirm.php">
      <div class="menu-items">
        <?php foreach ($menus as $menu): ?>
          <div class="menu-item">
            <img src="<?php echo $menu->getImage() ?>" class="menu-item-image">
            <h3 class="menu-item-name"><?php echo $menu->getName() ?></h3>
            <p class="price">¥<?php echo $menu->getTaxIncludedPrice() ?>（税込）</p>
            <!-- <input>タグを用いて入力ボックスを作成してください  -->
            <input type="text" value="0" name="<?php echo $menu->getName() ?>">
            <span>個</span>
          </div>
        <?php endforeach ?>
      </div>
      <!-- <input>タグを用いて送信ボタンを作成してください  -->
      <input type="submit" value="注文する">
    <!-- ここで<form>の閉じタグを書いてください -->
    </form>
  </div>
</body>
</html>
