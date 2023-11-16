<?php
    require '../../models/transportes.php';
    $MProv = new transportes();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $request = $MProv->update_transportes($id, $nombre);
    echo $request;
?>