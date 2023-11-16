<?php
    require '../../models/ordenesT.php';
    
    $MO = new ordenesT();
    
    $desde = htmlspecialchars($_POST['desde'], ENT_QUOTES, 'UTF-8');
    $hasta = htmlspecialchars($_POST['hasta'], ENT_QUOTES, 'UTF-8');
    $solicitante = htmlspecialchars($_POST['solicitante'], ENT_QUOTES, 'UTF-8');
    $fecha = date('Y-m-d H:i:s', strtotime('-3 hour'));

    $request = $MO->register_orden_t($desde, $hasta, $solicitante, $fecha);
    echo $request;
?>