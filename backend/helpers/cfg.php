<?php
global $config;
require_once ($config['path'].'backend/helpers/Functions.php');

$file = Functions::readTextFile( $config['path'].'backend/cfg.config' );
foreach ( $file as $var => $data ) {
	list( $const, $value ) = explode( "=", $data );
	define( $const, $value );
}