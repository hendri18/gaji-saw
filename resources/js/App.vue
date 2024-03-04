<template>
    <div id="wrapper">
        <ul class="navbar-nav bg-dark sidebar sidebar-dark accordion" id="accordionSidebar">
            <div class="pt-4 pb-4 text-center text-white"><i class="fa fa-user mr-2"></i> {{ user.name ?? '' }}</div>
            <hr class="sidebar-divider my-0">
            <template v-if="hasRoles(['atasan', 'staff'])">
            <li class="nav-item">
                <router-link to="/" class="nav-link"><i class="fas fa-fw fa-home"></i> <span>Home</span></router-link>
            </li>
            <li class="nav-item">
                <router-link to="/data-kriteria" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Kriteria</span></router-link>
            </li>
            <li class="nav-item">
                <router-link to="/data-crips" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Sub Kriteria (crips)</span></router-link>
            </li>
            <li class="nav-item">
                <router-link to="/data-karyawan" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Data Karyawan </span><br></router-link>
            </li>
            </template>
            <template v-if="hasRoles(['atasan', 'staff'])">
            <li class="nav-item">
                <router-link to="/pengambilan-keputusan" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Pengambilan Keputusan</span></router-link>
            </li>
            </template>
            <template v-if="hasRoles('administrator')">
                <li class="nav-item">
                    <router-link to="/data-user" class="nav-link"><i class="fas fa-fw fa-users"></i> <span>User Dashboard</span></router-link>
                </li>
            </template>
            <template v-if="hasRoles('atasan')">
                <li class="nav-item">
                    <router-link to="/persentase-kenaikan" class="nav-link"><i class="fas fa-fw fa-tachometer-alt"></i> <span>Persentase Kenaikan Gaji</span></router-link>
                </li>
            </template>
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
                    <a href="/logout" class="nav-link">Logout</a>
                    
                </nav>
                <div class="container-fluid">
                    <router-view></router-view>
                </div>
            </div>
        </div>
    </div>
</template>
<script>

import { ref } from 'vue'
export default {
    setup() {
        const hasRoles = (roles) => {
            return window.hasRoles(roles)
        }
        return { user, hasRoles }
    }
}
</script>