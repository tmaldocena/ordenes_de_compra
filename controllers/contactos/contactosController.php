<?php
    require '../../models/contactos.php';

    $MC = new contactos();

    $proveedorId = htmlspecialchars($_POST['proveedor_id'], ENT_QUOTES, 'UTF-8');
    $transporteId = htmlspecialchars($_POST['transporte_id'], ENT_QUOTES, 'UTF-8');
    $request = $MC->list_contactos($proveedorId, $transporteId);
    if($request){
        echo json_encode($request);
    }else{
        echo 'null';
    }
?>