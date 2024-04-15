package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"
	"houduan/util"
	"time"

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
		err := rows.Scan(&event.EventID, &event.EventType, &event.Timestamp, &event.Description, &event.RoadName)
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

func uploadEvent(ctx *gin.Context) {
	var event model.Event
	ctx.ShouldBind(&event)
	fmt.Printf("从前端获取到交通事件对象,%#v", event)
	// 需要把时间给转化一下,插入数据库
	sqlstr := `insert into trafficevents(EventID,EventType,TimeStamp,Description,Roadname)values(UUID(),?,?,?,?)`
	_, err := db.Db.Exec(sqlstr, event.EventType, util.TimeParse(event.Timestamp), event.Description, event.RoadName)
	if err != nil {
		fmt.Println("插入事件数据失败!,err:", err)
		return
	}
	ctx.JSON(200, gin.H{
		"result": "succeed",
	})
}

func deleteEvent(ctx *gin.Context) {
	var e model.Event
	ctx.ShouldBind(&e)
	fmt.Println("获得事件ID:", e.EventID)
	sqlstr := `delete from trafficEvents where EventID=?`
	result, err := db.Db.Exec(sqlstr, e.EventID)
	if err != nil {
		fmt.Println("执行SQL:", sqlstr, "出错,err:", err)
		return
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}

func addEvent(ctx *gin.Context) {
	var e model.Event
	ctx.ShouldBind(&e)
	fmt.Println("从前端获得数据:", e)
	sqlstr := "insert into trafficevents(EventID,EventType,Timestamp,Description,Roadname)values(UUID(),?,?,?,?)"
	t := time.Now().Format("2006-01-02 15:04:05")
	result, err := db.Db.Exec(sqlstr, e.EventType, t, e.Description, e.RoadName)
	if err != nil {
		fmt.Println("执行SQL:"+sqlstr, ",失败,err:", err)
		return
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}
