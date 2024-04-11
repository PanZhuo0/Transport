import api from "@/api"
import { defineStore } from "pinia"
import { watch } from "vue"

export const useUser = defineStore('user',{
    state(){
        return{
            // 登录状态
                name:'John Doe',
                isLogin:true,
                userType:'admin',
        }
    },
    actions:{
        // 退出动作
        exit(){
            this.name=''
            this.isLogin=false
            this.userType='user'
        },
    }
})

