<?php include 'backend/load.php'; global $config; ?>
<?php 
//-------------- conexion a BD
$class = new Database();
$conexion = $class->selectManager();

$test = $conexion->select("SELECT * FROM example");

 ?>
<!DOCTYPE html>
<html>
<head>
  <title><?php echo $config['app_name']; ?></title>
</head>
<body>

<h1>Bienvenido <?php echo $config['app_name']; ?></h1>
<?php pr( $test ) ?>
</body>
</html>