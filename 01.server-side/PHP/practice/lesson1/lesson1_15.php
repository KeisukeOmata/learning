<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <title>Progate</title>
  <link rel="stylesheet" type="text/css" href="stylesheet.css">
</head>
<body>

  <?php

    for($i = 1; $i <= 1000; $i++) {
      if($i % 3 == 0) {
        continue;
      }
      echo $i;
    }
    
  ?>

</body>
</html>