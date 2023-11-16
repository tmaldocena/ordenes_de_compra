<?php
    require '../../models/proveedores.php';
    $MProv = new proveedores();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $rubro = htmlspecialchars($_POST['rubro'], ENT_QUOTES, 'UTF-8');
    $request = $MProv->update_proveedor($id, $nombre, $rubro);
    echo $request;
?>