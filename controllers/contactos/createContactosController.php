<?php
    require '../../models/contactos.php';
    
    $MC = new contactos();
    
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
    $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');
    $transporte_id = htmlspecialchars($_POST['transporte_id'], ENT_QUOTES, 'UTF-8');
    $proveedor_id = htmlspecialchars($_POST['proveedor_id'], ENT_QUOTES, 'UTF-8');

    $request = $MC->register_contacto($nombre, $telefono, $correo, $transporte_id, $proveedor_id);
    echo $request;
?>