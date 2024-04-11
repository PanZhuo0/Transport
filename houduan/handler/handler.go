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
	// 获取全部道路信息请求
	r.GET("/getRoads", getRoads)
	// 获取全部交通事件信息请求
	r.GET("/getEvents", getEvent)
	// 获取全部车辆请求
	r.GET("/getVehicles", getVehicles)
	// 获取到用户自己的车辆请求
	r.POST("/getVehiclesByName", getVehiclesByName)
	// 获取所有的罚单信息
	r.GET("/getViolations", getViolations)

	fmt.Println("启动所有handler")
	r.Run()
}
