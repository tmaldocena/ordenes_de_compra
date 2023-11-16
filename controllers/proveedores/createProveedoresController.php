<?php
    require '../../models/proveedores.php';
    
    $MProv = new proveedores();
    
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $rubro = htmlspecialchars($_POST['rubro'], ENT_QUOTES, 'UTF-8');

    $request = $MProv->register_Proveedor($nombre, $rubro);
    echo $request;
?>