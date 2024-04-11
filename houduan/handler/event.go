package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"

	"github.com/gin-gonic/gin"
)

// 从DB取出所有道路事件信息并展示(后期可以只取100条，分页展示)
func getEvent(ctx *gin.Context) {
	sqlstr := `select * from trafficevents`
	var events []model.Event
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("取出所有道路事件信息时出错,err:", err)
		//记入日志
	}
	for rows.Next() {
		var event model.Event
		err := rows.Scan(&event.EventID, &event.EventType, &event.Timestamp, &event.Description, &event.RoadID)
		if err != nil {
			// 记入日志
			fmt.Println("解析道路信息时出错,err:", err)
		}
		events = append(events, event)
	}
	// 展示所有的道路事件信息
	// fmt.Println("获取到道路事件信息!")
	// fmt.Println(events)

	// 把所有道路信息返回前端

	ctx.JSON(200, gin.H{
		"data": events,
	})
}
