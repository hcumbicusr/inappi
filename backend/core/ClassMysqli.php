<?php
require_once 'IDatabase.php';

class ClassMysqli implements IDatabase{

    private $con = null;
    private $table = null;
    private $query = null;
    private $isClose = true;
    private $isTest = false;
    private $audit = false;
    private $audit_table = "";

    public function setQuery($query) {
        $this->query = $query;
    }

    public function setTable($table) {
        $this->table = $table;
    }

    public function getTable() {
        return $this->table;
    }

    public function getConnection() {
        return $this->con;
    }

    public function getQuery() {
        return $this->query;
    }

    public function isAudit() {
        return $this->audit;
    }



    public function __construct($database = null) {
        $this->connect($database);
    }

    public function __destruct(){
        unset($this->con);
    }
       
    public function connect($database = null){
        global $config;
        global $is_debug;
        //die(var_dump($database));
        //$con = null;
        $this->audit = $config['auditable'];
        $this->audit_table = $config['audit_table'];
        $port = !empty($config['access_bd']['port'])? $config['access_bd']['port'] : '3306';
        try {
            if (empty($database)) {
                $this->con = new mysqli(
                    $config['access_bd']['host'].":$port", 
                    $config['access_bd']['user'], 
                    $config['access_bd']['pass'],
                    $config['access_bd']['db']);
                //die(var_dump($config['access_bd']));
            }else {
                $this->con = new mysqli(
                        $config['access_bd_'.$database]['host'].":$port", 
                        $config['access_bd_'.$database]['user'], 
                        $config['access_bd_'.$database]['pass'],
                        $config['access_bd_'.$database]['db']);
            }
            
            if ($this->con->connect_errno) {
                echo "Fallo de la conexión a MySQL: (" . $this->con->connect_error . ") ";
                die();
            }else {
                $this->con->query("SET NAMES 'utf8'");
                if ($this->audit) {
                    $sql = "CREATE TABLE IF NOT EXISTS `".$config['audit_table']."` 
                    ( `id` INT NOT NULL AUTO_INCREMENT , 
                    `usuario` VARCHAR(50) NOT NULL , 
                    `sql_` TEXT NOT NULL , 
                    `sql_success` BOOLEAN NOT NULL,
                    `ip` VARCHAR(20) NOT NULL , 
                    `host` VARCHAR(150) NULL,
                    `browser` VARCHAR(150) NOT NULL , 
                    `f_registro` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP , 
                    PRIMARY KEY (`id`)
                    ) ENGINE = InnoDB;";
                    $this->con->query($sql);
                }
            }
        }  catch (Exception $e) {
            echo "Exception MySQL: (" . $e->getMessage() . ") ";
            die();
        }
        
        //die(var_dump($con));
        return $this->con;    
    }
    
    public function close(){
        $val = mysqli_close($this->con);
        return $val;    
    }
    
    public function select($query, $close = false){
        global $is_debug;

        if($is_debug) {
            $this->close();
            pr( $query );  return;
        }
        //pr( $query );
        $consult = $this->con->query($query);  
        $data = NULL;
        //die(var_dump($consult));
        if ($consult != NULL)
        {
            //$n_rows = mysqli_num_rows ($consult);
            //if ($n_rows > 1) {
                while($row = mysqli_fetch_assoc($consult))
                {
                    $data[] = $row;
                }
            //}else {
            //    $data = mysqli_fetch_assoc($consult);
            //}
        }
        if($close){ 
            $this->close();
        }
        
        return $data;
    }        
    
    public function insert($arr, $close = false) {
        $obj = new ClassMysqli();
        global $is_debug;

        $result = false;
        $query = "INSERT INTO TABLE_NAME (`".implode("`, `", array_keys($arr))."`) VALUES ('".implode("', '", $arr)."')";
        $query = str_replace("'now()'", "now()", $query);
        $query = str_replace("'default'", "default", $query);
        $query = str_replace("'curdate()'", "curdate()", $query);
        $query = str_replace("'null'", "null", $query);
        $obj->query = $query;
        $obj->isClose = $close;
        $obj->isTest = $is_debug;
        $obj->con = $this->con;
        return $obj;        
    }

    public function inTable($table) {
        $this->query = str_replace('TABLE_NAME', $table, $this->query );
        if($this->isTest) {
            $this->close();
            pr( $this->query ); return;
        }
        //pr( $query );
        if (!($stmt = $this->con->prepare($this->query)))
        {            
            //echo "Fallo en la preparacion sentencia : ( ".$con->errno." ) ".$con->error;
            $result = false;
        }
        else
        {
            if (!$stmt->execute())
            {
                //echo "Fallo en la ejecucion : ( ".$con->errno." ) ".$con->error;     
                $result = false;
            }
            else
            {
                $result = true;
            }
        } 

        if ($this->isAudit()) {
            $this->auditable($this->query,$result);
        }
        
        if($this->isClose){ 
            $this->close();
        }

        return $result;

    }

