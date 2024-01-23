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
            component: () => import('./pages/DataKaryawan.vue')
        },
        {
            path: '/data-kriteria',
            component: () => import('./pages/DataKriteria.vue')
        },
        {
            path: '/data-crips/',
            component: () => import('./pages/DataCrips.vue')
        },
        {
            path: '/data-crips/:kriteria_id',
            component: () => import('./pages/DataCripsKriteria.vue')
        },
        {
            path: '/pengambilan-keputusan',
            component: () => import('./pages/PengambilanKeputusan.vue')
        },
    ],
})
router.beforeEach((to, from, next) => {
    return next()
})

export default router;