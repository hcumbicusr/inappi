<?php
require_once '../load.php';
global $db;
global $config;
global $token;
global $current_user;

header('Access-Control-Allow-Origin: *');  
header("Access-Control-Allow-Methods: GET, POST, DELETE, PUT, OPTIONS");

$method 	= $_SERVER['REQUEST_METHOD'];

$controller = ucfirst($_REQUEST['controller']);
$controllers = scandir('./controllers');

HttpHelper::requestHelper();

for ($i=0; $i < count($controllers); $i++) { //Obtiene el nombre limpio del controller
	if (strpos($controllers[$i], 'Controller') !== false) {
		$controllersName[] = substr(trim($controllers[$i]), 0, strpos(trim($controllers[$i]), 'Controller'));
	}
}

$aux_controller = pluralControllers(trim($controller)); // valida el controller en plural

$controller = $aux_controller;

if ( $config['require_session'] ) {
	$token = empty($_REQUEST['token'])? null : $_REQUEST['token'];
	if ( empty($token) ) {
		if ( in_array( $controller , ['session','Session'] ) ) {
			if ( $method == 'POST' ) {
				$return = callController( $controller, $controllersName, $method );
			} else {
				$return = json_encode(['type' => 'error', 'message' => 'Método HTTP Incorrecto para iniciar sesión.']);
			}
		} else {
			$return = json_encode(['type' => 'error', 'message' => 'Se require iniciar sessión.']);
		}
	}else {
		$real_func = !empty($_REQUEST['function'])? $_REQUEST['function'] : null;
		$_REQUEST['function'] = 'search';
		$current_user = callController( 'Session', $controllersName, 'GET' ) ;
		$current_user = get_object_vars( json_decode( $current_user ) );
		if ( empty($current_user['type']) ) {
			unset($_REQUEST['function']);
			if (!empty($real_func)){
				$_REQUEST['function'] = $real_func;
			}
			//pr( "callController( $controller, ".implode( '-', $controllersName).", $method )" ) ;
			unset($_REQUEST['token']);
			$return = callController( $controller, $controllersName, $method );
			//pr ( $return );
		} else {
			$return = json_encode( $current_user );
		}
	}
} else {
	$return = callController( $controller, $controllersName, $method );
}
$db->close();
echo $return;
exit;

function callController( $controller, $controllersName, $method ) {
	global $db;
	global $config;
	global $token;
	global $current_user;
	if ( in_array($controller, $controllersName) ) { // valido si existe el controller ingresado por url
		$controller = ucfirst(strtolower(trim($controller))).'Controller';
		include_once 'controllers/'.$controller.'.php';
		$obj = new $controller( $_REQUEST, $method );
		return $obj->response(); //devuelve
	}
	else {
		return json_encode(['type' => 'error', 'message' => 'El controlador '.$controller.' NO existe.', 'code' => '404']);
	}
}

// valida terminos en plural
function pluralControllers($controller) {
	$controller_ = ucfirst( $controller );
	if( strpos($controller, "_") ) {
		$controller_ = explode("_", $controller);
		for ($i=0; $i < count($controller_); $i++) { 
			if ( substr($controller_[$i], -1) == 's' ) {
				$controller_[$i] = substr($controller_[$i], 0, strlen($controller_[$i])-1);
			}
			$controller_[$i] = ucfirst( trim($controller_[$i]) );
		}
		$controller_ = implode("", $controller_);
	} else {
		if ( substr($controller, -1) == 's' ) {
			$controller_ = ucfirst( substr($controller, 0, strlen($controller)-1) );
		}
	}
	return $controller_;
}