import Login from "@/pages/Login.vue";
import { createRouter, createWebHistory } from "vue-router";

const router = createRouter({
    history:createWebHistory(),
    routes:[
        {
            path:'/login',
            component:Login
        },
        {
            path:'/',
            redirect:'/home',
        },
    ]
})

export default router