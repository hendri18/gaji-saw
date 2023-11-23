<template>
    <div id="wrapper">
        <ul class="navbar-nav bg-orange sidebar sidebar-dark accordion" id="accordionSidebar">
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <router-link to="/" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Karyawan </span><br></router-link>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <router-link to="/home/123" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Kriteria</span></router-link>
            </li>
            <hr class="sidebar-divider my-0">
            <li class="nav-item">
                <router-link to="/home/123" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Attribute</span></router-link>
            </li>
            <hr class="sidebar-divider my-0">
        </ul>
        <div id="content-wrapper" class="d-flex flex-column">
            <div id="content">
                <nav class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
                    <div class="d-none d-md-block">SPK Kenaikan Gaji Karyawan PT. Senja Solusi</div>
                    <button id="sidebarToggleTop" class="btn btn-link d-md-none rounded-circle mr-3">
                        <i class="fa fa-bars"></i>
                    </button>
                    <ul class="navbar-nav ml-auto">
                        <div class="topbar-divider"></div>
                    </ul>
                </nav>
                <div class="container-fluid">
                    <router-view></router-view>
                </div>
            </div>
        </div>
    </div>
</template>