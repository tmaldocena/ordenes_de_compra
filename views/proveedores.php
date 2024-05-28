<?php
session_start();

if (!isset($_SESSION['S_IDUSER'])) {
  header('Location: login.php');
};
?>
<!DOCTYPE html>
<html lang="es">

<?php include 'template/head.php' ?>

<body class="fixed-navbar">
  <div class="page-wrapper">
    <!-- HEADER -->
    <?php include 'template/header.php' ?>
    <!-- SIDEBAR-->
    <?php include 'template/sidebar.php' ?>

    <div class="content-wrapper">
      <div class="page-heading row">
        <h1 class="col page-title">Proveedores</h1>
        <button class="col-sm-2 align-self-end btn btn-secondary mr-3" onclick="tableToExcel('proveedores.xlsx')" id="download">Descargar (Excel)</button>
        <button class="col-sm-2 align-self-end btn btn-primary mr-3" id="AddProveedor">Nuevo Proveedor</button>
      </div>
      <div class="page-content fade-in-up">
        <div class="row">
          <div class="card container">
            <table id="tabla_proveedores" class="dataTables_length display" style="width:100%">
              <thead>
                <tr>
                  <th>Nº de Proveedor</th>
                  <th>Nombre</th>
                  <th>Rubro</th>
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
  <div class="modal fade" id="modal_createProveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Agregar nuevo proveedor</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="col-lg-12">
            <label for="proveedorName">Nombre del Proveedor</label>
            <input type="text" class="form-control" id="proveedorName" placeholder="Agregar nombre del proveedor"></input>
          </div>
          <div class="col-lg-12 mt-4">
            <label for="proveedorRubro">Rubro</label>
            <input type="text" class="form-control" id="proveedorRubro" placeholder="Agregar nombre del rubro"></input>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" id="createOrden">Agregar Proveedor</button>
        </div>
      </div>
    </div>
  </div>
  <!-- End Modal -->
  <!-- Modal Edit -->
  <div class="modal fade" id="modal_editProveedor" tabindex="-1" role="dialog" aria-labelledby="exampleModalLongTitle" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="exampleModalLongTitle">Editar Proveedor</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <div class="col-lg-12">
            <label for="proveedorNameEdit">Nombre del proveedor</label>
            <input type="text" class="form-control" id="proveedorNameEdit" placeholder="Agregar nombre del proveedor"></input>
          </div>
          <div class="col-lg-12 mt-4">
            <label for="proveedorRubroEdit">Rubro</label>
            <input type="text" class="form-control" id="proveedorRubroEdit" placeholder="Agregar nombre del rubro"></input>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
          <button type="button" class="btn btn-primary" id="updateProveedor">Actualizar</button>
        </div>
      </div>
    </div>
  </div>
  <!-- End Modal -->
  <?php include 'template/plugins.php' ?>
  <!-- PAGE LEVEL SCRIPTS-->
  <script src="https://cdn.jsdelivr.net/gh/linways/table-to-excel@v1.0.4/dist/tableToExcel.js"></script>
  <script>
    function tableToExcel(fileName) {
      let table = document.getElementById('tabla_proveedores');
      return TableToExcel.convert(table, {
        name: fileName,
        sheet: {
          name: 'Sheet 1'
        }
      });
    }
  </script>
  <script src="../js/console-proveedores.js" type="text/javascript"></script>
</body>

</html>