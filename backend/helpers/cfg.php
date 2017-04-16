<?php
global $config;
//require_once ($config['path'].'backend/helpers/Functions.php');
$f = ($config['entorno']=='P')? "cfg.config" : "cfg.dev_config";
//die(var_dump($config));
$filename = $config['path']."backend/".$f;
$file = Functions::readTextFile( $filename );
foreach ( $file as $var => $data ) {
	list( $const, $value ) = explode( "=", $data );
	define( $const, $value );
}