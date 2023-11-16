<?php
    require '../../models/contactos.php';
    
    $MC = new contactos();
    
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $telefono = htmlspecialchars($_POST['telefono'], ENT_QUOTES, 'UTF-8');
    $correo = htmlspecialchars($_POST['correo'], ENT_QUOTES, 'UTF-8');

    $request = $MC->update_contacto($id, $nombre, $telefono, $correo);
    echo $request;
?>