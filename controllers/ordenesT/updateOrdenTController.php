<?php
    require '../../models/ordenesT.php';
    $MO = new ordenesT();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $desde = htmlspecialchars($_POST['desde'], ENT_QUOTES, 'UTF-8');
    $hasta = htmlspecialchars($_POST['hasta'], ENT_QUOTES, 'UTF-8');
    $solicitante = htmlspecialchars($_POST['solicitante'], ENT_QUOTES, 'UTF-8');
    $request = $MO->update_orden_t($id, $desde, $hasta, $solicitante);
    echo $request;
?>