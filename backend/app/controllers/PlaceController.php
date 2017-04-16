<?php 
require_once '../load.php';
require_once 'models/Place.php';
require_once '../../vendor/joshtronic/php-googleplaces/src/GooglePlaces.php';
require_once '../../vendor/joshtronic/php-googleplaces/src/GooglePlacesClient.php';
class PlaceController extends Controller implements IController
{
	private $model = 'Place';
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
		$this->functionPref = empty($this->params['function']) ? null : $this->params['function'];
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

		$google_places = new joshtronic\GooglePlaces( $config['GOOGLE_API_KEY'] );
		$google_places->location = [ strval( $this->params['latitude'] ),  strval( $this->params['longitude'] ) ];
		$google_places->radius   = !empty($this->params['radius'])? $this->params['radius'] : 800;
		$google_places->rankby   = !empty($this->params['rankby'])? $this->params['rankby'] : 'prominence';
		$google_places->keyword  = !empty($this->params['keyword'])? $this->params['keyword'] : '';
		$google_places->types    = !empty($this->params['types'])? $this->params['types'] : '';
		$google_places->name     = !empty($this->params['name'])? $this->params['name'] : '';
		$results                 = $google_places->nearbySearch();

		$this->result = ["P1" => $results];
	}

	public function search() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$google_places = new joshtronic\GooglePlaces( $config['GOOGLE_API_KEY'] );
		$google_places->location = [ strval( $this->params['latitude'] ),  strval( $this->params['longitude'] ) ];
		$google_places->radius   = !empty($this->params['radius'])? $this->params['radius'] : 800;
		$google_places->rankby   = !empty($this->params['rankby'])? $this->params['rankby'] : 'prominence'; //prominence - distance
		$google_places->keyword  = !empty($this->params['keyword'])? $this->params['keyword'] : '';
		$google_places->types    = !empty($this->params['types'])? $this->params['types'] : '';
		$google_places->name     = !empty($this->params['name'])? $this->params['name'] : '';
		$results                 = $google_places->nearbySearch();
		print_r(  $results );
		die();
		die(var_dump(gettype($results)));

		$this->result = ["P1" => $results];
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

		$this->result = ['message' => 'Sin implementar create'];
	}

	public function delete() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$this->result = ['message' => 'Sin implementar delete'];
	}

	// utilizando metodo heredado
	public function response($type = 'json') {
		if ($type == 'json') {
			return parent::responseJson($this->result);
		}else {
			return parent::response($this->result);
		}
	}
}