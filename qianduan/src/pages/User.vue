<template>
    <div class="common-layout">
        <el-container class="container">
            <el-header class="header">
                <div class="left">
                    <h3>你好,{{ user.username }}</h3>
                </div>
                <el-dropdown>
                    <el-avatar shape="circle" :src="avatarUrl" class="avatar">
                    </el-avatar>
                    <template #dropdown>
                        <el-dropdown-menu>
                            <el-dropdown-item command="profile" @click="profile">个人信息</el-dropdown-item>
                            <el-dropdown-item command="exit" @click="Exit">退出</el-dropdown-item>
                        </el-dropdown-menu>
                    </template>
                </el-dropdown>
            </el-header>

            <el-container>
                <el-aside width="200px" class="aside">
                    <el-menu :default-active="activeIndex" class="el-menu-demo menu" background-color="#545c64"
                        text-color="#fff" active-text-color="#ffd04b" @select="" router :unique-opened='true'>
                        <el-menu-item index="/user/road">道路信息查询</el-menu-item>
                        <el-menu-item index="/user/event">交通事件查询</el-menu-item>
                        <el-menu-item index="/user/vehicle">车辆信息查询</el-menu-item>
                        <el-menu-item index="/user/vio">违章信息查询</el-menu-item>
                        <el-menu-item index="/user/traffic">实时交通信息查询</el-menu-item>
                    </el-menu>
                </el-aside>
                <el-main>
                    <RouterView></RouterView>
                </el-main>
            </el-container>
        </el-container>
    </div>


    <!-- 修改个人信息框 -->
    <el-dialog v-model="dialogVisible" title="个人信息" width="500px">
        <el-form-item label="用户名:" :label-width="formLabelWidth">
            <el-input v-model="u.username" autocomplete="off" :disabled="flag"/>
        </el-form-item>
        <el-form-item label="密码:" :label-width="formLabelWidth">
            <el-input v-model="u.password" autocomplete="off" :disabled="flag" />
        </el-form-item>
        <el-form-item label="邮箱:" :label-width="formLabelWidth">
            <el-input v-model="u.email" autocomplete="off" :disabled="flag"/>
        </el-form-item>
        <el-form-item label="真实姓名:" :label-width="formLabelWidth">
            <el-input v-model="u.realname" autocomplete="off" :disabled="flag" />
        </el-form-item>

        <template #footer>
            <div class="dialog-footer">
                <el-button type="primary" @click="flag=!flag">
                   开启修改
                </el-button>
                <el-button type="primary" @click="changeInfo">
                   修改个人信息 
                </el-button>
                <el-button @click="dialogVisible = false">取消</el-button>
            </div>
        </template>
    </el-dialog>
</template>

<script lang="ts" setup name="User">
import api from '@/api';
import router from '@/router';
import { useUser } from '@/store';
import { ElMessage, valueEquals } from 'element-plus';
import { onMounted, reactive, ref, watch, } from 'vue';

const avatarUrl = ref('https://th.bing.com/th/id/R.a9b5205e0f590e53e311aee84cb2314e?rik=GzZYnuCPrAtA5Q&riu=http%3a%2f%2fimages.huanqiu.com%2fsarons%2f2013%2f08%2f86b6abfd5388f7a642c22efc8e6c241b.jpg&ehk=GwFXYSDaJ5V5yBMya9aXcpzP0h66nD0p5F1xVB8lbs8%3d&risl=&pid=ImgRaw&r=0')
const formLabelWidth = ref("100px")
const dialogVisible = ref(false)
const user = useUser()
const flag =ref(true)

const u =ref({username:"",password:"",realname:"",email:""})

let activeIndex = ref("1")
const Exit = () => {
    user.exit()
    router.push({ path: "/login" })
}
let manager = ref("")
onMounted(() => {
    if (user.userType === "user") {
        // 禁用管理员权限的操作
        manager.value = "disabled"
    }
    // 赋值(不能赋值对象,piniaUser会同步变化)
    u.value.email=user.email
    u.value.password=user.password
    u.value.realname=user.realname
    u.value.username=user.username
})

const changeInfo=()=>{
    api.updateUser({
        username:u.value.username,
        userid:user.uuid,
        password:u.value.password,
        email:u.value.email,
        realname:u.value.realname
    }).then(res=>{
        if(res.data.result==="succeed"){
            ElMessage.success("更新成功")
            // 更新Pinia中的值
            user.password=u.value.password
            user.email=u.value.email
            user.realname=u.value.realname
            user.username=u.value.username
            // 关闭该对话框
            dialogVisible.value=false
        }else{
            ElMessage.error("数据相同,更新失败")
            dialogVisible.value = false
        }
    })
}


const profile = () => {
    dialogVisible.value = true
}
</script>

<style scoped>
.container {
    height: 100vh;
}

.menu {
    /* 沾满parents的size */
    height: 100%;
}

.header {
    background-color: #bc5f5f;
    padding: 20px 20px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
    text-align: center;
}
</style>
