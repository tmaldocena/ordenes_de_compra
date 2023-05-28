<?php
    require '../../models/ordenes.php';
    $MO = new ordenes();

    $sectorID = htmlspecialchars($_POST['sectorID'], ENT_QUOTES, 'UTF-8');
    $request = $MO->filter_orden($sectorID);
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