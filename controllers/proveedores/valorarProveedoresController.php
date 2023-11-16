<?php
    require '../../models/proveedores.php';
    $MProv = new proveedores();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $acum_rating = htmlspecialchars($_POST['acum_rating'], ENT_QUOTES, 'UTF-8');
    $cant_rating = htmlspecialchars($_POST['cant_rating'], ENT_QUOTES, 'UTF-8');
    $request = $MProv->valorar_proveedor($id, $acum_rating, $cant_rating);
    echo $request;
?>