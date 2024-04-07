import axios from 'axios'
import querystring from 'querystring'

const instance=axios.create({
    // Axios对象的公共配置
    timeout:5000
})

// 请求数据前
instance.interceptors.request.use(
    config=>{
        // if(config.method=="post"){
        //     // 请求方式是post，则对发送数据进行封装(Golang不需要)
        //     config.data=querystring.stringify(config.data)
        // }
        return config;
    },
    error=>{
        return Promise.reject(error)
    }
)
// 返回数据前
instance.interceptors.response.use(
    response=>{
        // 如果状态正常就接收，不正常拒收
        return response.status==200?Promise.resolve(response):Promise.reject(response)
    },
    error=>{
        // 解析出错误中的response 对象
        const {response}=error;
        // 错误处理函数
        errorHandler(response.status,response.info)
    },
)

const errorHandler=(status,info)=>{
    switch(status){
        case 400:
            console("语义有误")
            break;
        case 401:
            console("服务器认证失败")
            break;
        case 403:
            console("服务器拒绝访问")
            break;
        case 404:
            console("地址有误")
            break;
        case 500:
            console("服务器报出异常")
            break;
        case 502:
            console("服务器报无响应")
            break;
        default:
            console.log(info)
    }
}

// 暴露instance
export default instance