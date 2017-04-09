<?php
class Local {

	public $table = "locals";
	public $columns = [
					'id', 'code', 'title', 'business_name', 'ruc', 'dirname', 'headquarters', 'manager', 'address', 'phone', 'email', 'web', 'latitude', 'longitude', 'url_photo', 'local_type_id', 'district_id', 'client_id', 'deleted', 'active', 'created_at', 'updated_at'
				];
	public $structure = [];

	public function __construct(){
		global $db;
		global $config;
		if ($config['entorno'] == 'D')
			$this->structure = $db->select("desc $this->table");
		else
			$this->structure = ['type' => 'error', 'message' => 'El proyecto ya está publicado, por motivos de seguridad no se puede responder la solicitud.'];
	}
}