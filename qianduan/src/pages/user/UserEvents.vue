<template>
    <el-table :data="filterEvents" style="width: 100%" height="88vh">
        <!-- <el-table-column label="事件ID" prop="eventid" width="100px" /> -->
        <el-table-column label="道路名称" prop="roadname"/>
        <el-table-column label="事件类型" prop="eventtype" />
        <el-table-column label="时间戳" prop="timestamp" />
        <el-table-column label="描述" prop="description" />
        <el-table-column align="right">
            <template #header>
                <el-input v-model="search" size="small" placeholder="Type to search /路名/事件类型/时间" />
            </template>
        </el-table-column>
    </el-table>
    <br>
    <el-button primary @click="addEvent">!上报交通事件</el-button>
</template>

<script lang="ts" setup>
import api from '@/api';
import router from '@/router';
import { ref, watchEffect } from 'vue';

const search = ref('')
const filterEvents = ref([])
const events= ref([])
api.getEvents(events)


const addEvent= ()=>{
    router.push({name:'addEvent'})
}


watchEffect(() => {
    filterEvents.value = events.value.filter(item =>
    // 结果包括key
        item.eventtype.toLowerCase().includes(search.value.toLowerCase()) || 
        item.timestamp.toLowerCase().includes(search.value.toLowerCase()) ||
        item.roadname.toLowerCase().includes(search.value.toLowerCase()) 
    );
});

</script>