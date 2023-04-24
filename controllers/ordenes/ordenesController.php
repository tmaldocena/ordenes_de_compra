<?php
    require '../../models/ordenes.php';

    $MO = new ordenes();

    $request = $MO->list_ordenes();
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