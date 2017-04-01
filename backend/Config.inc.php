<?php
/**
 * Este archivo contiene las variables de configuracion de la aplicacion
 * @author Henry Cumbicus <hcumbicusr@gmail.com>
 * @package 
 * @subpackage 
*/
header('Content-Type: text/html; charset=UTF-8');

/**
 * @var charset
 */
$config['charset']= 'UTF-8';
/**
 * @var language
 */
$config['lang']= 'es-ES';
/**
* @var default_timezone : zona horaria default
*/
$config['default_timezone'] = 'America/Lima';
/**
* @var memory_limit : limite de memoria
*/
$config['memory_limit'] = '512M';

date_default_timezone_set( $config['default_timezone'] );
setlocale( LC_ALL, $config['lang'] );
ini_set('memory_limit', $config['memory_limit']);

/**
*@var name
*/
$config['app_title']="inappi";
/**
*@var version
*/
$config['app_version']="1";
/**
*@var name
*/
$config['app_name']="inappi";
/**
 * @var email developer
 */
$config['email_developer']="hcumbicusr@gmail.com";
/**
 * @var emails group developers
 */
$config['developer_team'] = [
    "hcumbicusr" => "hcumbicusr"
];

/**
 * @var host ruta completa
 */
$config['site_url']='http://localhost:88/'.$config['app_name'];
/**
 * @var path ruta raiz directorio
 */
$config['path']='C:\xampp\htdocs\\'.$config['app_name'].'/';

/**
 * @var entorno : D-> Desarrollo; P-> Produccion
 */
$config['entorno']= 'D';

if ($config['entorno'] == 'D')
{
    ini_set("display_errors", true);
    error_reporting(E_ALL);
}elseif($config['entorno'] == 'P')
{
    ini_set("display_errors", false);
    error_reporting(0);
}

/**
* Archivo que genera constantes de file cfg.config
*/
include $config['path']."backend/helpers/cfg.php";

/**
* @var accessBD n1 default
*/
$config['access_bd'] = array(
   "host" => SERVERNAME,
   "port" => PORT,
   "db" => DATABASE,
   "user" => USERNAME,
   "pass" => PASSWORD
);

/**
* @var accessBD n2
*/
$config['access_bd_2'] = array(
   "host" => SERVERNAME_2,
   "port" => PORT_2,
   "db" => DATABASE_2,
   "user" => USERNAME_2,
   "pass" => PASSWORD_2
);
   

/**
 * @var management
 */
$config['database_manager']="mysqli";

/**
 * @var sessionTime in seg
 */
$config['session_time']= 2400;

/**
 * @var auditable = true : registra todas las transacciones sql en una tabla auditoria en la bd 
 * @var auditable = false:  obvia el registro de transacciones sql
 */
$config['auditable']= false;
$config['audit_table']= "sys_logs";

/**
 * Requiere del archivo db.php para funcionar
 */

require_once $config['path'].'backend/core/Database.php';
/**
 * Requiere del archivo config.php para funcionar
 */
require_once $config['path'].'backend/core/ClassConfig.php';