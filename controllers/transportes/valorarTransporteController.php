<?php
    require '../../models/transportes.php';
    $MTransporte = new transportes();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $acum_rating = htmlspecialchars($_POST['acum_rating'], ENT_QUOTES, 'UTF-8');
    $cant_rating = htmlspecialchars($_POST['cant_rating'], ENT_QUOTES, 'UTF-8');
    $request = $MTransporte->valorar_transporte($id, $acum_rating, $cant_rating);
    echo $request;
?>