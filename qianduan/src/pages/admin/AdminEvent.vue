<template>
  <el-table :data="filterEvents" style="width: 100%" height="88vh">
    <el-table-column label="事件ID" prop="eventid" />
    <el-table-column label="道路名称" prop="roadname" />
    <el-table-column label="事件类型" prop="eventtype" />
    <el-table-column label="时间戳" prop="timestamp" />
    <el-table-column label="描述" prop="description" />
    <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="Type to search /路名/事件类型/时间" />
      </template>
      <template #default="scope">
        <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
      </template>
    </el-table-column>
  </el-table>
  <!-- 确认删除对话框 -->
  <el-dialog v-model="dialogVisible" title="提示!" width="500">
    <span>你确定要删除该交通事件记录吗?</span>
    <template #footer>
      <div class="dialog-footer">
        <el-button @click="dialogVisible = false">取消</el-button>
        <el-button type="primary" @click="dialogVisible = false, Del()">
          <!-- 如果确认删除，就执行Del 实现删除该条记录 -->
          确认
        </el-button>
      </div>

    </template>
  </el-dialog>
      <!-- 实时更新抽屉 -->
      <el-drawer ref="drawerRef" v-model="drawerVisible" title="新增交通事件!" direction="ltr" class="demo-drawer">
        <div class="demo-drawer__content">
            <el-form>
                <el-form-item label="道路名称" :label-width="formLabelWidth">
                    <el-input v-model="roadname"/>
                </el-form-item>
                <el-form-item label="事件类型" :label-width="formLabelWidth">
                    <el-select v-model="type" placeholder="请选择事件类型">
                        <el-option label="交通事故" value="Accident" />
                        <el-option label="道路施工" value="Construction" />
                        <el-option label="道路关闭" value="Road Closure" />
                        <el-option label="交通管制" value="Traffic Control" />
                        <el-option label="其他" value="Other" />
                    </el-select>
                </el-form-item>
                <el-form-item label="描述" :label-width="formLabelWidth">
                    <el-input v-model="desc" placeholder="请输入事件的详情" />
                </el-form-item>

            </el-form>
            <div class="demo-drawer__footer">
                <el-button @click="cancel">取消</el-button>
                <el-button type="primary" @click="submit">提交</el-button>
            </div>
        </div>
    </el-drawer>
  <br>
  <!-- <el-button primary @click="">清除1年前的所有记录</el-button> -->

  <el-button type="primary" @click="showDrawer">记录交通事件</el-button>
</template>

<script lang="ts" setup>
import api from '@/api';
import { ElMessage } from 'element-plus';
import { ref, watchEffect } from 'vue';

const formLabelWidth = ref("100px")
const drawerVisible = ref(false)
const search = ref('')
const desc = ref('')
const type= ref('')
const roadname= ref('')
const filterEvents = ref([])
const events = ref([])
const dialogVisible = ref(false)
const id = ref('')
api.getEvents(events)


const cancel =()=>{
  drawerVisible.value=false
}
const handleDelete = (index, row) => {
  // 对话框--确定删除这个记录?
  dialogVisible.value = true //弹出对话框
  id.value = row.eventid//记录违章记录的uuid值
}

const Del = () => {
  // 向后端请求删除某条记录
  api.deleteEvent({ eventid: id.value }).then(res => {
    if (res.data.result === "succeed") {
      ElMessage.success("删除成功!")
      refresh()
    } else {
      ElMessage.error("删除失败!")
    }
  })
}

watchEffect(() => {
  filterEvents.value = events.value.filter(item =>
    // 结果包括key
    item.eventtype.toLowerCase().includes(search.value.toLowerCase()) ||
    item.timestamp.toLowerCase().includes(search.value.toLowerCase()) ||
    item.roadname.toLowerCase().includes(search.value.toLowerCase())
  );
});

const showDrawer =()=>{
  drawerVisible.value=true
}

const submit =()=>{
  // 新增一条数据
  api.addEvent({
    eventtype:type.value,
    description:desc.value,
    roadname:roadname.value
  }).then(res=>{
    if (res.data.result==="succeed"){
      ElMessage.success("增加成功!")
      refresh()
      drawerVisible.value=false
    }else{
      ElMessage.error("增加失败")
    }
  })

}


const refresh=()=>{
  api.getEvents(events)
}
</script>