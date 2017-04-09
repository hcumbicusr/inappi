<?php
class _MODEL_ {
	public $table = "_TABLE_";
	public $columns = ["id","active","created_at","updated_at"];
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