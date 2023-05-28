<?php
    $roleId = $_SESSION['S_ROLE'];
?>

<!-- START SIDEBAR-->
<nav class="page-sidebar" id="sidebar">
    <div id="sidebar-collapse">
        <div class="admin-block d-flex">
            <div>
                <img src="template/assets/img/admin-avatar.png" width="45px" />
            </div>
            <div class="admin-info">
                <div class="font-strong">
                    <?php echo $_SESSION['S_USER']?>
                </div><small id='roleID'><?php echo $_SESSION['S_ROLE'] ?></small></div>
        </div>
        <ul class="side-menu metismenu">
            <li>
                <a class="active" href="../../views/index.php"><i class="sidebar-item-icon fa fa-th-large"></i>
                    <span class="nav-label">Inicio</span>
                </a>
            </li>
            <li class="heading">Caracteristicas</li>
        <?php if($roleId === '1'){
            echo '<li>
                    <a href="../../views/role.php">
                        <i class="sidebar-item-icon fa fa-address-card"></i>
                        <span class="nav-label">Roles</span>
                    </a>
                </li>';
        } ?>
            <li>
                <a href="javascript:;"><i class="sidebar-item-icon fa fa-table"></i>
                    <span class="nav-label">Ordenes de Compra</span><i class="fa fa-angle-left arrow"></i></a>
                <ul class="nav-2-level collapse">
                    <li>
                        <a href="../../views/ordenes.php">Ver Órdenes</a>
                    </li>
                    <li>
                        <a href="../../views/ordenesHistorial.php">Historial de Órdenes</a>
                    </li>
                </ul>
                <li>
                    <a href="../../views/reportes.php">
                    <i class="sidebar-item-icon fa fa-search"></i>
                        <span class="nav-label">Reportes</span>
                    </a>
                </li>
            </li>
        </ul>
    </div>
</nav>
<!-- END SIDEBAR -->