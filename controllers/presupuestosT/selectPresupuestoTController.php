<?php
    require '../../models/presupuestoT.php';
    require '../../models/ordenesT.php';
    $MP = new presupuestoT();
    $MO = new ordenesT();

    $id = htmlspecialchars($_POST['id'], ENT_QUOTES, 'UTF-8');
    $idOrden = htmlspecialchars($_POST['idOrden'], ENT_QUOTES, 'UTF-8');
    $select = htmlspecialchars($_POST['select'], ENT_QUOTES, 'UTF-8');
    if($select === 'si'){
        $request = $MP->select_presupuesto_t($id);
        $req = $MO->presupuestar_t($idOrden, $id);
    }else{
        $request = $MP->unselect_presupuesto_t($id);
        $req = $MO->presupuestar_t($idOrden, '0');
    }
    echo $request;
?>