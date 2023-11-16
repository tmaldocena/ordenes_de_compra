<?php
class ordenesT{
        private $connection;

        function __construct(){
            require_once 'connection.php';
            $this->connection = new connection();
            $this->connection->connect();
        }

        function list_ordenesT(){
            $sql = "call SP_LIST_ORDENES_T()";
            $array = array();
            
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_assoc($request)){
                        $array['data'][] = $request_vu;
                }
                return $array;
                $this->connection->close();
            }
        }

        function register_orden_t($desde, $hasta, $solicitante, $fecha){
            $sql = "call SP_REGISTER_ORDEN_T('$desde', '$hasta', '$solicitante', '$fecha')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }

        function update_orden_t($id, $desde, $hasta, $solicitante){
            $sql = "call SP_UPDATE_ORDEN_T('$id', '$desde', '$hasta', '$solicitante')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function delete_orden_t($id){
            $sql = "call SP_DELETE_ORDEN_T('$id')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function presupuestar_t($ordenId, $presuId){
            $sql = "call SP_PRESUPUESTAR_T('$ordenId', '$presuId')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }
            $this->connection->close();
        }
    }
?>