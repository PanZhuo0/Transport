import { createApp } from 'vue'
import App from './App.vue'
import router from '@/router/index'
import ElementPlus from 'element-plus' //导入ElementPlus 组件库的所有模块和功能
import 'element-plus/dist/index.css' //导入ElementPlus组件库所需的全局CSS样式
const app = createApp(App)
app.use(router)
app.use(ElementPlus)
app.mount('#app')