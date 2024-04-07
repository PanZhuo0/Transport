// 使用到路径
import instance from "@/utils/request";
import base from "./path";

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
                console.log("用户名:",usn.value,"密码:",psw.value,"用户类型:",ust.value)
                console.log("用户是否存在?:",res.data.result)
                if (res.data.result === "true"){
                    alert("登录成功！需要实现跳转功能!")
                    // 跳转页面到Home,并且记录登录状态

                }else{
                    alert("账户/密码/用户类型错误!")
                }
            }
        )
    }
}

// 暴露api
export default api