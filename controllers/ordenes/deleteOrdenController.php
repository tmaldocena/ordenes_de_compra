<?php
    require '../../models/ordenes.php';
    $MO = new ordenes();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $request = $MO->delete_orden($id);
    echo $request;
?>