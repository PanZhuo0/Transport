import { createRouter, createWebHistory } from "vue-router";

import Login from "@/pages/Login.vue";
import Home from "@/pages/Home.vue";
import Test from "@/pages/Home_/Test.vue";
import Road from "@/pages/Home_/Road.vue";
import Vehicle from "@/pages/Home_/Vehicle.vue";




import { useUser } from "@/store";
import EventsManager from "@/pages/Home_/EventsManager.vue";
import LightManager from "@/pages/Home_/LightManager.vue";
import Events from "@/pages/Home_/Events.vue";
import Vio from "@/pages/Home_/Vio.vue";
import VioManager from "@/pages/Home_/VioManager.vue";
const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/login',
            name: "login",
            component: Login
        },
        {
            path: '/',
            redirect: '/home',
        },
        {
            path: '/home',
            component: Home,
            children: [
                {
                    path: 'test',
                    component: Test,
                },
                {
                    path: 'road',
                    component: Road,
                },
                {
                    path: 'vehicle',
                    component: Vehicle,
                },
                {
                    path: 'eventManager',
                    component: EventsManager
                },
                {
                    path:'lightManager',
                    component: LightManager
                },
                {
                    path:'event',
                    component:Events
                },
                {
                    path:'vio',
                    component:Vio
                },
                {
                    path:'vioManager',
                    component:VioManager
                }
            ]
        }
    ]
})

// 增加路由守卫
router.beforeEach((to, from, next) => {
    // 每次进入前进行路由检查
    let user = useUser()
    if (to.name !== "login" && !user.isLogin) {
        // 如果没有登录且访问了非登录页面，就跳转到登录页面
        console.log(user.isLogin)
        next({ name: 'login' })
    } else {
        next();
    }
})
export default router