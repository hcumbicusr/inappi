<?php
class DatabaseModel {
	public $generic_columns = [
		"id" 			=> ["INT","PRIMARY KEY","AUTO_INCREMENT"],
		"name"			=> ["VARCHAR(150)","NOT NULL"],
		"deleted"		=> ["INT","NOT NULL","DEFAULT '0'"],
		"active"		=> ["INT","NOT NULL","DEFAULT '1'"],
		"created_at"	=> ["TIMESTAMP","NULL","DEFAULT CURRENT_TIMESTAMP"],
		"updated_at"	=> ["DATETIME","NULL","DEFAULT NULL"],
	];
	public $columns = [];
	public $table_name;
	public $table;

	public function __construct( $model = object )
	{
		global $db;
		$class = new Database();
		$db = $class->selectManager();
		if (!empty($model)) {
			$this->table = $model;
			$this->table_name = $model->table;
			$this->columns = $model->columns;
		}
	}

	public function createTable( $always_create = false ) {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;

		$sql = "";
		if ($always_create){
			$sql .= "DROP TABLE IF EXISTS `$this->table_name`; \n";
		}
		$sql .= "CREATE TABLE `$this->table_name` ( \n";
		$columns = [];
		if ( !empty($this->columns) ) {
			$columns = $this->columns;
		} else {
			$columns = $this->generic_columns;
		}
		$comma = " , \n";
		$n = count($columns);
		$i = 0;
		foreach ($columns as $key => $value) {
			$i++;
			$comma = ($n==$i)? "" : $comma;
			if ( is_numeric($key) ) {
				$sql .= "`$value` ";
				if ( in_array( strtolower($value) , ["id","pk"] ) ) {
					$sql .= " INT PRIMARY KEY AUTO_INCREMENT".$comma;
				} elseif ( in_array( strtolower($value) , ["active","status","delete","deleted","update","updated","inactive"] ) ) {
					$sql .= " INT UNSIGNED ".$comma;
				} elseif ( in_array(strtolower($value), ["created_at","updated_at","fecha_creacion","fecha_modificacion","fecha_registro","fecha_eliminado"]) ) {
					$sql .= " DATETIME NULL DEFAULT NULL ".$comma;
				} else {
					$sql .= " VARCHAR(150) COLLATE utf8_unicode_ci NULL ".$comma;
				}
			} else {
				$sql .= "`$key` ";
				foreach ($value as $k => $v) {
					$sql .= " $v ";
				}
				$sql .= $comma;
			}
		}
		$sql .= " ) \n";
		$sql .= "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci; \n";

		//$is_debug = true;
		$create = $db->tquery( $sql );
		//die();
		return $create;
		//return $sql;
	}

	public function dropTable() {
		global $config;
		global $db;
		global $current_user;
		global $token;
		global $is_debug;
		$drop = $db->tquery( "DROP TABLE IF EXISTS `$this->table_name`;");
		return $drop;
	}

	public function __destruct(){ unset($this); }
}