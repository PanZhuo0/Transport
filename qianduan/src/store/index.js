import { ElMessage } from "element-plus"
import { defineStore } from "pinia"

export const useUser = defineStore('user',{
    state(){
        return{
            // 登录状态
                isLogin:false,
                username:'',
                userType:'',
                realname:'',
                uuid:'',
                createat:'',
                password:'',
                email:'',
        }
    },
    actions:{
        // 退出动作
        exit(){
            ElMessage.warning("已退出")
            this.$reset()
            // 把localstore保存的数据删除
            localStorage.removeItem("auth")
        },
    }
})

