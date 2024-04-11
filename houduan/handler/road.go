package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"

	"github.com/gin-gonic/gin"
)

func getRoads(ctx *gin.Context) {
	// 从DB取出所有道路信息并展示(后期可以只取100条，分页展示)
	sqlstr := `select * from roads`
	var roads []model.Road
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("取出所有道路信息时出错,err:", err)
		//记入日志
	}
	for rows.Next() {
		var road model.Road
		err := rows.Scan(&road.RoadID, &road.RoadName, &road.Length, &road.Type)
		if err != nil {
			// 记入日志
			fmt.Println("解析道路信息时出错,err:", err)
		}
		roads = append(roads, road)
	}
	// 展示所有的道路信息
	// fmt.Println("获取到道路信息!")
	// fmt.Println(roads)

	// 把所有道路信息返回前端
	ctx.JSON(200, gin.H{
		"data": roads,
	})
}
