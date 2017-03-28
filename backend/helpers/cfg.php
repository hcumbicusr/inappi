<?php
require_once './backend/helpers/Functions.php';
$file = Functions::readTextFile('./cfg.config');
foreach ($file as $var => $data) {
	define( $var, $data );
}