<template>
    <el-table :data="filterRoads" stripe style="width: 100%" height="88vh">
        <!-- <el-table-column prop="roadid" label="ID" width="180" /> -->
        <el-table-column prop="roadname" label="路名" width="180" />
        <el-table-column prop="length" label="长度" />
        <el-table-column prop="type" label="类型" />
        <el-table-column align="right">
            <template #header>
                <el-input v-model="search" size="small" placeholder="Type to search 道路名称" />
            </template>
        </el-table-column>
    </el-table>
</template>

<script lang="ts" setup>
import api from '@/api';
import { onMounted, ref, watchEffect } from 'vue';
const  roads= ref([])
const filterRoads = ref([])
onMounted(()=>{
    api.getRoads(roads)
})


const search=ref('')
watchEffect(() => {
    filterRoads.value = roads.value.filter(item =>
        item.roadname.toLowerCase().includes(search.value.toLowerCase())
    );
});
</script>
