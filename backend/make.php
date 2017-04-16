<?php
define("PATH", dirname(__DIR__).DIRECTORY_SEPARATOR."backend".DIRECTORY_SEPARATOR );
define("DIR_CONTROLLER", PATH."app".DIRECTORY_SEPARATOR."controllers" .DIRECTORY_SEPARATOR);
define("DIR_MODEL", PATH."app".DIRECTORY_SEPARATOR."models" .DIRECTORY_SEPARATOR);
define("TPL_CONTROLLER", dirname(__DIR__).DIRECTORY_SEPARATOR."backend".DIRECTORY_SEPARATOR."helpers".DIRECTORY_SEPARATOR."Controller.make" );
define("TPL_MODEL", dirname(__DIR__).DIRECTORY_SEPARATOR."backend".DIRECTORY_SEPARATOR."helpers".DIRECTORY_SEPARATOR."Model.make" );
define('NAME_CONTROLLER', '_CONTROLLER_');
define('NAME_MODEL', '_MODEL_');
define('NAME_TABLE', '_TABLE_');


if (!empty($argv)) {
	unset($argv[0]);
	$vars = null;
	$type = explode("=", $argv[1])[0];
	foreach ($argv as $key => $value) {
		list($var, $val) = explode("=", $value);
		$vars[$var] = $val;
	}
	
	switch ($type) {
		case 'controller':
			make_controller( $vars );
			break;
		case 'model':
			make_model( $vars );
			break;
		case 'delete':
			delete_file( $vars );
			break;
		default:
			info( $vars );
			break;
	}
} else {
	info();
}

function make_controller( $vars )
{
	extract($vars);
	$file_name 		= DIR_CONTROLLER.ucfirst(trim($controller))."Controller.php";
	$file_content 	= file_get_contents( TPL_CONTROLLER );
	$table 			= !empty($table)? $table : strtolower(trim($controller));
	$model 			= !empty($model)? $model : ucfirst(trim($controller));
	$seach 			= [NAME_CONTROLLER, NAME_MODEL];
	$replace 		= [ucfirst(trim($controller)), $model];
	$file_content 	= str_replace( $seach , $replace, $file_content);
	$success 		= file_put_contents( $file_name , $file_content);
	if ( $success !== false ) {
		$vars['table']	= $table;
		$vars['model']	= $model;
		print_r( "Controller: ".$controller." creado exitosamente!\n" );
		make_model( $vars );
	} else {
		echo "[Make_Controller] Ocurrió un error!!\n";
	}
	//echo "----------------------------------------------";
}

function make_model( $vars )
{
	extract($vars);
	$file_name 		= DIR_MODEL.ucfirst(trim($model)).".php";
	$file_content 	= file_get_contents( TPL_MODEL );
	$table 			= !empty($table)? $table : strtolower(trim($model));
	$seach 			= [NAME_MODEL, NAME_TABLE];
	$replace 		= [ucfirst(trim($model)), $table];
	$file_content 	= str_replace( $seach , $replace, $file_content);
	$success 		= file_put_contents( $file_name , $file_content);
	if ( $success !== false ) {
		echo "Model: ".$model." creado exitosamente!\n";
		_table( $model );
	} else {
		echo "[Make_Model] Ocurrió un error!!\n";
	}
}

function delete_file( $vars )
{
	extract($vars);
	$delte = trim($delete);
	if ($delete == 'controller'){
		$delete_controller = !empty($name)? $name : '';
	} else{
		$delete_controller = !empty($delete)? $delete : '';
	}
	if ($delete == 'model'){
		$delete_model = !empty($name)? $name : '';
	} else {
		$delete_model = !empty($delete)? $delete : '';
	}
	$delete_controller = DIR_CONTROLLER.ucfirst($delete_controller."Controller.php");
	if ( file_exists( $delete_controller ) ) {
		$controller 	= unlink($delete_controller);
		if ( $controller != false ) {
			echo "Controller: ".$delete_controller."Controller.php Eliminado!!\n";
		} else {
			echo "[Delete_Controller] Ocurrió un error!!\n";
		}
	} else {
		echo "Controller not found!!\n";
	}
	$delete_model_ = $delete_model;
	$delete_model = DIR_MODEL.ucfirst($delete_model.".php");
	if ( file_exists( $delete_model ) ) {
		_table( $delete_model_ , 'drop');
		$model 		= unlink($delete_model);
		if ( $model != false ) {
			echo "Model: ".$delete_model.".php Eliminado!!\n";
		} else {
			echo "[Delete_Model] Ocurrió un error!!\n";
		}
	} else {
		echo "Model not found!!\n";
	}
}

function _table( $model_name , $option = 'create' )
{
	//echo "create_table $model_name \n";
	require_once 'load.php';
	include_once PATH."database".DIRECTORY_SEPARATOR."DatabaseModel.php";
	require_once DIR_MODEL.$model_name.".php";
	$model = new $model_name();
	//print_r($model);
	$obj = new DatabaseModel( $model );
	if ($option == 'create') {
		$rest = $obj->createTable();
		$aux = "creada";
	} else {
		$rest = $obj->dropTable();
		$aux = "eliminada";
	}
	if ($rest === true) {
		echo "Tabla $model->table $aux correctamente. \n";
	} else {
		echo "Ocurrió un error al $aux la tabla $model->table . \n";
	}
}

function info( $vars = [] )
{
$info = <<<EOT
/** 
*############# make.php  #############
*@author 		: Henry Cumbicus R.
*@email 		: hcumbicusr@gmail.com
*@version 		: 1.0
*@date 			: 8/04/2017
*@last_update	: 8/04/2017
*@keywords 		: ['make','models','controlles']
*@description 	: 
*\tEste archivo permite la creacion de Models y Controllers a traves de consola de comandos
*/\n
[Instrucciones MAKE]
#php make.php controller=Nombre_de_mi_controller_sin_extension
#php make.php controller=Nombre_de_mi_controller_sin_extension  model=nombre_de_mi_model_sin_extension
#php make.php controller=Nombre_de_mi_controller_sin_extension  model=nombre_de_mi_model_sin_extension  table=nombre_de_mi_table
#php make.php controller=Nombre_de_mi_controller_sin_extension  table=nombre_de_mi_table
#php make.php model=nombre_de_mi_model_sin_extension  table=nombre_de_mi_table
\n
[Instrucciones DELETE]
#php make.php delete=nombre_
\n
EOT;
echo $info;
}