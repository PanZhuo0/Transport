import { createRouter, createWebHistory, stringifyQuery } from "vue-router";

import { useUser } from "@/store";
import Login from "@/pages/Login.vue";
import User from "@/pages/User.vue";
import Admin from "@/pages/Admin.vue";
import Register from "@/pages/Register.vue";
import UserEvents from "@/pages/user/UserEvents.vue";
import UserRoad from "@/pages/user/UserRoad.vue";
import UserVehicle from "@/pages/user/UserVehicle.vue";
import UserVio from "@/pages/user/UserVio.vue";
import AddEvent from "@/pages/user/AddEvent.vue";
import Traffic from "@/pages/user/Traffic.vue";
import AdminEvent from "@/pages/admin/AdminEvent.vue";
import AdminTraffic from "@/pages/admin/AdminTraffic.vue";
import AdminVio from "@/pages/admin/AdminVio.vue";
import AdminUser from "@/pages/admin/AdminUser.vue";
import { onMounted } from "vue";
import { ElMessage } from "element-plus";
const router = createRouter({
    history: createWebHistory(),
    routes: [
        {
            path: '/login',
            name: "login",
            component: Login
        },
        {
            path: '/register',
            name: "register",
            component: Register
        },
        {
            path: '/',
            redirect: '/login',
        },
        {
            path: '/user',
            name: 'user',
            component: User,
            children: [
                {
                    path: 'event',
                    name: 'event',
                    component: UserEvents
                }
                , {
                    path: 'road',
                    component: UserRoad
                }
                , {
                    path: 'vehicle',
                    component: UserVehicle
                }
                , {
                    path: 'vio',
                    component: UserVio
                }
                , {
                    path: 'addEvent',
                    name: 'addEvent',
                    component: AddEvent
                }
                , {
                    path: 'traffic',
                    component: Traffic
                }
            ]
        },
        {
            path: '/admin',
            name: 'admin',
            component: Admin,
            // 需要管理员权限
            meta:{requiresAdmin:true},
            children: [
                {
                    path: 'event',
                    component: AdminEvent
                },
                {
                    path: 'traffic',
                    component: AdminTraffic
                },
                {
                    path: 'vio',
                    component: AdminVio
                },
                {
                    path: 'user',
                    component: AdminUser
                }
            ]
        },
        // 等待删除
    ]
})

// 增加路由守卫
router.beforeEach((to, from, next) => {
    // 先看看本地是否有记录,以及是否过期
    let user = useUser()
    console.log("user:",user);
    let data = JSON.parse(localStorage.getItem("auth"))
    if (data===null||new Date().getTime() > data.expiryTime) {
        // 过期,未获取到数据,去除该记录
        localStorage.removeItem("auth")
    } else {
        // 没过期
        user.email = data.user.email
        user.password = data.user.password
        user.realname = data.user.realname
        user.userType = data.user.userType
        user.isLogin = data.user.isLogin
        user.createat = data.user.createat
        user.username = data.user.username
        user.uuid = data.user.uuid
        console.log(user.userType);
    }
    console.log(user.isLogin);
    // 每次进入前进行路由检查
    if (to.name !== "login" && to.name !== "register" && !user.isLogin) {
        // 如果没有登录且访问了非登录页面，就跳转到登录页面
        console.log(user.isLogin)
        next({ name: 'login' })
    } else {
        next();
    }
    if(to.meta.requiresAdmin && user.userType!=="admin"){
        router.push({name:'user'})
        ElMessage.error("权限不够!")
    }
})

export default router