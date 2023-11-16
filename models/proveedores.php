<?php
class proveedores{
        private $connection;

        function __construct(){
            require_once 'connection.php';
            $this->connection = new connection();
            $this->connection->connect();
        }

        function list_proveedores(){
            $sql = "call SP_LIST_PROVEEDORES()";
            $array = array();
            
            if($request = $this->connection->connection->query($sql)){
                while($request_vu = mysqli_fetch_assoc($request)){
                        $array['data'][] = $request_vu;
                }
                return $array;
                $this->connection->close();
            }
        }

        function register_Proveedor($nombre, $rubro){
            $sql = "call SP_REGISTER_PROVEEDOR('$nombre', '$rubro')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }

        function update_proveedor($id, $nombre, $rubro){
            $sql = "call SP_UPDATE_PROVEEDORES('$id', '$nombre', '$rubro')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }

        function valorar_proveedor($id, $acum_rating, $cant_rating){
            $sql = "call SP_VALORAR_PROVEEDORES('$id', '$acum_rating', '$cant_rating')";
            if($request = $this->connection->connection->query($sql)){
                if($row = mysqli_fetch_array($request)){
                    return $response = trim($row[0]);
                }
            }

            $this->connection->close();
        }
}
?>