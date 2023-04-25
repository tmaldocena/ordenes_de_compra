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
            <div class='page-heading row'>
                <h2 class='col page-title'>Bienvenido <?php echo $_SESSION['S_USER'] ?>!</h2>
                <div id="MyClockDisplay" class="col page-title clock text-right" onload="showTime()"></div>

            </div>
            <div class='page-content fade-in-up'>
                <div class='row'>
                    <div class="col-lg-5 col-md-6 mt-5">
                        <div class="ibox bg-success color-white widget-stat">
                            <div class="ibox-body">
                                <h2 class="m-b-5 font-strong">Órdenes Activas</h2>
                                <div class="m-b-5">
                                    <a class="text-white" href="./ordenes.php">Ver Ordenes</a>
                                </div>
                                <i class="ti-check widget-stat-icon"></i>
                                <div><i class="fa fa-user m-r-5"></i><small>Se muestran las ordenes de compra recientes</small></div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-5 col-md-6 mt-5">
                        <div class="ibox bg-info color-white widget-stat">
                            <div class="ibox-body">
                                <h2 class="m-b-5 font-strong">Historial</h2>
                                <div class="m-b-5">
                                    <a class="text-white" href="./ordenesHistorial.php">Ver Historial de Ordenes</a>
                                </div>
                                <i class="ti-reload widget-stat-icon"></i>
                                <div><i class="fa fa-user m-r-5"></i><small>Se muestran todas las ordenes de compra que se han hecho</small></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <footer class="page-footer">
                <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
            </footer>
        </div>
    </div>

    <?php include 'template/plugins.php'?>
      <!-- PAGE LEVEL SCRIPTS-->
    <script src="../js/console-index.js" type="text/javascript"></script>
</body>

</html>