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
                    <h1 class="col page-title">Historial de Órdenes de Compra</h1>
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
  <?php include 'template/plugins.php'?>
  <!-- PAGE LEVEL SCRIPTS-->
  <script src="../js/console-ordenesHistorial.js" type="text/javascript"></script>
</body>
</html>