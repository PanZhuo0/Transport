<template>
  <el-table :data="filterViolationData" style="width: 100%" height="88vh">
    <el-table-column label="ID" prop="id" />
    <el-table-column label="姓名" prop="name" />
    <el-table-column label="车牌" prop="licenseplate" />
    <el-table-column label="违法时间(UTC+8)" prop="violation_time" />
    <el-table-column label="地点" prop="location" />
    <el-table-column label="违法描述" prop="violation_description" />
    <el-table-column label="处罚方式" prop="penalty" />
    <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="Type to search" />
      </template>
      <template #default="scope">
        <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  <br>
  <el-button @click="addVio">新增违章</el-button>


  <!-- 确认删除对话框 -->
  <el-dialog v-model="dialogVisible" title="提示!" width="500" :before-close="handleClose">
    <span>你确定要删除该违章记录吗?</span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogVisible = false, Del()">
          确认
        </el-button>
      </div>
    </template>
  </el-dialog>


  <!-- 新增违章抽屉 -->
  <el-drawer ref="drawerRef" v-model="drawerVisible" title="新增违章记录!" direction="ltr" class="demo-drawer">
        <div class="demo-drawer__content">
            <el-form>
                <el-form-item label="违章人员姓名" :label-width="formLabelWidth">
                    <el-input v-model="name" placeholder="输入违章人员姓名"/>
                </el-form-item>
                <el-form-item label="车牌" :label-width="formLabelWidth">
                    <el-input v-model="licenseplate" placeholder="违章车辆车牌" />
                </el-form-item>
                <el-form-item label="违章事发地点" :label-width="formLabelWidth">
                    <el-input v-model="location" placeholder="地点" />
                </el-form-item>
                <el-form-item label="处罚方式" :label-width="formLabelWidth">
                    <el-input v-model="penalty" placeholder="处罚方式" />
                </el-form-item>
                <el-form-item label="详情描述" :label-width="formLabelWidth">
                    <el-input v-model="desc" placeholder="详情描述" />
                </el-form-item>
            </el-form>
            <div class="demo-drawer__footer">
                <el-button @click="cancel">取消</el-button>
                <el-button type="primary" @click="addVioToDB">提交</el-button>
            </div>
        </div>
    </el-drawer>
</template>


<script lang="ts" setup>
import api from '@/api';
import { ElMessage, ElMessageBox } from 'element-plus';
import { computed, ref, watch, watchEffect } from 'vue'

interface Violation {
  id: string
  name: string
  license_plate: string
  violation_time: string
  location: string
  violation_description: string
  penalty: string
}

const cancel = ()=>{
  drawerVisible.value=false  
}


const addVioToDB = ()=>{
  console.log(name.value);
  console.log(licenseplate.value);
  console.log(location.value);
  console.log(penalty.value);
  api.addVioToDB({
    name:name.value,
    location:location.value,
    licenseplate:licenseplate.value,
    penalty:penalty.value,
    violation_description:desc.value,
  }).then(res=>{
    if (res.data.result==="succeed"){
      ElMessage.success("新增违章成功!")
      drawerVisible.value=false
      refresh()
    }
  })
}
const formLabelWidth = ref("120px")
const search = ref('')
const violations = ref([])
const dialogVisible = ref(false)
const filterViolationData = ref([])
const id = ref('')
const name = ref('')
const licenseplate = ref('')
const location = ref('')
const penalty = ref('')
const desc = ref('')



api.getViolations().then(res => {
  violations.value = res.data.data
})


const handleDelete = (index, row) => {
  // 对话框--确定删除用户?
  dialogVisible.value = true //弹出对话框
  id.value = row.id//记录违章记录的uuid值
}


const handleClose = (done: () => void) => {
  ElMessageBox.confirm('你确定要删除该用户?')
    .then(() => {
      done()
    })
    .catch(() => {
      // catch error
    })
}

// 实现搜索功能,依据--姓名、车牌
watchEffect(() => {
  filterViolationData.value = violations.value.filter(item =>
    item.violation_description.toLowerCase().includes(search.value.toLowerCase()) ||
    item.location.toLowerCase().includes(search.value.toLowerCase()) ||
    item.violation_time.toLowerCase().includes(search.value.toLowerCase()) ||
    item.licenseplate.toLowerCase().includes(search.value.toLowerCase()) ||
    item.penalty.toLowerCase().includes(search.value.toLowerCase()) ||
    item.name.toLowerCase().includes(search.value.toLowerCase())
  );
});

// 向后端请求删除用户(依据uuid的值)
const Del = () => {
  api.deleteVio({ id: id.value }).then(res => {
    if (res.data.result === "succeed") {
      console.log(res.data.result)
      // 提示成功
      // alert("删除成功")
      ElMessage.success("删除该违章记录成功")
      // 重新获取数据
      refresh()
    } else {
      ElMessage.error("删除该违章记录失败")
      // alert("failed")
    }
  })
}


const refresh = () => {
  api.getViolations().then(res => {
    violations.value = res.data.data
  })
}

// 新增Vio
const drawerVisible = ref(false)
const addVio=()=>{
  drawerVisible.value=true
}
</script>