<?php
session_start();

if (!isset($_SESSION['S_IDUSER'])) {
    header('Location: login.php');
};
?>
<!DOCTYPE html>
<html lang="es">

<?php include 'template/head.php' ?>
<link href="..\views\template\assets\vendors\bootstrap-datepicker\dist\css\bootstrap-datepicker.min.css" rel="stylesheet">


<body class="fixed-navbar">
    <div class="page-wrapper">
        <!-- HEADER -->
        <?php include 'template/header.php' ?>
        <!-- SIDEBAR-->
        <?php include 'template/sidebar.php' ?>

        <div class="content-wrapper">
            <div class="page-heading row">
                <h1 class="col page-title" id="titulo">Reportes</h1>

            </div>
            <div class="page-content fade-in-up">
                <div class="row">
                    <div class="card container">
                        <div class="col-xl-12">
                            <div class="ibox">
                                <div class="ibox-body" id='bodyP'>
                                    <form class="form-inline" id='formReporte'>
                                        <div class="input-daterange input-group col" id="datepicker">
                                            <span class="input-group-addon p-l-10 p-r-10">Desde</span>
                                            <input class="input-sm form-control" type="text" name="start" value="03/27/2023" id="startDate">
                                            <span class="input-group-addon p-l-10 p-r-10">Hasta</span>
                                            <input class="input-sm form-control" type="text" name="end" value="28-03-2023" id="finalDate">
                                        </div>
                                        <button class="btn btn-success ml-5" type="button" id="showButton">Buscar</button>
                                    </form>
                                </div>
                            </div>
                            <div class="ibox" id="resultTable">
                                <div class="ibox-body">
                                    <div class="row">
                                        <h2 class="col" id='sectorReport'>Reporte de Transportes</h2>
                                        <h4 class="col-offset" id='totalPrice'>Total gastado: $$$</h4>
                                    </div>
                                    <h5 id="dateReport">Reporte desde: "fecha" hasta: "otra fecha"</h5>
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th>N° de Orden</th>
                                                <th>Desde</th>
                                                <th>Destino</th>
                                                <th>Fecha</th>
                                                <th>Transporte</th>
                                                <th>Precio ($)</th>
                                            </tr>
                                        </thead>
                                        <tbody id="tableBody">
                                        </tbody>
                                    </table>
                                    <button class="btn btn-info mt-4" id="printButton" type="button" onclick="printContent('resultTable')"><i class="fa fa-print"></i> Imprimir</button>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    </div>
    <?php include 'template/plugins.php' ?>
    <!-- PAGE LEVEL SCRIPTS-->
    <script src="../views/template/assets/vendors/bootstrap-datepicker/dist/js/bootstrap-datepicker.js"></script>
    <script src="../views/template/assets/vendors/bootstrap-datepicker/js/locales/bootstrap-datepicker.es.js"></script>
    <script src="../js/console-transporte-reporte.js" type="text/javascript"></script>
</body>

</html>