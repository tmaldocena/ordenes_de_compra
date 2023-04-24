<?php
    require '../../models/role.php';
    $MR = new role();
    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $role = htmlspecialchars($_POST['role'], ENT_QUOTES, 'UTF-8');
    $state = htmlspecialchars($_POST['state'], ENT_QUOTES, 'UTF-8');
    $request = $MR->update_role($id, $role, $state);
    echo $request;
?>