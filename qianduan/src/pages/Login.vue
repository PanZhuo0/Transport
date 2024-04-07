<template>
<div class="login-container">
  <h1>Login</h1>
    <div class="input-group">
      <label for="username">Username:</label>
      <input type="text" id="username" v-model="username" required>
    </div>
    <div class="input-group">
      <label for="password">Password:</label>
      <input type="password" v-model="password" id="password" required>
    </div>
    <el-radio-group v-model="usertype">
        <el-radio value="admin" size="large">Admin</el-radio>
        <el-radio value="user" size="large">User</el-radio>
    </el-radio-group>
    <button @click="login">Login</button>
</div>
</template>

<script lang="ts" setup name="Login">
import { ref } from 'vue';
import api from '@/api';
// 用户名与密码
let username =ref("")
let password = ref("")
let usertype =ref("user")
// 登录
function login(){
    api.login(username,password,usertype)
}

</script>




















<style scoped>
    body {
        margin: 0;
        padding: 0;
        font-family: Arial, sans-serif;
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

