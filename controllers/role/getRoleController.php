<?php
    require '../../models/role.php';
    $MR = new role();
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $request = $MR->getRole($id);
    echo $request;
?>