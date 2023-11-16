<?php
    require '../../models/presupuestoT.php';
    
    $MP = new presupuestoT();
    
    $ordenId = htmlspecialchars($_POST['orden_id'], ENT_QUOTES, 'UTF-8');
    $transporte = htmlspecialchars($_POST['transporte'], ENT_QUOTES, 'UTF-8');
    $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');

    $request = $MP->register_presupuesto_t($ordenId, $transporte, $precio);
    echo $request;
?>