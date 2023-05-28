<?php
    require '../../models/presupuesto.php';
    $MP = new presupuesto();

    $presupuestoID = htmlspecialchars($_POST['presupuestoID'], ENT_QUOTES, 'UTF-8');
    if($presupuestoID === ''){
        $presupuestoID = '0';
    }
    $request = $MP->filter_presupuesto($presupuestoID);
    if($request){
        echo json_encode($request);
    }else{
        echo 'not-found';
    }
?>