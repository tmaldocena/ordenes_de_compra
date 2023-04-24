<?php
    require '../../models/presupuesto.php';

    $MP = new presupuesto();

    $ordenId = htmlspecialchars($_POST['orden_id'], ENT_QUOTES, 'UTF-8');
    $request = $MP->list_presupuestos($ordenId);
    if($request){
        echo json_encode($request);
    }else{
        echo 'null';
    }
?>