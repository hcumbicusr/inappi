<?php
$path = dirname(__DIR__)."/";
//die(var_dump($path));
require_once $path."backend/helpers/Functions.php";
require_once $path."backend/Config.inc.php";
require_once $path."backend/helpers/HttpHelper.php";
require_once $path."backend/app/controllers/Controller.php";
require_once $path."backend/app/controllers/IController.php";

//-------------- conexion a BD
global $db;
global $key_token;
global $key_user;
global $config;
if (empty($db)) {
	$class = new Database();
	$db = $class->selectManager();
}
$key_token = strval( $db->select( "SELECT key_token FROM system_token WHERE active = 1 AND usages = 'session' " )[0]['key_token'] );
$key_user = strval( $db->select( "SELECT key_token FROM system_token WHERE active = 1 AND usages = 'user' " )[0]['key_token'] );