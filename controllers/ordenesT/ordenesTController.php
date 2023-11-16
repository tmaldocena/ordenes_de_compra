<?php
    require '../../models/ordenesT.php';

    $MO = new ordenesT();

    $request = $MO->list_ordenesT();
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