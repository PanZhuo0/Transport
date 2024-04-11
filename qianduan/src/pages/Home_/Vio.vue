<template>
  <el-table :data="filterViolationData" style="width: 100%" height="1000px">
    <el-table-column label="ID" prop="id" />
    <el-table-column label="姓名" prop="name" />
    <el-table-column label="车牌" prop="licenseplate" />
    <el-table-column label="违法时间(UTC+8)" prop="violation_time" />
    <el-table-column label="地点" prop="location" />
    <el-table-column label="违法描述" prop="violation_description" />
    <el-table-column label="处罚方式" prop="penalty" />
    <el-table-column align="right">
      <template #header>
        <el-input v-model="search" size="small" placeholder="Type to search :名字或车牌" />
      </template>
    </el-table-column>
  </el-table>
</template>

<script lang="ts" setup>
import api from '@/api';
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

const search = ref('')
const violations = ref([])
const filterViolationData = ref([])
api.getViolations().then(res => {
  violations.value = res.data.data
})


// 实现搜索功能,依据--姓名、车牌
watchEffect(() => {
    filterViolationData.value = violations.value.filter(item =>
        item.name.toLowerCase().includes(search.value.toLowerCase())||
        item.licenseplate.toLowerCase().includes(search.value.toLowerCase())
    );
});


console.log()
</script>