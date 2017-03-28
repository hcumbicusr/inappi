<?php
global $config;
require_once ($config['path'].'backend/helpers/Functions.php');
$filename = $config['path']."backend/".($config['entorno']=='D')? "cfg.config" : "cfg.dev_config";
$file = Functions::readTextFile( $filename );
foreach ( $file as $var => $data ) {
	list( $const, $value ) = explode( "=", $data );
	define( $const, $value );
}