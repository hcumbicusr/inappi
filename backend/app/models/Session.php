<?php
class Session
{
	public $table = "session";
	public $columns = ['id', 'token', 'active', 'start_session', 'destroy_session', 'user_id', 'table_name'];

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