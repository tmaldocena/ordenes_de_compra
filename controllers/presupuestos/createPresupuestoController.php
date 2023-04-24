<?php
    require '../../models/presupuesto.php';
    
    $MP = new presupuesto();
    
    $ordenId = htmlspecialchars($_POST['orden_id'], ENT_QUOTES, 'UTF-8');
    $tienda = htmlspecialchars($_POST['tienda'], ENT_QUOTES, 'UTF-8');
    $precio = htmlspecialchars($_POST['precio'], ENT_QUOTES, 'UTF-8');

    $request = $MP->register_Presupuesto($ordenId, $tienda, $precio);
    echo $request;
?>