import {createRouter, createWebHistory} from 'vue-router';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: () => import('./pages/Home.vue')
        },
        {
            path: '/data-karyawan',
            component: () => window.hasRoles(['admin', 'staff']) ? import('./pages/DataKaryawan.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-kriteria',
            component: () => window.hasRoles(['admin', 'staff']) ? import('./pages/DataKriteria.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-crips/',
            component: () => window.hasRoles(['admin', 'staff']) ? import('./pages/DataCrips.vue') : import('./pages/Home.vue')
        },
        {
            path: '/data-crips/:kriteria_id',
            component: () => window.hasRoles(['admin', 'staff']) ? import('./pages/DataCripsKriteria.vue') : import('./pages/Home.vue')
        },
        {
            path: '/pengambilan-keputusan',
            component: () => window.hasRoles(['admin', 'staff']) ? import('./pages/PengambilanKeputusan.vue') : import('./pages/Home.vue')
        },
    ],
})
router.beforeEach((to, from, next) => {
    return next()
})

export default router;