<?php
    require '../../models/user.php';

    $userModel = new user();

    $user = htmlspecialchars($_POST['username'], ENT_QUOTES, 'UTF-8');
    $password = htmlspecialchars($_POST['password'], ENT_QUOTES, 'UTF-8');
    $request = $userModel->verifyUser($user, $password);
    $data = json_encode($request);
    if(count($request)> 0){
        echo $data;
    }else{
        echo 0;
    }
?>