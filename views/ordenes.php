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
                    <h1 class="col page-title">Órdenes de Compra</h1>
                    <button class="col-sm-2 align-self-end btn btn-primary mr-3" id="AddOrden">Nueva Orden</button>
            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                    <table id="tabla_ordenes" class="dataTables_length display" style="width:100%">
                        <thead>
                            <tr>
                                <th>Nº de Orden</th>
                                <th>Nombre</th>
                                <th>Cantidad</th>
                                <th>Sector</th>
                                <th>Fecha de Orden</th>
                                <th>Autorizada</th>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Crear nueva orden de compra</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="ordenName">Nombre de la Orden</label>
            <input type="text" class="form-control" id="ordenName" placeholder="Agregar nombre del producto"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="ordenCant">Cantidad</label>
            <input type="number" class="form-control" id="ordenCant" placeholder="0"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label>Status</label>
            <select class="form-control" id="selectSector" style="width: 100%" data-hide-search="true">
                <option value="0" selected disabled>Seleccione el sector</option>
            </select>
        </div>
        <div class="col-lg-12 mt-4">
          <label class="ui-checkbox ui-checkbox-success">
          <input type="checkbox" id="authorizedCheck">
            <span class="input-span"></span>Autorizada
          </label>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="ordenName">Nombre de la Orden</label>
            <input type="text" class="form-control" id="ordenNameEdit" placeholder="Agregar nombre del producto"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="ordenCant">Nombre de la Orden</label>
            <input type="number" class="form-control" id="ordenCantEdit" placeholder="0"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label>Status</label>
            <select class="form-control" id="selectSectorEdit" style="width: 100%" data-hide-search="true">
                <option value="0" selected disabled>Seleccione el sector</option>
            </select>
        </div>
        <div class="col-lg-12 mt-4">
          <label class="ui-checkbox ui-checkbox-success">
          <input type="checkbox" id="authorizedCheckEdit">
            <span class="input-span"></span>Autorizada
          </label>
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
  <script src="../js/console-ordenes.js" type="text/javascript"></script>
</body>
</html>