<template>
        <h4 v-if="user.userType==='admin'">所有车辆的车辆信息:</h4>
        <h4 v-if="user.userType==='user'">你好,{{ user.name }},下表是你名下的车辆:</h4>
        <br>
    <el-table :data="info" stripe style="width: 100%">
        <el-table-column prop="vehicleid" label="车辆ID" width="180" />
        <el-table-column prop="licenseplate" label="车牌号" width="180" />
        <el-table-column prop="vehicletype" label="车辆类型" />
        <el-table-column prop="ownername" label="车辆拥有者" />
        <el-table-column prop="contactnumber" label="联系电话" />
    </el-table>
</template>

<script lang="ts" setup>
import api from '@/api';
import { useUser } from '@/store';
import { ref } from 'vue';
const info = ref([])
const user = useUser()
api.getVehicle(user,info)
</script>