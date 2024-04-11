<template>
    <div class="common-layout">
        <el-container class="container">
            <el-header>
                <h3>你好,{{ user.name }}</h3>
                <el-button type="danger" @click="Exit">退出</el-button>
            </el-header>
            <el-container>
                <el-aside width="200px" class="aside">
                    <el-menu :default-active="activeIndex" class="el-menu-demo" background-color="#545c64"
                        text-color="#fff" active-text-color="#ffd04b" @select="" router :unique-opened='true'>
                        <el-menu-item index="/home/road">道路信息查询</el-menu-item>
                        <el-menu-item index="/home/event">交通事件查询</el-menu-item>
                        <el-menu-item index="/home/vehicle">车辆信息查询</el-menu-item>
                        <el-menu-item index="/home/vio">交通违章查询</el-menu-item>
                        <el-menu-item v-if="user.userType==='admin'" index="/home/vioManager">交通违章管理</el-menu-item>
                        <el-menu-item v-if="user.userType==='admin'" index="/home/eventManager">交通事件管理</el-menu-item>
                        <el-menu-item v-if="user.userType==='admin'" index="/home/lightManager">交通灯管理</el-menu-item>
                    </el-menu>
                </el-aside>
                <el-main>
                    <RouterView></RouterView>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script lang="ts" setup name="Home">
import router from '@/router';
import { useUser } from '@/store';
import { onMounted, ref, } from 'vue';
let activeIndex = ref("1")
const user = useUser()
const Exit = () => {
    user.exit()
    router.push({ path: "/login" })
}
let manager = ref("")
onMounted(()=>{
    if(user.userType==="user"){
        // 禁用管理员权限的操作
        manager.value="disabled"
    }
})
</script>

<style scoped>
.container {
    height: 100vh;
}

.aside {
    height: fit-content;
}
</style>
