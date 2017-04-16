<?php 
require_once '../load.php';
require_once 'models/Session.php';
class SessionController extends Controller implements IController
{
	private $model = 'Session';
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
		$this->result = $db->select("SELECT * FROM $this->table WHERE active = 1 ");
	}

	public function search() {
		global $db;
		global $current_user;
		global $config;
		global $token;
		global $is_debug;

		//pr ( "-search-" );
		
		if ( !empty($current_user) ) {
			//pr ( "-current_user-" );
			$this->result = $current_user;
			return;
		}

		$columns = "`".implode("`,`", $this->columns)."`";
		//$is_debug = true;
		$session = $db->select( "SELECT $columns FROM $this->table WHERE token = '$token' AND active = 1" );
		//die();
		if ( !empty( $session ) ) {
			$session = $session[0];
			$query = "SELECT tbl.* ";
			if ( $session['table_name'] == 'user' ) {
				$query.= " , s.dni, s.ruc, s.names, s.surnames, s.gender, s.email, s.birthdate, s.phone, s.address, s.url_photo ";
				$query.= " , st.name as staff_type ";
			}
			$query.= " , '".$session['table_name']."' user_type ";
			$query.= " FROM ".$session['table_name']." tbl ";
			if ( $session['table_name'] == 'user' ) {
				$query.= " INNER JOIN staff s ON tbl.staff_id = s.id ";
				$query.= " INNER JOIN staff_type st ON s.staff_type_id = st.id ";
			}
			$query.= " WHERE tbl.id = ".$session['user_id'];
		//$is_debug = true;
			$user = $db->select( $query );

			if ( !empty($user)) $user = $user[0];
			$this->result = $user;
		} else {
			$this->result = ['type' => 'error', 'message' => 'No se ha encontrado la sesión indicada.'];
		}
	}

	public function update() {
		$this->result = ['message' => 'Sin implementar PUT'];
	}

	/**
	* Crea una nueva session y genera un token 
	*/
	public function create() {
		global $config;
		global $is_debug;
		global $db;
		global $current_user;
		global $key_token;
		global $key_user;
		global $token;

		$token =  Functions::UID( $key_token );
		
		if ( !empty($token) ) {
			$table = $this->params['type'];
			$username = $this->params['username'];
			$password = $this->params['password'];
			$user_column = ($table=='user'||$table=='super_user')? 'username' : 'email';
			

			$user = $db->select( "SELECT password FROM $table  WHERE $user_column = '$username' " );

			if ( !empty($user) ) {
				$password_u = $user[0]['password'];
			} else {
				$this->result = ['type' => 'error', 'message' => 'Usuario no existe'];
				return;
			}

			//$is_debug = true;
			$query =  "SELECT * FROM $table  WHERE $user_column = '$username' AND  " ;
			$query.=  " ( " ;
			$query.= ( password_verify( $key_user . $password , $password_u )? 1 : 0 ) ."=1";
			if ( $table != 'user' && $table != 'super_user' ) {
				$query.=  " OR ID_FB = '".$this->params['ID_FB']."'  " ;
				$query.=  " OR ID_GG = '".$this->params['ID_GG']."'  " ;
			}
			$query.=  " ) " ;
			$query.=  " AND active = 1 " ;
			$user = $db->select($query);

			//die();
			if ( !empty($user) ) {
				$is_alive = $db->select("SELECT * FROM $this->table WHERE id = ".$user[0]['id']." AND table_name = '$table' AND active = 1 LIMIT 1");
				if ( empty($is_alive )) {
					//$is_debug = true;
					$data = [ 'token' => $token, 'user_id' => $user[0]['id'], 'table_name' => $table ];
					$create = $db->insert( $data )->inTable( $this->table );
					//die();
				} else {
					$create = true;
					$token = $is_alive[0]['token'];
				}
				if ($create){
					$this->result = ['type' => 'success', 'token' => $token];
				} else {
					$this->result = ['estado'=> 'error', 'message' => 'Error al iniciar la sesión.'];
				}
			} else {
				$this->result = ['estado'=> 'error', 'message' => 'Datos incorrectos.'];
			}
		} else {
			$this->result = ['estado'=> 'error', 'message' => 'Imposible generar token.'];
		}
	}

	public function delete() {
		
	}

	public function destroy() {
		global $current_user;
		global $config;
		global $db;
		global $token;
		//die(var_dump($_REQUEST));
		//$token = $this->params['token'];
		$destroy = $db->update("UPDATE $this->table SET active = 0 , destroy_session = now() WHERE token = '$token' ");
		if ($destroy) {
			$current_user = null;
			$this->result = ['type' => 'success', 'message' => 'Sesión finalizada.'];
		} else {
			$this->result = ['type' => 'error', 'message' => 'Imposible finalizar sesión.'];
		}
	}

	//--------------------------- fin funciones personalizadas --------------------------------------------------

	// utilizando metodo heredado
	public function response($type = 'json') {
		if ($type == 'json') {
			return parent::responseJson($this->result);
		}else {
			return parent::response($this->result);
		}
	}

}