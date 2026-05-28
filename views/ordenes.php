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
                    <h1 class="col page-title">Órdenes de Compra</h1>
                    <button class="col-sm-2 align-self-end btn btn-primary mr-3" id="AddOrden">Nueva Orden</button>
                    <button class="col-sm-2 align-self-end btn btn-success mr-3" id="BulkUploadBtn"><i class="fa fa-upload"></i> Carga por Lotes</button>
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
            <label>Sector</label>
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
        <h5 class="modal-title" id="exampleModalLongTitle">Editar Orden</h5>
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
            <label>Sector</label>
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

<!-- Modal Carga por Lotes -->
<div class="modal fade" id="modal_bulkUpload" tabindex="-1" role="dialog" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Carga por Lotes</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <!-- Step indicator -->
        <div class="row mb-4">
          <div class="col text-center">
            <span class="badge badge-primary bulk-step-indicator" id="step1Indicator">1. Seleccionar archivo</span>
            <span class="mx-2 text-muted">→</span>
            <span class="badge badge-secondary bulk-step-indicator" id="step2Indicator">2. Mapear columnas</span>
            <span class="mx-2 text-muted">→</span>
            <span class="badge badge-secondary bulk-step-indicator" id="step3Indicator">3. Vista previa</span>
          </div>
        </div>

        <!-- Step 1: File selection -->
        <div class="bulk-step bulk-step-1">
          <div class="text-center py-4">
            <p class="text-muted">Selecciona un archivo Excel (.xlsx, .xls) o CSV con los datos de las órdenes de compra.</p>
            <p class="text-muted small">También puedes <a href="#" id="downloadTemplateBtn" class="text-primary">descargar un template de ejemplo</a>.</p>
            <div class="custom-file text-left mt-3" style="max-width: 400px; margin: 0 auto;">
              <input type="file" class="custom-file-input" id="bulkFileInput" accept=".xlsx,.xls,.csv">
              <label class="custom-file-label" for="bulkFileInput" id="bulkFileLabel">Seleccionar archivo...</label>
            </div>
            <div id="bulkFileInfo" class="mt-3 text-success" style="display:none;"></div>
          </div>
        </div>

        <!-- Step 2: Column mapping -->
        <div class="bulk-step bulk-step-2" style="display:none;">
          <p class="text-muted">Asigna cada columna del archivo al campo correspondiente del sistema:</p>
          <div class="table-responsive">
            <table class="table table-bordered">
              <thead class="thead-light">
                <tr>
                  <th>Campo del sistema</th>
                  <th>Columna del archivo</th>
                  <th>Requerido</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Nombre del producto</td>
                  <td><select class="form-control form-control-sm bulk-mapping-select" data-field="nombre"></select></td>
                  <td><span class="text-danger">*</span></td>
                </tr>
                <tr>
                  <td>Cantidad</td>
                  <td><select class="form-control form-control-sm bulk-mapping-select" data-field="cantidad"></select></td>
                  <td><span class="text-danger">*</span></td>
                </tr>
                <tr>
                  <td>Sector</td>
                  <td><select class="form-control form-control-sm bulk-mapping-select" data-field="sector"></select></td>
                  <td><span class="text-danger">*</span></td>
                </tr>
                <tr>
                  <td>Autorizada</td>
                  <td><select class="form-control form-control-sm bulk-mapping-select" data-field="autorizada"></select></td>
                  <td><span class="text-muted">Opcional</span></td>
                </tr>
              </tbody>
            </table>
          </div>
          <div id="bulkMappingError" class="text-danger mt-2" style="display:none;"></div>
        </div>

        <!-- Step 3: Preview -->
        <div class="bulk-step bulk-step-3" style="display:none;">
          <p class="text-muted">Previsualización de los datos a importar (<span id="bulkPreviewCount">0</span> filas):</p>
          <div class="table-responsive" style="max-height: 350px; overflow-y: auto;">
            <table class="table table-bordered table-sm" id="bulkPreviewTable">
              <thead class="thead-light">
                <tr>
                  <th>#</th>
                  <th>Nombre</th>
                  <th>Cantidad</th>
                  <th>Sector</th>
                  <th>Autorizada</th>
                  <th>Estado</th>
                </tr>
              </thead>
              <tbody id="bulkPreviewBody"></tbody>
            </table>
          </div>
          <div id="bulkSummary" class="mt-3"></div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cerrar</button>
        <button type="button" class="btn btn-secondary" id="bulkBackBtn" style="display:none;">Atrás</button>
        <button type="button" class="btn btn-primary" id="bulkNextBtn" disabled>Siguiente</button>
        <button type="button" class="btn btn-success" id="bulkImportBtn" style="display:none;">
          <i class="fa fa-upload"></i> Importar
        </button>
        <div class="spinner-border spinner-border-sm text-primary ml-2" id="bulkSpinner" style="display:none;" role="status">
          <span class="sr-only">Procesando...</span>
        </div>
      </div>
    </div>
  </div>
</div>

  <?php include 'template/plugins.php'?>
  <!-- PAGE LEVEL SCRIPTS-->
  <script src="../js/console-ordenes.js" type="text/javascript"></script>
</body>
</html>