<?php
    require '../../models/transportes.php';

    $MT = new transportes();

    $request = $MT->list_transportes();
    if($request){
        echo json_encode($request);
    }else{
        echo '{
            "sEcho": 1,
            "iTotalRecords": "0",
            "iTotalDisplayRecords": "0",
            "aaData": []
        }';
    }
?>