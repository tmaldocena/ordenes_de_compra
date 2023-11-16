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
                    <h1 class="col page-title">Transportes</h1>
                    <button class="col-sm-2 align-self-end btn btn-primary mr-3" id="AddTransportes">Nuevo Transporte</button>
            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                    <table id="tabla_transportes" class="dataTables_length display" style="width:100%">
                        <thead>
                            <tr>
                                <th>Nº de Proveedor</th>
                                <th>Nombre</th>
                                <th>Rating</th>
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

            <footer class="page-footer">
                <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
            </footer>
        </div>
    </div>
<!-- Modal Crear -->
<div class="modal fade" id="modal_createTransporte" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Agregar nuevo transporte</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="transporteName">Nombre del Transporte</label>
            <input type="text" class="form-control" id="transporteName" placeholder="Agregar nombre del transporte"></input>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="createTransporte">Agregar Transporte</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
<!-- Modal Edit -->
<div class="modal fade" id="modal_editTransporte" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Transporte</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="transporteNameEdit">Nombre del transporte</label>
            <input type="text" class="form-control" id="transporteNameEdit" placeholder="Agregar nombre del transporte"></input>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="updateTransporte">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
    <?php include 'template/plugins.php'?>
    <!-- PAGE LEVEL SCRIPTS-->
    <script src="../js/console-transportes.js" type="text/javascript"></script>
</body>

</html>