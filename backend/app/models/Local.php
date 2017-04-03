<?php
class Local {

	public $table = "locals";
	public $columns = [
					'id', 'code', 'title', 'business_name', 'ruc', 'dirname', 'headquarters', 'manager', 'address', 'phone', 'email', 'web', 'latitude', 'longitude', 'url_photo', 'local_type_id', 'district_id', 'client_id', 'deleted', 'active', 'created_at', 'updated_at'
				];
	public $structure = [];

	public function __construct(){
		global $db;
		$this->structure = $db->select("desc $this->table");
		//pr($this->structure);
	}
}