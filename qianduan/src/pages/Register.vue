<template>
  <div class="registe-container">
    <h2 style="text-align: center;"> 注册页面</h2>
    <form class="form">
      <div class="username"><span>用户名:</span><el-input v-model="username" style="width: 240px" placeholder="用户名" />
      </div>
      <div class="password"><span style="padding-right:16px ;">密码:</span><el-input v-model="password" show-password
          style="width: 240px" placeholder="密码" @blur="validatePassword"/></div>
      <div class="email"><span style="padding-right:16px ;">邮箱:</span><el-input v-model="email" style="width: 240px"
          placeholder="邮箱" @blur="validateEmail" /></div>
    </form>
    <p style="margin-left: 25px">已经有账户了?<RouterLink to="/login">登录</RouterLink>
    </p>
    <br>
    <div style="text-align: center;">
      <button @click="register">注册</button>
    </div>
  </div>
</template>

<script lang="ts" setup name="">
import api from '@/api';
import router from '@/router';
import { ElMessage } from 'element-plus';
import { ref } from 'vue';

const username = ref('')
const password = ref('')
const email = ref('')
const isValidEmail = ref(true)
const isValidPassword =ref(true)
const validatePassword =()=>{
  const passwordRegex = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/
  if (!passwordRegex.test(password.value)){
    console.log("密码错误!");
    isValidPassword.value=false
  }else{
    isValidPassword.value=true
  }
}
const validateEmail = () => {
  const emailRegex = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/
  if (!emailRegex.test(email.value)) {
    isValidEmail.value = false;
  } else {
    isValidEmail.value = true;
  }
}

const register = () => {
  if (isValidEmail.value &&isValidPassword.value) {
    // 如果邮箱合理
    api.getRegister({ username: username.value, password: password.value, email: email.value }).then(res => {
      if (res.data.result === "succeed") {
        // 提示成功
        ElMessage("注册成功")
        // 跳转到登录页面 
        router.push({ path: "/login" })
      } else {
        // 提示失败,并显示原因
        ElMessage.error({ message: "注册失败," + res.data.reason })
      }
    })
  }else if (isValidEmail.value==false){
    ElMessage.warning("邮箱格式有误!")
  }else if(isValidPassword.value==false){
    ElMessage.warning("密码不符合规范!")
  }
}
</script>

<style scoped>
.registe-container {
  max-width: 400px;
  margin: 100px auto;
  padding: 20px;
  background-color: #fff;
  border-radius: 8px;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.form {
  display: flex;
  flex-direction: column;
}

.form div {
  margin: 5px;
}

.form span {
  /* background-color: #000; */
  margin: 0 20px;
}

button {
  width: 90%;
  padding: 10px;
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}
</style>
