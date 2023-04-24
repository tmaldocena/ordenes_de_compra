<?php
    require '../../models/sectores.php';

    $MS = new sectores();

    $request = $MS->list_sectores();
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