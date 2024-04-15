<template>
    <h1>实时交通管理</h1>
    <el-table :data="filterTraffic" stripe style="width: 100%" height="88vh">
        <el-table-column prop="id" label="ID" />
        <el-table-column prop="roadname" label="道路名称" />
        <el-table-column prop="trafficflow" label="交通流量" />
        <el-table-column prop="averagespeed" label="平均车速" />
        <el-table-column prop="level" label="拥挤程度" />
        <el-table-column prop="timestamp" label="记录时间" />
        <el-table-column align="right">
            <template #header>
                <el-input v-model="search" size="small" placeholder="Type to search" />
            </template>
            <template #default="scope">
                <el-button size="small" type="primary" @click="handleUpdate(scope.$index, scope.row)">实时更新</el-button>
                <el-button size="small" type="danger" @click="handleDelete(scope.$index, scope.row)">删除</el-button>
            </template>
        </el-table-column>
    </el-table>
    <div>
        <el-button @click="getTraffic1h">只显示1h内</el-button>
        <el-button @click="getTraffic30min">只显示30min内</el-button>
        <el-button @click="getTraffic15min">只显示15min内</el-button>
        <el-button @click="refresh">显示全部</el-button>
        <el-button @click="cull">仅保留每条道路最新的数据(数据库)</el-button>
    </div>


    <!-- 确认删除对话框 -->
    <el-dialog v-model="dialogVisible" title="提示!" width="500">
        <span>你确定要删除该实时交通信息吗?</span>
        <h1 text-color="red">如果这是该道路唯一一条记录,将不再监视该道路</h1>
        <template #footer>
            <div class="dialog-footer">
                <el-button @click="dialogVisible = false">取消</el-button>
                <el-button type="primary" @click="dialogVisible = false, Del()">
                    确认
                </el-button>
            </div>
        </template>
    </el-dialog>




    <!-- 实时更新抽屉 -->
    <el-drawer ref="drawerRef" v-model="dialog" title="实时道路更新!" direction="ltr" class="demo-drawer">
        <div class="demo-drawer__content">
            <el-form>
                <el-form-item label="道路ID" :label-width="formLabelWidth">
                    <el-input v-model="updateid" autocomplete="off" disabled />
                </el-form-item>
                <el-form-item label="道路名称" :label-width="formLabelWidth">
                    <el-input v-model="updateroadname" disabled />
                </el-form-item>
                <el-form-item label="平均车速" :label-width="formLabelWidth">
                    <el-input v-model="updatespeed" placeholder="输入平均车速" />
                </el-form-item>
                <el-form-item label="交通流量" :label-width="formLabelWidth">
                    <el-input v-model="updateflow" placeholder="输入每小时交通流量" />
                </el-form-item>
                <el-form-item label="拥挤程度" :label-width="formLabelWidth">
                    <el-select v-model="updatelevel" placeholder="选择拥挤程度">
                        <el-option label="低" value="low" />
                        <el-option label="中" value="medium" />
                        <el-option label="高" value="high" />
                    </el-select>
                </el-form-item>
            </el-form>
            <div class="demo-drawer__footer">
                <el-button @click="cancelForm">取消</el-button>
                <el-button type="primary" :loading="loading" @click="update">提交</el-button>
            </div>
        </div>
    </el-drawer>
</template>

<script lang="ts" setup>
import api from '@/api';
import { ElDrawer, ElMessage, ElMessageBox } from 'element-plus';
import { onMounted, reactive, ref, watchEffect } from 'vue';
const traffics = ref([])
const filterTraffic = ref([])
const originVal = ref([])
const dialogVisible = ref(false)
const id = ref('')
const search = ref('')
// 加载数据
onMounted(() => {
    api.getTraffics().then(res => {
        traffics.value = res.data.data
        originVal.value = traffics.value
    })
})
// 搜索更新
watchEffect(() => {
    filterTraffic.value = traffics.value.filter(item =>
        item.roadname.toLowerCase().includes(search.value.toLowerCase())
    );
});

// 获取近1h、30min、15min的交通数据
const getTraffic1h = () => {
    // 来个提示框
    api.getTraffic1h().then(res => {
        if (res.data.data === "没有数据") {
            // 提示没有数据
            traffics.value = []
            ElMessage.error('Oops, 近1h内没有数据.')
            return
        }
        traffics.value = res.data.data
    })
}
const getTraffic30min = () => {
    api.getTraffic30min().then(res => {
        if (res.data.data === "没有数据") {
            // 提示没有数据
            traffics.value = []
            ElMessage.error('Oops, 近30min内没有数据.')
            return
        }
        traffics.value = res.data.data
    })
}
const getTraffic15min = () => {
    api.getTraffic15min().then(res => {
        if (res.data.data === "没有数据") {
            // 提示没有数据
            traffics.value = []
            ElMessage.error('Oops, 近15min内没有数据.')
            return
        }
        traffics.value = res.data.data
    })
}
const handleDelete = (index, row) => {
    // 对话框--确定删除这个记录?
    dialogVisible.value = true //弹出对话框
    id.value = row.id//记录违章记录的uuid值
}
// 向后端请求删除实时交通信息(依据uuid的值)
const Del = () => {
    api.deleteTraffic({ id: id.value }).then(res => {
        if (res.data.result === "succeed") {
            console.log(res.data.result)
            ElMessage.success('删除成功')
            refresh()
        } else {
            ElMessage.error('删除失败')
        }
    })
}
const refresh = () => {
    api.getTraffics().then(res => {
        console.log(res.data)
        traffics.value = res.data.data
    })
}
const cull = () => {
    ElMessageBox.confirm(
        '仅保留每条道路最新的数据(会删除数据库中的记录!!!),继续?',
        'Warning',
        {
            confirmButtonText: 'OK',
            cancelButtonText: 'Cancel',
            type: 'warning',
        }
    )
        .then(() => {
            // 删除每条道路不是最新的数据
            api.cull().then(res => {
                if (res.data.result === "succeed") {
                    refresh()
                    ElMessage({
                        type: 'success',
                        message: 'Delete completed',
                    })
                } else {
                    ElMessage({
                        type: 'error',
                        message: 'Delete failed',
                    })
                }
            })
        })
        .catch(() => {
            ElMessage({
                type: 'info',
                message: 'Delete canceled',
            })
        })
}
const formLabelWidth = '80px'
const dialog = ref(false)
const loading = ref(false)
const updateid = ref("")
const updateroadname = ref("")
const updatespeed = ref('')
const updatelevel = ref('')
const updateflow = ref('')

const drawerRef = ref<InstanceType<typeof ElDrawer>>()

const cancelForm = () => {
    loading.value = false
    dialog.value = false
}

// 处理实时更新(实际是往数据库再插一条时间为Now(),的新数据)
const handleUpdate = (index, row) => {
    // 更新数据
    updateid.value = row.id
    updateroadname.value = row.roadname
    // 打开抽屉
    dialog.value = true
}
const update = () => {
    console.log(updateid.value, updateroadname.value, updateflow.value, updatelevel.value, updatespeed.value)
    api.insertTraffic(
        {
            // id:updateid.value,//id后端自动产生
            roadname: updateroadname.value,
            trafficflow: updateflow.value,
            averagespeed: updatespeed.value,
            level: updatelevel.value
            // 时间戳：后端自动产生
        }
    ).then(
        (res) => {
            if (res.data.result === "succeed") {
                ElMessage.success("实时更新成功!")
                dialog.value = false
            } else {
                ElMessage.error("实时更新失败!")
                dialog.value = false
            }
        }
    )
}
</script>
