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
                    <h1 class="col page-title" id="titulo">Contactos</h1>
                    <button class="col-sm-2 align-self-end btn btn-success mr-3" id="volver">Volver</button>

            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                    <div class="col-xl-12">
                        <div class="ibox">
                            <div class="ibox-body" id='bodyP'>
                                <div class='d-flex justify-content-between' id='center'>
                                    <h5 class="font-strong mt-3" id='contacto_D'>Contactos disponibles</h5>
                                    <button class="col-sm-2 align-self-end btn btn-primary mr-3 mt-3" id="addContacto">Agregar Contacto</button>
                                </div>
                                <table class="table table-hover" id='tableContacto'>
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nombre</th>
                                            <th>Telefono</th>
                                            <th>Email</th>
                                            <th>Acciones</th>
                                        </tr>
                                    </thead>
                                    <tbody id='tbodyContacto'>
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
<div class="modal fade" id="modal_createContacto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Crear nuevo contacto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="nameContacto">Nombre del contacto</label>
            <input type="text" class="form-control" id="nameContacto" placeholder="Nombre y Apellido"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="telefonoContacto">Telefono</label>
            <input type="text" class="form-control" id="telefonoContacto" placeholder="Telefono de contacto"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="mailContacto">Email</label>
            <input type="text" class="form-control" id="mailContacto" placeholder="Email de contacto"></input>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="addC">Agregar Contacto</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
<!-- Modal Edit -->
<div class="modal fade" id="modal_editContacto" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle">Editar contacto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <div class="col-lg-12">
            <label for="nameContactoEdit">Nombre del contacto</label>
            <input type="text" class="form-control" id="nameContactoEdit" placeholder="Nombre y Apellido"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="telefonoContactoEdit">Telefono</label>
            <input type="text" class="form-control" id="telefonoContactoEdit" placeholder="Telefono de contacto"></input>
        </div>
        <div class="col-lg-12 mt-4">
            <label for="mailContactoEdit">Email</label>
            <input type="text" class="form-control" id="mailContactoEdit" placeholder="Email de contacto"></input>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-primary" id="updateContacto">Agregar Contacto</button>
      </div>
    </div>
  </div>
</div>
<!-- End Modal -->
    </div>
    <?php include 'template/plugins.php'?>
  <!-- PAGE LEVEL SCRIPTS-->
  <script src="../js/console-contactos.js" type="text/javascript"></script>
</body>
</html>