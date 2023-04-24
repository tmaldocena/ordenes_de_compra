<?php
    require '../../models/role.php';
    $MR = new role();
    $role = htmlspecialchars($_POST['role'], ENT_QUOTES, 'UTF-8');
    $request = $MR->register_role($role);
    echo $request;
?>