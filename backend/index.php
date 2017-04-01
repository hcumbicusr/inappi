<!DOCTYPE html>
<html>
<head>
	<title>X</title>
</head>
<body>

<a href="productos/"> Todos los productos</a>

<br>

<form method="get" action="user">
	<h2>function</h2>
	<input type="text" name="id" placeholder="id" value="1">
	<input type="text" name="name" placeholder="id" value="juan">
	<input type="text" name="code" placeholder="id" value="02002">
	<!-- <input type="text" name="function" placeholder="function" value="getProductosByName"> -->
	<input type="submit" value="Enviar">
</form>

<form method="get" action="productos/">
	<h2>GET search</h2>
	<input type="text" name="id" placeholder="id" value="1">
	<input type="text" name="name" placeholder="id" value="juan">
	<input type="text" name="code" placeholder="id" value="02002">
	<input type="submit" value="Enviar">
</form>

<form method="post" action="user">
	<h2>POST</h2>
<!-- 	<input type="text" name="nombre" placeholder="nombre" value="henry 1">
	<input type="text" name="codigo" placeholder="codigo" value="001"> -->
	<input type="submit" name="enviar" value="Enviar">
</form>


</body>
</html>