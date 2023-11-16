<?php
class presupuestoT{
        private $connection;

        function __construct(){
            require_once 'connection.php';
            $this->connection = new connection();
            $this->connection->connect();
        }

        function list_presupuestos_t($id){
            $sql = "call SP_LIST_PRESUPUESTOS_T('$id')";
            $array = array();
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_assoc($request)){
                        $array['data'][] = $request_vu;
                }
                return $array;
                $this->connection->close();
            }
        }

        function register_presupuesto_t($ordenId, $transporte, $precio){
            $sql = "call SP_REGISTER_PRESUPUESTOS_T('$ordenId', '$transporte', '$precio')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }

        function update_presupuesto($id, $nombre, $cantidad, $sector, $autorizada){
            $sql = "call SP_UPDATE_PRESUPUESTOS('$id', '$nombre', '$cantidad', '$sector', '$autorizada')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function select_presupuesto_t($id){
            $sql = "call SP_SELECT_PRESUPUESTO_T('$id')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function unselect_presupuesto_t($id){
            $sql = "call SP_UNSELECT_PRESUPUESTO_T('$id')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function filter_presupuesto($presupuestoID){
            $sql = "call SP_FILTER_PRESUPUESTO('$presupuestoID')";
            $array = array();
            
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_assoc($request)){
                        $array['data'][] = $request_vu;
                }
                return $array;
                $this->connection->close();
            }

            $this->connection->close();
        }
    }
?>