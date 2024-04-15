<template>
    <h4 v-if="user.userType === 'admin'">所有车辆的车辆信息:</h4>
    <h4 v-if="user.userType === 'user'">你好,{{ user.username, user.realname }},下表是你名下的车辆:</h4>
    <br>
    <el-table :data="filterInfo" stripe style="width: 100%" height="88vh">
        <!-- <el-table-column prop="vehicleid" label="车辆ID" width="180" /> -->
        <el-table-column prop="licenseplate" label="车牌号" width="180" />
        <el-table-column prop="vehicletype" label="车辆类型" />
        <el-table-column prop="ownername" label="车辆拥有者" />
        <el-table-column prop="contactnumber" label="联系电话" />
        <el-table-column align="right">
            <template #header>
                <el-input v-model="search" size="small" placeholder="Type to search  /拥有者名字/车牌号" />
            </template>
        </el-table-column>
    </el-table>
</template>

<script lang="ts" setup>
import api from '@/api';
import { useUser } from '@/store';
import { ref, watchEffect } from 'vue';
const info = ref([])
const user = useUser()
const search = ref('')
const filterInfo = ref([])
api.getVehicle(user, info)


watchEffect(() => {
    if (info.value !== null){
        filterInfo.value = info.value.filter(item =>
            item.ownername.toLowerCase().includes(search.value.toLowerCase()) ||
            item.licenseplate.toLowerCase().includes(search.value.toLowerCase())
        );

    }
});
</script>