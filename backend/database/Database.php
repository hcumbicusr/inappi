<?php
class Database {
	public $generic_table = [
		"id" 			=> ["INT","PRIMARY KEY","AUTO_INCREMENT"],
		"name"			=> ["VARCHAR(150)","NOT NULL"],
		"deleted"		=> ["INT","NOT NULL","DEFAULT '0'"],
		"active"		=> ["INT","NOT NULL","DEFAULT '1'"],
		"created_at"	=> ["TIMESTAMP","NULL","DEFAULT CURRENT_TIMESTAMP"],
		"updated_at"	=> ["DATETIME","NULL","DEFAULT NULL"],
	];

	public function __construct(  )
	{
	}
	public function __destruct(){ unset($this); }
}