<template>
    <div class="common-layout">
        <el-container class="container">
            <el-header class="header">
                <h3>你好,管理员:{{ user.username }}</h3>
                <el-button type="danger" @click="Exit">退出</el-button>
            </el-header>
            <el-container>
                <el-aside width="200px" class="aside">
                    <el-menu :default-active="activeIndex" class="el-menu-demo menu" background-color="#545c64"
                        text-color="#fff" active-text-color="#ffd04b" @select="" router :unique-opened='true'>
                        <el-menu-item v-if="user.userType==='admin'" index="/admin/vio">交通违章管理</el-menu-item>
                        <el-menu-item v-if="user.userType==='admin'" index="/admin/event">交通事件管理</el-menu-item>
                        <el-menu-item v-if="user.userType==='admin'" index="/admin/traffic">实时交通管理</el-menu-item>
                        <el-menu-item v-if="user.userType==='admin'" index="/admin/user">用户管理</el-menu-item>
                    </el-menu>
                </el-aside>
                <el-main>
                    <RouterView></RouterView>
                </el-main>
            </el-container>
        </el-container>
    </div>
</template>

<script lang="ts" setup name="Admin">
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
    height: 100%;
}
.header{
    color: #fff;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    padding: 20px 20px;
    background-color: #4b0a0a;
}
.menu{
    height: 100%;
}

el-main{
    height: 100%;
}
</style>
