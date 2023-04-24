<?php
    $IDUSER = $_POST['idUser'];
    $USER = $_POST['username'];
    $ROLE = $_POST['role'];

    session_start();
    $_SESSION['S_IDUSER'] = $IDUSER;
    $_SESSION['S_USER'] = $USER;
    $_SESSION['S_ROLE'] = $ROLE;

    function closeSession(){
        session_start();
        session_destroy();
    }
?>