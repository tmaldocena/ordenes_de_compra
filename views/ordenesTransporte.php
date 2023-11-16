<?php
    session_start();

    if(!isset($_SESSION['S_IDUSER'])){
        header('Location: login.php');
    };
?>
<!DOCTYPE html>
<html lang="es">

<?php include 'template/head.php' ?>
<style>
  .dataTables_filter {
    white-space:nowrap;
}

.dataTables_filter label, .dataTables_filter input {
    display: inline-block;
}
</style>


<body class="fixed-navbar">
    <div class="page-wrapper">
        <!-- HEADER -->
        <?php include 'template/header.php'?>
        <!-- SIDEBAR-->
        <?php include 'template/sidebar.php'?>

        <div class="content-wrapper">
            <div class="page-heading row">
                    <h1 class="col page-title">Órdenes de Transportes</h1>
                    <button class="col-sm-2 align-self-end btn btn-primary mr-3" id="AddOrdenT">Nueva Orden</button>
            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                    <table id="tabla_ordenes" class="dataTables_length display" style="width:100%">
                        <thead>
                            <tr>
                                <th>Nº de Orden</th>
                                <th>Desde</th>
                                <th>Destino</th>
                                <th>Fecha de Transporte</th>
                                <th>Solicita</th>
                                <th>Presupuestada</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody id="tableBody">
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
        </div>
    </div>
<!-- Modal Crear -->
<div class="modal fade" id="modal_createOrden" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Crear nueva orden de transporte</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
          <div class="col-lg-6">
              <label for="ordenDesde">Desde</label>
              <input type="text" class="form-control" id="ordenDesde" placeholder="Agregar lugar de salida"></input>
          </div>
          <div class="col-lg-6">
              <label for="ordenHasta">Hasta</label>
              <input type="text" class="form-control" id="ordenHasta" placeholder="Agregar lugar de llegada"></input>
          </div>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="ordenCant">Persona que solicita</label>
            <input type="text" class="form-control" id="ordenSolicita" placeholder="Persona que solicita el transporte"></input>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="createOrden">Crear Orden</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
<!-- Modal Edit -->
<div class="modal fade" id="modal_editOrden" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Orden</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="row">
            <div class="col-lg-6">
                <label for="ordenDesdeEdit">Desde</label>
                <input type="text" class="form-control" id="ordenDesdeEdit" placeholder="Agregar lugar de salida"></input>
            </div>
            <div class="col-lg-6">
                <label for="ordenHastaEdit">Hasta</label>
                <input type="text" class="form-control" id="ordenHastaEdit" placeholder="Agregar lugar de llegada"></input>
            </div>
          </div>
        <div class="col-lg-12 mt-4">
            <label for="ordenSolicitaEdit">Persona que solicita</label>
            <input type="text" class="form-control" id="ordenSolicitaEdit" placeholder="Persona que solicita el transporte"></input>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="updateOrden">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
    
  <?php include 'template/plugins.php'?>
  <!-- PAGE LEVEL SCRIPTS-->
  <script src="../js/console-ordenesT.js" type="text/javascript"></script>
</body>
</html>