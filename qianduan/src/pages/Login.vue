<template>
<div class="login-container">
  <h1>登录页面</h1>
    <div class="input-group">
      <label for="username">用户名:</label>
      <input type="text" id="username" v-model="username" required>
    </div>
    <div class="input-group">
      <label for="password">密码:</label>
      <form>
      <el-input v-model="password" show-password id="password" required/>
      </form>
    </div>
    <el-radio-group v-model="usertype">
        <el-radio value="admin" size="large">Admin</el-radio>
        <el-radio value="user" size="large">User</el-radio>
    </el-radio-group>
    <br>
    还没有账户? <RouterLink to="/register">注册</RouterLink>
    <br>
    <button @click="login">Login</button>
</div>
</template>

<script lang="ts" setup name="Login">
import { ref } from 'vue';
import api from '@/api';
import router from '@/router';
import { useUser } from '@/store';
import { ElMessage } from 'element-plus';
// 用户名与密码
let username =ref("")
let password = ref("")
let usertype =ref("user")
// 登录
function login(){
    api.login(username,password,usertype).then(res=>{
      if (res.data.data.userid!==""){
        // 1.记录登录状态(把所有对应的用户信息，保存在pinia中)
        console.log(res.data.email)
        const user=  useUser()
        user.isLogin=true
        user.uuid=res.data.data.userid
        user.username=res.data.data.username
        user.password=res.data.data.password
        user.email=res.data.data.email
        user.userType=res.data.data.usertype
        user.realname=res.data.data.realname
        user.createat=res.data.data.createat
        // 把数据写入到localstore,实现七天免登录
        localStorage.setItem("auth",JSON.stringify({
          user:user,
          expiryTime:new Date().getTime()+7*24*60*60*1000 //七天后过期
        }))
        console.log("已经存储数据到localstorezhong")
        // 2.跳转到对应页面x
        if(usertype.value ==="admin"){
          // 管理员页面
          user.userType='admin'
          router.push({name:'admin'})
        }else{
          router.push({name:'user'})
        }
      }else{
        ElMessage.error("用户名或密码错误")
      }
    })
}
</script>


<style scoped>
    body {
        margin: 0;
        padding: 0;        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
      }
      
      .login-container {
        max-width: 400px;
        margin: 100px auto;
        padding: 20px;
        background-color: #fff;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      }
      
      .login-container h1 {
        text-align: center;
        margin-bottom: 20px;
      }
      
      .input-group {
        margin-bottom: 20px;
      }
      
      .input-group label {
        display: block;
        margin-bottom: 5px;
      }
      
      .input-group input {
        width: 100%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
      }
      
      button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
      }
      
      button:hover {
        background-color: #0056b3;
      }
      
      .error-message {
        color: red;
        text-align: center;
        margin-top: 10px;
        display: none;
      }

</style>

