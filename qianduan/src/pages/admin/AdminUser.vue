<template>
    <el-table :data="filterUsers" stripe style="width: 100%" height="88vh">
        <el-table-column prop="userid" label="用户ID" width="180" />
        <el-table-column prop="username" label="用户名" />
        <el-table-column prop="password" label="用户密码" />
        <el-table-column prop="realname" label="真实姓名" />
        <el-table-column prop="email" label="用户邮箱" />
        <el-table-column prop="usertype" label="用户类型" />
        <el-table-column prop="createat" label="用户创建时间" />
        <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="Type to search" />
      </template>
      <template #default="scope">
        <el-button
          size="small"
          type="danger"
          @click="handleDelete(scope.$index, scope.row)"
          >删除</el-button
        >
      </template>
    </el-table-column>
    </el-table>


    <!-- 确认删除对话框 -->
    <el-dialog
    v-model="dialogVisible"
    title="提示!"
    width="500"
    :before-close="handleClose"
  >
    <span>你确定要删除该用户?</span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogVisible = false,Del()">
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>
</template>

<script lang="ts" setup>
import api from '@/api';
import router from '@/router';
import { ElMessage, ElMessageBox } from 'element-plus';
import { onMounted, ref, watchEffect } from 'vue';
import { routeLocationKey } from 'vue-router';
const  users= ref([])
const filterUsers= ref([])
const search=ref('')
const uuid = ref('')
const dialogVisible = ref(false)
onMounted(()=>{
    api.getUsers().then(res=>{
        users.value = res.data.data
    })
})

watchEffect(() => {
    filterUsers.value = users.value.filter(item =>
        item.username.toLowerCase().includes(search.value.toLowerCase()) ||
        item.realname.toLowerCase().includes(search.value.toLowerCase()) ||
        item.email.toLowerCase().includes(search.value.toLowerCase()) ||
        item.usertype.toLowerCase().includes(search.value.toLowerCase()) ||
        item.userid.toLowerCase().includes(search.value.toLowerCase()) ||
        item.createat.toLowerCase().includes(search.value.toLowerCase()) ||
        item.password.toLowerCase().includes(search.value.toLowerCase()) 
    );
});


const handleClose = (done: () => void) => {
  ElMessageBox.confirm('你确定要删除该用户?')
    .then(() => {
      done()
    })
    .catch(() => {
      // catch error
    })
}

const handleDelete=(index, row)=>{
    // 对话框--确定删除用户?
    dialogVisible.value=true //弹出对话框
    uuid.value=row.userid//记录用户的uuid值
    console.log("uuid:",uuid);
}

const refresh = ()=>{
    api.getUsers().then(res=>{
        users.value = res.data.data
    })
}
// 向后端请求删除用户(依据uuid的值)
const Del=()=>{
    api.deleteUser({userid:uuid.value}).then(res=>{
        if(res.data.result === "succeed"){
            // 提示成功
            // alert("删除成功")
            ElMessage.success("删除成功!")
            // 重新获取数据
            refresh()
        }else{
            // alert("failed")
            ElMessage.error("删除失败!")
        }
    })
}
</script>

