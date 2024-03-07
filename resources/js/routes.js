import {createRouter, createWebHistory} from 'vue-router';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: () => import('./pages/Home.vue')
        },
        {
            path: '/home',
            component: () => import('./pages/Home.vue')
        },
        {
            path: '/data-karyawan',
            component: () => window.hasRoles(['staff']) ? import('./pages/DataKaryawan.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-kriteria',
            component: () => window.hasRoles(['staff']) ? import('./pages/DataKriteria.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-crips/',
            component: () => window.hasRoles(['staff']) ? import('./pages/DataCrips.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-crips/:kriteria_id',
            component: () => window.hasRoles(['staff']) ? import('./pages/DataCripsKriteria.vue') : import('./pages/Home.vue')
        },
        {
            path: '/pengambilan-keputusan',
            component: () => window.hasRoles(['atasan', 'staff']) ? import('./pages/PengambilanKeputusan.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-user',
            component: () => window.hasRoles(['administrator']) ? import('./pages/DataUser.vue') : import('./pages/Home.vue')
        },
        {
            path: '/persentase-kenaikan',
            component: () => window.hasRoles(['atasan']) ? import('./pages/PersentaseKenaikan.vue') : import('./pages/Home.vue')
        },
    ],
})
router.beforeEach((to, from, next) => {
    return next()
})
// grafik batang per orang per kenaikan gaji 200 - 400 
export default router;