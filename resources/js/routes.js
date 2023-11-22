import {createRouter, createWebHistory} from 'vue-router';

const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/',
            component: () => import('./pages/Home.vue')
        },
        {
            path: '/home/:id',
            component: () => import('./pages/Home2.vue')
        }
    ],
})
router.beforeEach((to, from, next) => {
    return next()
})

export default router;