    public function update($query, $close = false) {
        global $is_debug;

        $result = false;
        //return $query;
        if($is_debug) {
            $this->close();
            pr( $query );  return;
        }
        if (!($stmt = $this->con->prepare($query)))
        {
            //echo "Fallo en la preparacion sentencia : ( ".$con->errno." ) ".$con->error;
            $result = false;
        }
        else
        {
            if (!$stmt->execute())
            {
                //echo "Fallo en la ejecucion : ( ".$con->errno." ) ".$con->error;                
                $result = false;
            }
            else
            {
                $result = true;
            }
        }        
        $stmt->close();

        if ($this->isAudit()) {
            $this->auditable($query,$result);
        }
        
        if($close){ 
            $this->close();
        }
        return $result;
    }
    public function delete($query, $close = false) {
        global $is_debug;

        $result = false;
        if($is_debug) {
            $this->close();
            pr( $query );  return;
        }
        if (!($stmt = $this->con->prepare($query)))
        {
            //echo "Fallo en la preparacion sentencia : ( ".$con->errno." ) ".$con->error;
            $result = false;
        }
        else
        {
            if (!$stmt->execute())
            {
               // echo "Fallo en la ejecucion : ( ".$con->errno." ) ".$con->error;                
                $result = false;
            }
            else
            {
                $result = true;
            }
        }        
        $stmt->close(); 

        if ($this->isAudit()) {
            $this->auditable($query,$result);
        } 
        
        if($close){ 
            $this->close();
        }
        return $result;
    }


    public function spSelect($procedure, $input = array(), $close = false) {  
        global $is_debug;

        if (empty($input))
        {
            $sp = "CALL $procedure()";
        }            
        else
        {
            $sp = "CALL $procedure('".implode("', '", $input)."')";
        }
        
        // solo si se solicita test
        if ($is_debug){
            $this->close();
            pr( $sp ); return;
        }
        
        
        $consult = $this->con->query($sp);
        
        if ( !($consult) ) 
        {
            //echo "Fallo en la llamada: (" . $con->errno . ") " . $con->error;
            $this->close();
            return false;
        }
        $data = NULL;        
        //die(var_dump($consult));
        if ($consult != NULL) {
            
            $n_rows = mysqli_num_rows($consult);
            if ($n_rows > 1) {
                while($row = mysqli_fetch_assoc($consult))
                {
                    $data[] = $row;
                }
            }else {
                $data = mysqli_fetch_assoc($consult);
            }

        }     
        
        if($close){ 
            $this->close();
        }
        return $data;
    }
    
    public function spInsert($procedure, $input = array(), $output = true, $close = false) {                        
        global $is_debug;

        $data = ""; //Salida
        $ret = false; //verifica si se ejecutó correctamente el sp
        
        if($output) // si el sp tiene un parametro de salida
        {
            //die(var_dump("CALL $procedure($input,@salida); SELECT @salida;"));
            // solo si se solicita test
            $sp = "CALL $procedure('".implode("', '", $input)."', @salida); SELECT @salida;";
            if ($is_debug){
                $this->close();
                pr( $sp ); return;
            }

            $consult = $this->con->multi_query($sp);
            //die(var_dump($consult));

            if ($consult) {
                do{
                    if ($result = $this->con->store_result()) {                         
                        while ($row = $result->fetch_row())
                        {                        
                            foreach ($row as $cell) {
                                $data = $cell;#mensaje de salida del procedure                            
                            }
                        }                    
                        $result->close();                    
                        if ($this->con->more_results()) {
                            $data .= " \t";
                        }else
                        {            
                            if ($this->isAudit()) {
                                $this->auditable($sp,$consult);
                            }

                            if($close){ 
                                $this->close();
                            }
                            return $data;//return
                        }
                    }
                }while($this->con->next_result());
            }
            
        }else
        {
            //die(var_dump("CALL $procedure($input)"));
            // solo si se solicita test
            $sp = "CALL $procedure('".implode("', '", $input)."')";
            if ($is_debug){
                $this->close();
                pr( $sp ); return;
            }
            if(!$this->con->multi_query($sp))
            {
                //echo "Falla en CALL: (" . $con->errno . ") " . $con->error;
                    $ret = false;
                }else
                {
                    $ret = true;
                }

                if ($this->isAudit()) {
                    $this->auditable($sp,$ret);
                }
                
                if($close){ 
                    $this->close();
                }
                return $ret;
        }

    }

    public function tquery( $sql, $close = false ) {
        global $is_debug;
        if ($is_debug) {
            pr( $sql ) ; return;
        }
        return $this->con->query($sql);
    }

    public function auditable($query, $success) {
        global $is_debug;
        global $db;
        global $config;

        //if ( $this->is_session_started() === FALSE ) session_start();
        $sql = "INSERT INTO ".$this->audit_table." (usuario,sql_,sql_success,ip,host,browser) VALUES(";
        $sql .= "'".$_REQUEST['username']."', ";
        $sql .= "\"".$query."\", ";
        $sql .= " ".$success.", ";
        $sql .= "'".$_SERVER['REMOTE_ADDR']."', ";
        $sql .= "\"".$_SERVER['REMOTE_ADDR']."\", ";
        $sql .= " '' ";
        $sql .= ")";
        //die(var_dump($sql));
        if ( !$is_debug )  $db->query($sql);
    }

    /**
    * @return bool
    */
    public function is_session_started()
    {
        if ( php_sapi_name() !== 'cli' ) {
            if ( version_compare(phpversion(), '5.4.0', '>=') ) {
                return session_status() === PHP_SESSION_ACTIVE ? TRUE : FALSE;
            } else {
                return session_id() === '' ? FALSE : TRUE;
            }
        }
        return FALSE;
    }
    
}