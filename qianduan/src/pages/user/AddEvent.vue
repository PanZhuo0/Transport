<template>
    <h1>交通事件上报</h1>
    <el-form :model="form" label-width="auto" style="max-width: 88vh">
        <el-form-item label="事发道路">
            <el-input v-model="form.roadname" placeholder="请输入道路" clearable />
        </el-form-item>
        <el-form-item label="事件发生时间">
            <el-date-picker v-model="form.timestamp" type="datetime" placeholder="Select date and time"
                :shortcuts="shortcuts" />
        </el-form-item>
        <el-form-item label="事件类型">
            <el-radio-group v-model="form.eventtype" class="ml-4">
                <el-radio value="Accident" size="large">交通事故</el-radio>
                <el-radio value="Construction" size="large">道路施工</el-radio>
                <el-radio value="Road Closure" size="large">道路关闭</el-radio>
                <el-radio value="Traffic Contro" size="large">交通管制</el-radio>
                <el-radio value="Other" size="large">其他</el-radio>
            </el-radio-group>
        </el-form-item>
        <el-form-item label="事件描述">
            <el-input v-model="form.description" type="textarea" placeholder="请输入内容" size="large" />
        </el-form-item>
        <el-form-item>
            <el-button type="primary" @click="onSubmit">上报</el-button>
            <el-button type="danger" @click="cancel">取消</el-button>
        </el-form-item>
    </el-form>
</template>

<script lang="ts" setup>
import api from '@/api';
import router from '@/router';
import { ElMessage, autoResizerProps } from 'element-plus';
import { reactive, ref } from 'vue'

// do not use same name with ref
const cancel = () => {
    router.push({ name: "event" })
}




const defaultTime = new Date(2000, 1, 1, 12, 0, 0)
const form = reactive({
    roadname: '',
    timestamp: '',
    eventtype: '',
    description: '',
})

let pass = false
// 检查是否填写
const check = () => {
    // 道路名称
    if (form.roadname === "") {
        ElMessage.error("道路名称不能为空!")
        pass=false
    }
    // 事件类型
    if (form.eventtype === '') {
        ElMessage.error("事件类型不能为空!")
        pass=false
    }
    // 事件发生时间
    if (form.timestamp === "") {
        ElMessage.error("事件发生时间不能为空!")
        pass=false
        return
    }
    // 事件描述//不检查
    pass=true
}
const onSubmit = () => {
    check()
    if(pass){
        api.uploadEvent(form).then(res=>{
            console.log(res.data);
            if(res.data.result==="succeed"){
                ElMessage.success("上传成功!")
                router.go(-1)
            }else{
                ElMessage.error("上传失败!")
            }
        })
    }
}



const shortcuts = [
    {
        text: 'Today',
        value: new Date(),
    },
    {
        text: 'Yesterday',
        value: () => {
            const date = new Date()
            date.setDate(date.getDate() - 1)
            return date
        },
    },
    {
        text: 'A week ago',
        value: () => {
            const date = new Date()
            date.setDate(date.getDate() - 7)
            return date
        },
    },
]
</script>

<style scoped>
.demo-datetime-picker .block {
    padding: 30px 0;
    text-align: center;
    border-right: solid 1px var(--el-border-color);
    flex: 1;
}

.demo-datetime-picker .block:last-child {
    border-right: none;
}

.demo-datetime-picker .demonstration {
    display: block;
    color: var(--el-text-color-secondary);
    font-size: 14px;
    margin-bottom: 20px;
}
</style>
