package handler

import (
	"fmt"

	"github.com/gin-gonic/gin"
)

// 该函数表示启用所有的handler

func Start() {
	// 启动handler
	r := gin.Default()
	// 登录请求
	r.POST("/login", login)
	// 注册请求
	r.POST("/register", register)
	// 获取全部道路信息请求
	r.GET("/getRoads", getRoads)
	// 获取全部交通事件信息请求
	r.GET("/getEvents", getEvent)
	r.POST("/uploadEvent", uploadEvent)
	// 获取全部车辆请求
	r.GET("/getVehicles", getVehicles)
	// 获取到用户自己的车辆请求
	r.POST("/getVehiclesByName", getVehiclesByName)
	// 获取所有的罚单信息
	r.GET("/getViolations", getViolations)
	// 获取所有实时道路交通信息
	r.GET("/getTraffics", getTrafficInfo)
	// 获取近1h/30min/15min内的道路交通信息
	r.GET("/getTraffics15min", getTraffic15min)
	r.GET("/getTraffics30min", getTraffic30min)
	r.GET("/getTraffics1h", getTraffic1h)
	// 获取所有用户信息
	r.GET("/getUsers", getUsers)
	// 删除用户
	r.POST("/deleteUser", deleteUser)
	// 删除违章记录
	r.POST("/deleteVio", deleteVio)
	fmt.Println("启动所有handler")
	// 保留最新的实时交通数据
	r.GET("/cull", cullTraffic)
	// 删除某条实时交通数据
	r.POST("/deleteTraffic", deleteTraffic)
	// 增加一条实时交通数据
	r.POST("/insertTraffic", insertTraffic)
	r.POST("/addVio", addVio)
	r.POST("/deleteEvent", deleteEvent)
	r.POST("/addEvent", addEvent)
	// 修改用户信息
	r.POST("/updateUser", updateUser)
	r.Run()
}
