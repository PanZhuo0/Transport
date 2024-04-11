// 使用到路径
import instance from "@/utils/request";
import base from "./path";
import { useUser } from "@/store";
import router from "@/router/index"

const api = {
    // 就是把所有请求封装到api中,发送任何请求直接api.function 就行
    login(usn, psw, ust) {
        instance({
            method: "post",
            url: base.baseUrl + "/login",
            data: {
                // data中默认发送的就是json数据
                username: usn.value,
                password: psw.value,
                usertype: ust.value,
            }
        }).then(
            // 如果返回的json数据是成功就跳转,否则弹窗账户/密码错误
            res => {
                if (res.data.result === "true") {
                    // 跳转页面到Home,并且记录登录状态
                    // 怎么跳转页面呢?
                    // 记录登录状态
                    const user = useUser()
                    user.isLogin = true
                    user.name = usn.value
                    user.userType = ust.value
                    router.push({ path: "/home" })
                } else {
                    alert("账户/密码/用户类型错误!")
                }
            }
        )
    },

    getRoads(roads) {
        instance({
            method: "get",
            url: base.baseUrl + '/getRoads',
        }).then(function (res) {
            roads.value = res.data.data
        })
    },

    getEvents(e) {
        instance({
            method: "get",
            url: base.baseUrl + '/getEvents',
        }).then(res=> {
            // e是一个ref对象
            e.value = res.data.data
        })
    },

    getEventsData(){
        return instance({
            method:"get",
            url:base.baseUrl+'/getEvents',
        })
    },

    getVehicle(user, info) {
        // 1.判断用户身份
        // 2.获取车辆信息
        if (user.userType === "admin") {
            instance({
                method: "get",
                url: base.baseUrl + '/getVehicles',
            }).then((res) => {
                info.value = res.data.data
            })
        }else{
            // 用户类型是user
            instance({
                method:'post',
                url:base.baseUrl+'/getVehiclesByName',
                // 把用户传递过去
                data:{"username":user.name,"usertype":user.userType},
            }).then((res)=>{
                info.value=res.data.data
            })
        }

    },

    getViolations(){
        return instance({method:"get",url:base.baseUrl+'/getViolations'})
    }
}

// 暴露api
export default api