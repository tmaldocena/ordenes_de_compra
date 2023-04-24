<?php
    $pass = password_hash('123456789', PASSWORD_DEFAULT, ['cost'=>10]);
    echo $pass;
?>