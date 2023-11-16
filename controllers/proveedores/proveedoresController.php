<?php
    require '../../models/proveedores.php';

    $MProv = new proveedores();

    $request = $MProv->list_proveedores();
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