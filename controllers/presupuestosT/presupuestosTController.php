<?php
    require '../../models/presupuestoT.php';

    $MP = new presupuestoT();

    $ordenId = htmlspecialchars($_POST['orden_id'], ENT_QUOTES, 'UTF-8');
    $request = $MP->list_presupuestos_t($ordenId);
    if($request){
        echo json_encode($request);
    }else{
        echo 'null';
    }
?>