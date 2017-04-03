<!DOCTYPE html>
<html>
<head>
	<title>X</title>
</head>
<body>

<a href="productos/"> Todos los productos</a>

<br>

<form method="delete" action="local">
	<?php $n = empty($_REQUEST['n'])? 1 : $_REQUEST['n']; ?>
	<h2>function -delete</h2>
	<input type="text" name="id" placeholder="id" value="<?php echo $n; ?>">
	<input type="text" name="is_sa" placeholder="is_sa" value="1">
	<input type="text" name="function" placeholder="function" value="delete">
	<input type="submit" value="Borrar">
</form>

<form method="get" action="local">
	<h2>GET Local</h2>
	<input type="text" name="token" placeholder="Token" value="d2678c1ede1b0202c4443159c30479a421ef9decb5e27582f876260aaf6d437e">
	<input type="submit" value="Enviar">
</form>

<form method="post" action="session">
	<h2>Finalizar sesión</h2>
	<input type="text" name="token" placeholder="Token" value="d2678c1ede1b0202c4443159c30479a421ef9decb5e27582f876260aaf6d437e"><br>
	<input type="text" name="function" placeholder="function" value="destroy">
	<input type="submit" value="DESTROY">
</form>

<form method="get" action="session">
	<h2>GET SESSION</h2>
	<input type="text" name="token" placeholder="Token" value="d2678c1ede1b0202c4443159c30479a421ef9decb5e27582f876260aaf6d437e">
	<input type="submit" value="CURRENT USER">
</form>


<form method="post" action="session">
	<h2>Start session - gettoken</h2>
	<input type="text" name="username" placeholder="username" value="admin"> <br>
	<input type="password" name="password" placeholder="password" value="admin"> <br>
	<input type="text" name="ID_FB" placeholder="ID_FB" value="123"> <br>
	<input type="text" name="ID_GG" placeholder="ID_GG" value="321"> <br>
	<input type="text" name="type" placeholder="table_name" value="user"> <br>
	<input type="submit" value="Genera Session Token"> <br>
</form>

<form method="post" action="local">
	<h2>POST</h2>
	<?php $n = empty($_REQUEST['n'])? 1 : $_REQUEST['n']; ?>
	<input type="text" name="token" placeholder="Token" value="d2678c1ede1b0202c4443159c30479a421ef9decb5e27582f876260aaf6d437e">
	<input type="text" name="title" placeholder="title" value="title <?php echo $n; ?>"> <br>
	<input type="text" name="business_name" placeholder="business_name" value="business_name <?php echo $n; ?>"> <br>
	<input type="text" name="ruc" placeholder="ruc" value="2010101010<?php echo $n; ?>"> <br>
	<input type="text" name="headquarters" placeholder="headquarters" value="headquarters <?php echo $n; ?>"> <br>
	<input type="text" name="manager" placeholder="manager" value="manager <?php echo $n; ?>"> <br>
	<input type="text" name="address" placeholder="address" value="address <?php echo $n; ?>"> <br>
	<input type="text" name="phone" placeholder="phone" value="90909090<?php echo $n; ?>"> <br>
	<input type="text" name="email" placeholder="email" value="email <?php echo $n; ?>"> <br>
	<input type="text" name="web" placeholder="web" value="web <?php echo $n; ?>"> <br>
	<input type="text" name="latitude" placeholder="latitude" value="latitude <?php echo $n; ?>"> <br>
	<input type="text" name="longitude" placeholder="longitude" value="longitude <?php echo $n; ?>"> <br>
	<input type="text" name="url_photo" placeholder="url_photo" value="url_photo <?php echo $n; ?>"> <br>
	<input type="text" name="local_type_id" placeholder="local_type_id" value="1"> <br>
	<input type="text" name="district_id" placeholder="district_id" value="4"> <br>
	<input type="text" name="client_id" placeholder="client_id" value="2"> <br>

	<input type="submit" name="enviar" value="Enviar">
</form>


</body>
</html>