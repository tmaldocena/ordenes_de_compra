<?php
    require '../../models/ordenesT.php';
    $MO = new ordenesT();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $request = $MO->delete_orden_t($id);
    echo $request;
?>