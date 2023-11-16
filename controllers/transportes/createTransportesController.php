<?php
    require '../../models/transportes.php';
    
    $MT = new transportes();
    
    $nombre = htmlspecialchars($_POST['nombre'], ENT_QUOTES, 'UTF-8');
    $request = $MT->register_transportes($nombre);
    echo $request;
?>