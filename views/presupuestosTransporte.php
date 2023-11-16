<?php
    session_start();

    if(!isset($_SESSION['S_IDUSER'])){
        header('Location: login.php');
    };
?>
<!DOCTYPE html>
<html lang="es">

<?php include 'template/head.php' ?>


<body class="fixed-navbar">
    <div class="page-wrapper">
        <!-- HEADER -->
        <?php include 'template/header.php'?>
        <!-- SIDEBAR-->
        <?php include 'template/sidebar.php'?>

        <div class="content-wrapper">
            <div class="page-heading row">
                    <h1 class="col page-title" id="titulo"></h1>
                    <button class="col-sm-2 align-self-end btn btn-success mr-3" id="volver">Volver</button>

            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                    <div class="col-xl-12">
                        <div class="ibox">
                            <div class="ibox-body" id='bodyP'>
                                <div class='d-flex justify-content-between' id='center'>
                                    <h5 class="font-strong mt-3" id='presu_D'>Presupuestos disponibles</h5>
                                    <button class="col-sm-2 align-self-end btn btn-primary mr-3 mt-3" id="addPresupuesto">Agregar Presupuesto</button>
                                </div>
                                <table class="table table-hover" id='tablePresupuesto'>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Transporte</th>
                                            <th>Precio ($)</th>
                                            <th>Seleccionado</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id='tbodyPresupuesto'>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
<!-- Modal Crear -->
<div class="modal fade" id="modal_createPresu" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Crear nuevo presupuesto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      <div class="col-lg-12 mt-4">
            <label>Elegir Transporte</label>
            <select class="form-control" id="selectTransporte" style="width: 100%" data-hide-search="true">
                <option value="0" selected disabled>Seleccione el transporte</option>
            </select>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="precioP">Precio</label>
            <div class="input-group">
                <div class="input-group-addon bg-white">$</div>
                <input type="number" class="form-control" id="precioP" placeholder="0" step="0.01"></input>
            </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="addP">Agregar Presupuesto</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
    </div>
    <?php include 'template/plugins.php'?>
  <!-- PAGE LEVEL SCRIPTS-->
  <script src="../js/console-presupuestosTransporte.js" type="text/javascript"></script>
</body>
</html>