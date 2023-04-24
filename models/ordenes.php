<?php
class ordenes{
        private $connection;

        function __construct(){
            require_once 'connection.php';
            $this->connection = new connection();
            $this->connection->connect();
        }

        function list_ordenes(){
            $sql = "call SP_LIST_ORDENES()";
            $array = array();
            
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_assoc($request)){
                        $array['data'][] = $request_vu;
                }
                return $array;
                $this->connection->close();
            }
        }

        function register_Orden($nombre, $cantidad, $sector, $auth, $fecha){
            $sql = "call SP_REGISTER_ORDEN('$nombre', '$cantidad', '$sector', '$auth', '$fecha')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }

        function update_orden($id, $nombre, $cantidad, $sector, $autorizada){
            $sql = "call SP_UPDATE_ORDEN('$id', '$nombre', '$cantidad', '$sector', '$autorizada')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function delete_orden($id){
            $sql = "call SP_DELETE_ORDEN('$id')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function presupuestar($ordenId, $presuId){
            $sql = "call SP_PRESUPUESTAR('$ordenId', '$presuId')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }
            $this->connection->close();
        }   
    }
?>