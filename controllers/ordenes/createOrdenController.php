<?php
    require '../../models/ordenes.php';
    
    $MO = new ordenes();
    
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');
    $sector = htmlspecialchars($_POST['sector'], ENT_QUOTES, 'UTF-8');
    $autorizada = htmlspecialchars($_POST['autorizada'], ENT_QUOTES, 'UTF-8');
    $fecha = date('Y-m-d H:i:s', strtotime('-3 hour'));

    $request = $MO->register_Orden($nombre, $cantidad, $sector, $autorizada, $fecha);
    echo $request;
?>