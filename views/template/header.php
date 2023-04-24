<!-- START HEADER-->
<header class="header">
    <div class="page-brand">
        <a class="link" href="../../views/index.php">
            <span class="brand">O.
                <span class="brand-tip">de Compras</span>
            </span>
            <span class="brand-mini">OC</span>
        </a>
    </div>
    <div class="flexbox flex-1">
    <!-- START TOP-LEFT TOOLBAR-->
        <ul class="nav navbar-toolbar">
            <li>
                <a class="nav-link sidebar-toggler js-sidebar-toggler"><i class="ti-menu"></i></a>
            </li>
        </ul>
    <!-- END TOP-LEFT TOOLBAR-->
    <!-- START TOP-RIGHT TOOLBAR-->
    <ul class="nav navbar-toolbar">
        <li class="dropdown dropdown-inbox">
            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media">
                <li class="list-group list-group-divider scroller" data-height="240px" data-color="#71808f">
                </li>
            </ul>
        </li>
        <li class="dropdown dropdown-notification">
            <a class="nav-link dropdown-toggle" data-toggle="dropdown"><i class="fa fa-bell-o rel" id='notificaciones'></i></a>
            <ul class="dropdown-menu dropdown-menu-right dropdown-menu-media">
                <li class="dropdown-menu-header">
                    <div>
                        <span id='NewMsg'>No hay nuevas notificaciones</span>
                    </div>
                </li>
                <li class="list-group list-group-divider scroller" data-height="150px" data-color="#71808f" id='notifList'> 
                </li>
            </ul>
        </li>
        <li class="dropdown dropdown-user">
            <a class="nav-link dropdown-toggle link" data-toggle="dropdown">
            <img src="template/assets/img/admin-avatar.png" />
            <span></span><?php echo $_SESSION['S_USER'] ?><i class="fa fa-angle-down m-l-5"></i></a>
            <ul class="dropdown-menu dropdown-menu-right">
                <a class="dropdown-item"><i class="fa fa-user"></i>Perfil</a>
                <a class="dropdown-item"><i class="fa fa-cog"></i>Configuración</a>
                <a class="dropdown-item"><i class="fa fa-support"></i>Soporte</a>
                <li class="dropdown-divider"></li>
                <a class="dropdown-item" href="../../controllers/user/closeSessionController.php"><i class="fa fa-power-off"></i>Cerrar sesión</a>
            </ul>
        </li>
    </ul>
<!-- END TOP-RIGHT TOOLBAR-->
    </div>
</header>
<!-- END HEADER-->