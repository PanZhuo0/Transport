// 使用到路径
import instance from "@/utils/request";
import base from "./path";

const api = {
    updateUser(data){
        return instance({
            method:"post",
            url:base.baseUrl+'/updateUser',
            data:data
        })
    },
    addEvent(data){
        return instance({
            method:'post',
            url:base.baseUrl+'/addEvent',
            data:data
        })
    },
    deleteEvent(data){
        return instance({
            method:'post',
            url:base.baseUrl+'/deleteEvent',
            data:data
        })
    },
    addVioToDB(data){
        return instance({
            method:"post",
            url:base.baseUrl+'/addVio',
            data:data,
        })
    },
    insertTraffic(data){
        return instance({
            method:"post",
            url:base.baseUrl+'/insertTraffic',
            data:data
        })
    },
    cull(){
        return instance({
            method:"get",
            url:base.baseUrl+'/cull',
        })
    },

    deleteTraffic(data){
        return instance({
            method:"post",
            url:base.baseUrl+'/deleteTraffic',
            data:data
        })
    },
    deleteVio(data){
        return instance({
            method:"post",
            url:base.baseUrl+'/deleteVio',
            data:data
        })
    },

    deleteUser(data){
        return instance({
            method:"post",
            url:base.baseUrl+'/deleteUser',
            data:data,
        })
    },
    getUsers(){
        return instance({
            method:'get',
            url:base.baseUrl+'/getUsers',
        })
    },
    uploadEvent(data){
        return instance({
            method:'post',
            url:base.baseUrl+'/uploadEvent',
            data:data,
        })
    },
    // 就是把所有请求封装到api中,发送任何请求直接api.function 就行
    login(usn, psw, ust) {
        return instance({
            method: "post",
            url: base.baseUrl + "/login",
            data: {
                // data中默认发送的就是json数据
                username: usn.value,
                password: psw.value,
                usertype: ust.value,
            }
        })
    },

    getRegister(data) {
        return instance({
            method: "post",
            url: base.baseUrl + '/register',
            data: data,
        })
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
        }).then(res => {
            // e是一个ref对象
            e.value = res.data.data
        })
    },

    getEventsData() {
        return instance({
            method: "get",
            url: base.baseUrl + '/getEvents',
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
        } else {
            // 用户类型是user
            instance({
                method: 'post',
                url: base.baseUrl + '/getVehiclesByName',
                // 把用户传递过去
                data: { "username": user.name, "usertype": user.userType },
            }).then((res) => {
                info.value = res.data.data
            })
        }

    },

    getViolations() {
        return instance({ method: "get", url: base.baseUrl + '/getViolations' })
    },
    
    getTraffics(){
        return instance({
            method:"get",
            url:base.baseUrl+'/getTraffics'
        })
    },
    getTraffic1h(){
        return instance({
            method:'get',
            url:base.baseUrl+'/getTraffics1h'
        })
    },
    getTraffic30min(){
        return instance({
            method:'get',
            url:base.baseUrl+'/getTraffics30min'
        })
    },
    getTraffic15min(){
        return instance({
            method:'get',
            url:base.baseUrl+'/getTraffics15min'
        })
    },
}

// 暴露api
export default api