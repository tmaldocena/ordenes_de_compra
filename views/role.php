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
                    <h1 class="col page-title">Roles</h1>
                    <button class="col-sm-1 align-self-end btn btn-primary mr-3" id="AddRole">Nuevo Rol</button>
                </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                    <table id="tabla_roles" class="dataTables_length display" style="width:100%">
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Nombre</th>
                                <th>Estado</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                        </tbody>
                    </table>
                    </div>
                </div>
            </div>
        </div>
<!-- Modal Crear -->
<div class="modal fade" id="modal_createRole" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Registrar un nuevo rol</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <label for="inputRole">Nombre del nuevo rol</label>
        <input type="text" class="form-control" id="input_role" placeholder="Agregar nombre al rol"></input>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="createRole">Crear Rol</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
<!-- Modal Edit -->
<div class="modal fade" id="modal_editRole" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
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
          <label for="inputRole">Nombre del rol</label>
          <input type="text" class="form-control" id="edit_role" placeholder="Agregar nombre al rol"></input>
        </div>
        <div class="col-lg-12 mt-4">
          <label>Status</label>
          <select class="form-control" id="roleState" style="width: 100%">
            <option value="ACTIVO">Activo</option>
            <option value="INACTIVO">Inactivo</option>
          </select>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="updateRole">Actualizar</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
    <!-- BEGIN PAGA BACKDROPS-->
    <div class="sidenav-backdrop backdrop"></div>
    <div class="preloader-backdrop">
        <div class="page-preloader">Loading</div>
    </div>
    <!-- END PAGA BACKDROPS-->
    <!-- CORE PLUGINS-->
    <script src="template/assets/vendors/jquery/dist/jquery.min.js" type="text/javascript"></script>
    <script src="template/assets/vendors/popper.js/dist/umd/popper.min.js" type="text/javascript"></script>
    <script src="template/assets/vendors/bootstrap/dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="template/assets/vendors/metisMenu/dist/metisMenu.min.js" type="text/javascript"></script>
    <script src="template/assets/vendors/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL PLUGINS-->
    <script src="template/assets/vendors/chart.js/dist/Chart.min.js" type="text/javascript"></script>
    <script src="template/assets/vendors/jvectormap/jquery-jvectormap-2.0.3.min.js" type="text/javascript"></script>
    <script src="template/assets/vendors/jvectormap/jquery-jvectormap-world-mill-en.js" type="text/javascript"></script>
    <script src="template/assets/vendors/jvectormap/jquery-jvectormap-us-aea-en.js" type="text/javascript"></script>
    <script src="template/assets/vendors/DataTables/datatables.min.js" type="text/javascript"></script>
    <script src="template\assets\vendors\select2\dist\js\select2.min.js" type="text/javascript"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <!-- CORE SCRIPTS-->
    <script src="template/assets/js/app.min.js" type="text/javascript"></script>
    <!-- PAGE LEVEL SCRIPTS-->
    <script src="../js/console-roles.js" type="text/javascript"></script>
    
</body>

</html>