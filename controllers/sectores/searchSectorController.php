<?php
require '../../models/sectores.php';

$MS = new sectores();

$sectorID = htmlspecialchars($_POST['sectorID'], ENT_QUOTES, 'UTF-8');
$request = $MS->search_sector($sectorID);
if($request){
    echo json_encode($request);
}else{
    echo '0';
}
?>