<template>
    <el-table :data="filterTraffic" stripe style="width: 100%" height="88vh">
        <!-- <el-table-column prop="id" label="ID" width="180" /> -->
        <el-table-column prop="roadname" label="道路名称" width="180" />
        <el-table-column prop="trafficflow" label="交通流量" />
        <el-table-column prop="averagespeed" label="平均车速" />
        <el-table-column prop="level" label="拥挤程度" />
        <el-table-column prop="timestamp" label="记录时间" />
        <el-table-column align="right">
            <template #header>
                <el-input v-model="search" size="small" placeholder="Type to search 道路名称" />
            </template>
        </el-table-column>
    </el-table>
    <div>
        <el-button @click="getTraffic1h">1h内</el-button>
        <el-button @click="getTraffic30min">30min内</el-button>
        <el-button @click="getTraffic15min">15min内</el-button>
        <el-button @click="resetVal">全部</el-button>
    </div>
</template>

<script lang="ts" setup>
import api from '@/api';
import { ElMessage } from 'element-plus';
import { onMounted, ref, watchEffect } from 'vue';
const  traffics= ref([])
const filterTraffic= ref([])
const originVal = ref([])
onMounted(()=>{
    api.getTraffics().then(res=>{
        traffics.value = res.data.data
        originVal.value=traffics.value
    })
})


const search=ref('')
watchEffect(() => {
    filterTraffic.value = traffics.value.filter(item =>
        item.roadname.toLowerCase().includes(search.value.toLowerCase())
    );
});

const resetVal=()=>{
    traffics.value=originVal.value
}

// 获取近1h、30min、15min的交通数据
const getTraffic1h=()=>{
    // 来个提示框
    api.getTraffic1h().then(res=>{
        if(res.data.data==="没有数据"){
            // 提示没有数据
            traffics.value=[]
            ElMessage.error('Oops, 近1h内没有数据.')
            return
        }
        traffics.value=res.data.data
    })
}
const getTraffic30min=()=>{
    api.getTraffic30min().then(res=>{
        if(res.data.data==="没有数据"){
            // 提示没有数据
            traffics.value=[]
            ElMessage.error('Oops, 近30min内没有数据.')
            return
        }
        traffics.value=res.data.data
    })
}

const getTraffic15min=()=>{
    api.getTraffic15min().then(res=>{
        if(res.data.data==="没有数据"){
            // 提示没有数据
            traffics.value=[]
            ElMessage.error('Oops, 近15min内没有数据.')
            return
        }
        traffics.value=res.data.data
    })
}

</script>
