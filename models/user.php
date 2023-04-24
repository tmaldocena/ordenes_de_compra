<?php
    class user{
        private $connection;

        function __construct(){
            require_once 'connection.php';
            $this->connection = new connection();
            $this->connection->connect();
        }

        function verifyUser($username, $password){
            $sql = "call SP_VERIFY_USER('$username')";
            $array = array();
            
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_array($request)){
                    if(password_verify($password, $request_vu['password'])){
                        $array[] = $request_vu;
                    }
                }
                return $array;
                $this->connection->close();
            }
        }
    }
?>