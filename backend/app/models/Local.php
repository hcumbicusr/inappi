<?php
class Local {
	protected $id = "";
	protected $title = "";
	protected $business_name = "";
	protected $ruc = "";
	protected $headquarters = "";
	protected $manager = "";
	protected $address = "";
	protected $phone = "";
	protected $email = "";
	protected $web = "";
	protected $latitude = "";
	protected $longitude = "";
	protected $url_photo = "";
	protected $local_type_id = "";
	protected $district_id = "";
	protected $client_id = "";
	protected $status = "";
	protected $created_at = "";
	protected $updated_at = "";

	public $table = "locals";
	public $columns = [
					'id', 'title', 'business_name', 'ruc', 'dirname', 'headquarters', 'manager', 'address', 'phone', 'email', 'web', 'latitude', 'longitude', 'url_photo', 'local_type_id', 'district_id', 'client_id', 'deleted', 'active', 'created_at', 'updated_at'
				];

	public function __construct(){
		$this->created_at = date("Y-m-d H:i:s");
		$this->updated_at = date("Y-m-d H:i:s");
		$this->status = "1";
	}
}