<?php 
require_once '../load.php';
require_once 'models/Session.php';
class _CONTROLLER_Controller extends Controller implements IController
{
	private $model = '_MODEL_';
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
		global $db;
		$this->params 		= $params;
		$this->http_method 	= $http_method;
		$this->functionPref = empty($params['function']) ? null : $params['function'];
		$this->class = new $this->model();
		$this->table = $this->class->table;
		$this->columns = $this->class->columns;
		$this->is_sa = empty($this->params['is_sa'])? false : boolval($this->params['is_sa']);

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
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$this->result = $db->select("SELECT * FROM $this->table WHERE active = 1 ");
	}

	public function search() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$this->result = ['message' => 'Sin implementar'];
	}

	public function update() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$this->result = ['message' => 'Sin implementar PUT'];
	}

	public function create() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$this->result = ['message' => 'Sin implementar'];
	}

	public function delete() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$this->result = ['message' => 'Sin implementar'];
	}

	// utilizando metodo heredado
	public function response($type = 'json') {
		if ($type = 'json') {
			return parent::responseJson($this->result);
		}else {
			return parent::response($this->result);
		}
	}
}