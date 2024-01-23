<template>
    <div id="wrapper">
        <ul class="navbar-nav bg-dark sidebar sidebar-dark accordion" id="accordionSidebar">
            <li class="nav-item">
                <router-link to="/" class="nav-link"><i class="fas fa-fw fa-home"></i> <span>Home</span></router-link>
            </li>
            <!-- <hr class="sidebar-divider my-0"> -->
            <li class="nav-item">
                <router-link to="/data-kriteria" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Kriteria</span></router-link>
            </li>
            <!-- <hr class="sidebar-divider my-0"> -->
            <li class="nav-item">
                <router-link to="/data-crips" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Sub Kriteria (crips)</span></router-link>
            </li>
            <!-- <hr class="sidebar-divider my-0"> -->
            <li class="nav-item">
                <router-link to="/data-karyawan" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Karyawan </span><br></router-link>
            </li>
            <!-- <hr class="sidebar-divider my-0"> -->
            <li class="nav-item">
                <router-link to="/pengambilan-keputusan" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Pengambilan Keputusan</span></router-link>
            </li>
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