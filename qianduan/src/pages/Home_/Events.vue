<template>
    <el-table :data="filterEvents" style="width: 100%">
        <el-table-column label="事件ID" prop="eventid" width="100px" />
        <el-table-column label="道路ID" prop="roadid" width="100px" />
        <el-table-column label="事件类型" prop="eventtype" />
        <el-table-column label="时间戳" prop="timestamp" />
        <el-table-column label="描述" prop="description" />
        <el-table-column align="right">
            <template #header>
                <el-input v-model="search" size="small" placeholder="Type to search  /时间/类型" />
            </template>
            <template #default="scope">
                <el-button size="small" @click="handleEdit(scope.$index, scope.row)">修改</el-button>
                <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
        </el-table-column>
    </el-table>
</template>

<script lang="ts" setup>
import api from '@/api';
import { ref, watchEffect } from 'vue';

interface Event {
    eventdid: string
    eventtype: string
    timestamp: string
    description: string
    roadid: string
}

const search = ref('')
const filterEvents = ref([])
const events= ref([])
api.getEvents(events)

const handleEdit = (index: number, row: Event) => {
    console.log(index, row)
}
const handleDelete = (index: number, row: Event) => {
    console.log(index, row)
}

watchEffect(() => {
    console.log(events.value)
    filterEvents.value = events.value.filter(item =>
    // 结果包括key
        item.eventtype.toLowerCase().includes(search.value.toLowerCase()) || 
        item.timestamp.toLowerCase().includes(search.value.toLowerCase()) 
    );
});

</script>