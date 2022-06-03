@@ -0,0 +1,5 @@
<?php
session_start();
unset($_SESSION['user']);
unset($_SESSION['survey']);
header('location:number.php'); 