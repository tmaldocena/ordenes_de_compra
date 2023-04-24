<?php
    require '../../models/ordenes.php';
    $MO = new ordenes();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $cantidad = htmlspecialchars($_POST['cantidad'], ENT_QUOTES, 'UTF-8');
    $sector = htmlspecialchars($_POST['sector'], ENT_QUOTES, 'UTF-8');
    $autorizada = htmlspecialchars($_POST['autorizada'], ENT_QUOTES, 'UTF-8');
    $request = $MO->update_orden($id, $nombre, $cantidad, $sector, $autorizada);
    echo $request;
?>