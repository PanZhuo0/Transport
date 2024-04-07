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

	fmt.Println("启动所有handler")
	r.Run()
}
