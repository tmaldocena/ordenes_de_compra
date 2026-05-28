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
        function bulkRegisterOrden($data){
            require_once 'sectores.php';
            $MS = new sectores();
            $sectoresList = $MS->list_sectores();
            $sectorMap = array();
            if($sectoresList && isset($sectoresList['data'])){
                foreach($sectoresList['data'] as $s){
                    $sectorMap[strtolower(trim($s['nombre']))] = $s['sector_id'];
                }
            }

            $results = array('success' => 0, 'errors' => array());

            foreach($data as $index => $row){
                $nombre = trim($row['nombre']);
                $cantidad = trim($row['cantidad']);
                $sectorName = trim($row['sector']);
                $autorizada = (isset($row['autorizada']) && strtoupper(trim($row['autorizada'])) === 'SI') ? 'SI' : 'NO';

                if(empty($nombre)){
                    $results['errors'][] = "Fila " . ($index + 1) . ": Nombre vacío";
                    continue;
                }
                if(!is_numeric($cantidad) || $cantidad <= 0){
                    $results['errors'][] = "Fila " . ($index + 1) . ": Cantidad inválida ('$cantidad')";
                    continue;
                }
                $sectorId = isset($sectorMap[strtolower($sectorName)]) ? $sectorMap[strtolower($sectorName)] : null;
                if(!$sectorId){
                    $results['errors'][] = "Fila " . ($index + 1) . ": Sector '$sectorName' no encontrado";
                    continue;
                }

                $result = $this->register_Orden($nombre, $cantidad, $sectorId, $autorizada, date('Y-m-d H:i:s', strtotime('-3 hour')));
                if($result == 1){
                    $results['success']++;
                } else {
                    $results['errors'][] = "Fila " . ($index + 1) . ": Error al registrar '$nombre'";
                }
            }

            return $results;
        }

        function filter_orden($sectorID){
            $sql = "call SP_FILTER_ORDEN('$sectorID')";
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