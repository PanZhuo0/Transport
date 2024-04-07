package main

import (
	"houduan/db"
	"houduan/handler"
)

func main() {
	// 1.初始化数据库
	db.Init()
	// 2.启动服务
	handler.Start()
}
