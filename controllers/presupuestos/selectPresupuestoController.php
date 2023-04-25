<?php
    require '../../models/presupuesto.php';
    require '../../models/ordenes.php';
    $MP = new presupuesto();
    $MO = new ordenes();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');
    $select = htmlspecialchars($_POST['select'], ENT_QUOTES, 'UTF-8');
    if($select === 'si'){
        $request = $MP->select_presupuesto($id);
        $req = $MO->presupuestar($idOrden, $id);
    }else{
        $request = $MP->unselect_presupuesto($id);
        $req = $MO->presupuestar($idOrden, '0');
    }
    echo $request;
?>