<?php
    require '../../models/ordenes.php';

    $MO = new ordenes();

    $data = json_decode($_POST['data'], true);

    if(!$data || !is_array($data)){
        echo json_encode(['success' => 0, 'errors' => ['No se recibieron datos válidos']]);
        exit;
    }

    $request = $MO->bulkRegisterOrden($data);
    echo json_encode($request);
?>
