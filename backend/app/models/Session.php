<?php
/**
* 
*/
class Session
{
	public $table = "session";
	public $columns = ['id', 'token', 'active', 'start_session', 'destroy_session', 'user_id', 'table_name'];

	public $structure = [];

	public function __construct(){
		global $db;
		$this->structure = $db->select("desc $this->table");
	}

}