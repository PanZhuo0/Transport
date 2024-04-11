<template>
    <el-table :data="roads" stripe style="width: 100%">
        <el-table-column prop="roadid" label="ID" width="180" />
        <el-table-column prop="roadname" label="路名" width="180" />
        <el-table-column prop="length" label="长度" />
        <el-table-column prop="type" label="类型" />
    </el-table>
</template>

<script lang="ts" setup>
import api from '@/api';
import { onMounted, ref } from 'vue';
const  roads= ref([])
onMounted(()=>{
    api.getRoads(roads)
})
</script>
