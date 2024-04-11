package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"

	"github.com/gin-gonic/gin"
)

// 实现登录的后端处理
func login(ctx *gin.Context) {
	// 获取到传入的用户名密码，用户类型
	// Post请求,会传入username,password,usertype
	var user model.User
	ctx.ShouldBind(&user)
	fmt.Println("从前端获取到数据!")
	fmt.Println(user)
	// 检索数据库处理
	ret := db.User_GetOne(user.Username, user.Password, user.UserType)
	fmt.Println("从数据库获得的数据!")
	fmt.Println(ret)
	if ret == nil {
		// 没有对应的用户
		ctx.JSON(200, gin.H{
			"result": "false",
		})
	} else {
		ctx.JSON(200, gin.H{
			"result": "true",
		})
	}
}
