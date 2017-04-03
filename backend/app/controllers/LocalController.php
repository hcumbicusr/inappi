<?php
require_once '../load.php';
require_once 'models/Local.php';
class LocalController extends Controller implements IController
{
	private $model = 'Local';
	private $class;
	private $table;
	private $columns;
	private $params;
	private $http_method;
	private $type_search;
	private $functionPref;
	private $result;
	private $is_sa;

	public function __construct($params = array(), $http_method = 'GET') {
		unset($params['_']);
		$this->params 		= $params;
		$this->http_method 	= $http_method;
		$this->functionPref = empty($params['function']) ? null : $params['function'];

		//-------------- conexion a BD
		global $db;
		//_------------- model
		$this->class = new $this->model();
		$this->table = $this->class->table;
		$this->columns = $this->class->columns;
		$this->is_sa = empty($this->params['is_sa'])? false : boolval($this->params['is_sa']);

		//die(var_dump($params));

		switch ($http_method) {
		 	case 'GET':
		 		if (empty($this->functionPref)) {
			 		if (empty($this->params)){
			 			$this->index();
			 		} else {
			 			$this->search();
			 		}
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'POST':
		 		if (empty($this->functionPref)) {
			 		$this->create();
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'PUT':
		 		if (empty($this->functionPref)) {
			 		$this->update();
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	case 'DELETE':
		 		if (empty($this->functionPref)) {
			 		$this->delete();
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 	
		 	default://GET
				if (empty($this->functionPref)) {
			 		if (empty($this->params)){
			 			$this->index();
			 		} else {
			 			$this->search();
			 		}
		 		} else {
		 			unset($this->params['function']);
		 			call_user_func(array($this,$this->functionPref));
		 		}
		 		break;
		 }
	}

	//---------------------------------------------------------------------------------------

	public function index() {
		global $db;
		if($this->is_sa){
			$this->result = $db->select("SELECT * FROM $this->table");
		} else {
			$this->result = $db->select("SELECT * FROM $this->table WHERE deleted = 0 AND active = 1 ");
		}
	}

	public function search() {
		global $db;
		if($this->is_sa){
			$this->result = $db->select("SELECT * FROM $this->table");
		} else {
			$this->result = $db->select("SELECT * FROM $this->table WHERE deleted = 0 AND active = 1 ");
		}
	}

	public function update() {
		$this->result = ['message' => 'Sin implementar PUT'];
	}

	/**
	* Agrega un nuevo local y crea un directorio para sus resources
	*/
	public function create() {
		global $config;
		global $is_debug;
		global $db;

		$code_table = getCodeTable($this->table);
		if (empty($code_table)) { $this->result = ['type'=>'error', 'message'=>"No se encontró la entidad solicitada [$this->table]."]; return; }
		$code = $code_table['current_code'];
		$current_id = $code_table['current'];

		$path_locals = $config['directory_tree']."locals/";
		$columns = $this->columns;

		$existe = $db->select("SELECT title, business_name, ruc, headquarters FROM $this->table 
					WHERE title = '".$this->params['title']."' AND business_name = '".$this->params['business_name']."' AND ruc = '".$this->params['ruc']."' AND headquarters = '".$this->params['headquarters']."' " );

		if (empty($existe)) {
			$datos = [
				'code' => $code,
				'title' => $this->params['title'],
				'business_name' => $this->params['business_name'],
				'ruc' => $this->params['ruc'],
				'headquarters' => $this->params['headquarters'],
				'manager' => $this->params['manager'],
				'address' => $this->params['address'],
				'phone' => $this->params['phone'],
				'email' => $this->params['email'],
				'web' => $this->params['web'],
				'latitude' => $this->params['latitude'],
				'longitude' => $this->params['longitude'],
				'url_photo' => $this->params['url_photo'],
				'local_type_id' => $this->params['local_type_id'],
				'district_id' => $this->params['district_id'],
				'client_id' => $this->params['client_id']
			];
			
			$insert = $db->insert($datos)->inTable($this->table);
			
			if ($insert){
				$name_dir = $code . "_" . substr((strtolower(trim(str_replace([" ",".","-","'","\"","`",","], "", trim($this->params['ruc']))))) , 0, 50);
				if (file_exists( $path_locals.$name_dir )) {
					rmdir( $path_locals.$name_dir );
				}
				$dir = mkdir( $path_locals.$name_dir );
				if (!$dir) {
					$delete = $db->delete("DELETE FROM $this->table WHERE ruc = '".$this->params['ruc']."' ");
					$this->result = ['estado'=> 'error', 'message' => 'Ocurrió un error'];
				} else {
					$update = $db->update("UPDATE $this->table SET dirname = '$name_dir' WHERE ruc = '".$this->params['ruc']."' ");
					if ($update) {
						updateCodeTable( $this->table, $current_id );
						$this->result = ['estado'=> 'success', 'message' => 'OK'];
					} else {
						$delete = $db->delete("DELETE FROM $this->table WHERE ruc = '".$this->params['ruc']."' ");
						$this->result = ['estado'=> 'error', 'message' => 'Ocurrió un error'];
					}
				}
			} else {
				$this->result = ['estado'=> 'error', 'message' => 'Ocurrió un error 1'];
			}
		} else {
			$this->result = ['estado'=> 'warning', 'message' => 'Ya existe!!'];
		}
	}

	public function delete() {
		global $config;
		global $db;
		$path_locals = $config['directory_tree']."locals/";

		if ($this->is_sa) { // solo si es SUPER ADMIN
			$select = $db->select("SELECT dirname FROM $this->table WHERE id = '".$this->params['id']."' ");
			$delete = $db->delete("DELETE FROM $this->table WHERE id = '".$this->params['id']."' ");
			if ($delete){
				if ( !empty($select[0]['dirname']) ) {
					$local_dir = $path_locals.$select[0]['dirname'];
					if (file_exists($local_dir)) {
						rmdir($local_dir);
					}
				}
				$this->result = ['estado'=> 'success', 'message' => 'OK'];
			} else {
				$this->result = ['estado'=> 'error', 'message' => 'Ocurrió un error'];
			}
		} else {
			$update = $db->update("UPDATE $this->table SET deleted = 1 WHERE id = '".$this->params['id']."' ");
			if ($update){
				$this->result = ['estado'=> 'success', 'message' => 'OK'];
			} else {
				$this->result = ['estado'=> 'error', 'message' => 'Ocurrió un error'];
			}
		}
	}

	

	public function listPermisosByUser(){
		global $db;
		$id_usuario = $this->params['id_usuario'];
		$query = "SELECT pm.id as id_permiso_menu, m.* FROM permisos_menu pm INNER JOIN menu m ON pm.id_menu = m.id WHERE id_usuario = '$id_usuario' AND m.activo = '1' AND pm.activo = '1' ORDER BY m.orden asc";
		$this->result = $db->select($query);
	}
	
	

	public function verificaDatos() {
		global $db;
		$option = strtoupper($this->params['dato']);
		$valor = trim($this->params['valor']);
		$message = "El $option ya está registrado.";
		switch ($option) {
			case 'USERNAME':
				$query = "SELECT * FROM usuarios WHERE trim(username) = '$valor'";
				$rest = $db->select($query);
				if (count($rest) == 0) {$message = true;}
				break;
			case 'EMAIL':
				$query = "SELECT * FROM trabajador WHERE trim(email) = '$valor'";
				$rest = $db->select($query);
				if (count($rest) == 0) {$message = true;}
				break;
		}
		$this->result = $message;
	}

	//--------------------------- fin funciones personalizadas --------------------------------------------------

	// utilizando metodo heredado
	public function response($type = 'json') {
		if ($type = 'json') {
			return parent::responseJson($this->result);
		}else {
			return parent::response($this->result);
		}
	}

}