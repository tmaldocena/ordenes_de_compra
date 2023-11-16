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

        </div>
            <footer class="page-footer">
                <div class="to-top"><i class="fa fa-angle-double-up"></i></div>
            </footer>
        </div>
    </div>

    <?php include 'template/plugins.php'?>
    <!-- PAGE LEVEL SCRIPTS-->
</body>

</html>