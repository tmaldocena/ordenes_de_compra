<?php
class contactos{
        private $connection;

        function __construct(){
            require_once 'connection.php';
            $this->connection = new connection();
            $this->connection->connect();
        }

        function list_contactos($idProveedor, $idTransporte){
            $sql = "call SP_LIST_CONTACTOS('$idProveedor','$idTransporte')";
            $array = array();
            
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_assoc($request)){
                        $array['data'][] = $request_vu;
                }
                return $array;
                $this->connection->close();
            }
        }

        function register_contacto($nombre, $telefono, $correo, $transporte_id, $proveedor_id){
            $sql = "call SP_REGISTER_CONTACTO('$nombre', '$telefono', '$correo', '$transporte_id', '$proveedor_id')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }

        function update_contacto($id, $nombre, $telefono, $correo){
            $sql = "call SP_UPDATE_CONTACTO('$id', '$nombre', '$telefono', '$correo')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function select_presupuesto($id){
            $sql = "call SP_SELECT_PRESUPUESTO('$id')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
        function unselect_presupuesto($id){
            $sql = "call SP_UNSELECT_PRESUPUESTO('$id')";
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