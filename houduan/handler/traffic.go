package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"

	"github.com/gin-gonic/gin"
)

func getTrafficInfo(ctx *gin.Context) {
	sqlstr := `select * from traffic_road_info`
	var t model.Traffic
	var traffics []model.Traffic
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("获取所有实时道路交通信息失败!,err:", err)
	}
	for rows.Next() {
		rows.Scan(&t.Id, &t.RoadName, &t.TrafficFlow, &t.AverageSpeed, &t.CongestionLevel, &t.TimeStamp)
		traffics = append(traffics, t)
	}
	ctx.JSON(200, gin.H{
		"data": traffics,
	})
}

func getTraffic1h(ctx *gin.Context) {
	sqlstr := `SELECT * FROM traffic_road_info 
	WHERE timestamp >= NOW() - INTERVAL 1 HOUR;`
	var t model.Traffic
	var traffics []model.Traffic
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("获取1h内实时道路交通信息失败!,err:", err)
	}
	for rows.Next() {
		rows.Scan(&t.Id, &t.RoadName, &t.TrafficFlow, &t.AverageSpeed, &t.CongestionLevel, &t.TimeStamp)
		traffics = append(traffics, t)
	}
	if len(traffics) == 0 {
		ctx.JSON(200, gin.H{
			"data": "没有数据",
		})
		return
	}
	ctx.JSON(200, gin.H{
		"data": traffics,
	})
}
func getTraffic30min(ctx *gin.Context) {

	sqlstr := `SELECT * FROM traffic_road_info 
	WHERE timestamp >= NOW() - INTERVAL 30 MINUTE;`
	var t model.Traffic
	var traffics []model.Traffic
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("获取30min内实时道路交通信息失败!,err:", err)
	}
	for rows.Next() {
		rows.Scan(&t.Id, &t.RoadName, &t.TrafficFlow, &t.AverageSpeed, &t.CongestionLevel, &t.TimeStamp)
		traffics = append(traffics, t)
	}
	if len(traffics) == 0 {
		ctx.JSON(200, gin.H{
			"data": "没有数据",
		})
		return
	}
	ctx.JSON(200, gin.H{
		"data": traffics,
	})
}
func getTraffic15min(ctx *gin.Context) {
	sqlstr := `SELECT * FROM traffic_road_info 
	WHERE timestamp >= NOW() - INTERVAL 15 MINUTE;`
	var t model.Traffic
	var traffics []model.Traffic
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("获取15min内实时道路交通信息失败!,err:", err)
	}
	for rows.Next() {
		rows.Scan(&t.Id, &t.RoadName, &t.TrafficFlow, &t.AverageSpeed, &t.CongestionLevel, &t.TimeStamp)
		traffics = append(traffics, t)
	}
	if len(traffics) == 0 {
		ctx.JSON(200, gin.H{
			"data": "没有数据",
		})
		return
	}
	ctx.JSON(200, gin.H{
		"data": traffics,
	})

}
func deleteTraffic(ctx *gin.Context) {
	sqlstr := `delete from traffic_road_info where id = ?`
	var t model.Traffic
	ctx.ShouldBind(&t)
	fmt.Println("从前端获取到实时交通信息的ID:", t.Id)
	result, err := db.Db.Exec(sqlstr, t.Id)
	if err != nil {
		fmt.Println("删除某条指定实时交通记录失败,err:", err)
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}

func cullTraffic(ctx *gin.Context) {
	sqlstr := `DELETE FROM traffic_road_info
	WHERE id NOT IN (
		SELECT id FROM (
			SELECT id,
				   ROW_NUMBER() OVER (PARTITION BY road_name ORDER BY timestamp DESC) AS rn
			FROM traffic_road_info
		) AS sub
		WHERE rn = 1
	);
	`
	_, err := db.Db.Exec(sqlstr)
	if err != nil {
		fmt.Println("执行sql:", sqlstr, "失败,err:", err)
		return
	}
	ctx.JSON(200, gin.H{
		"result": "succeed",
	})
}

func insertTraffic(ctx *gin.Context) {
	var t model.Traffic
	ctx.ShouldBind(&t)
	fmt.Println("从前端获取数据:", t)
	sqlstr := `insert into traffic_road_info(id,road_name,traffic_flow,average_speed,congestion_level,timestamp)values(UUID(),?,?,?,?,CURRENT_TIMESTAMP)`
	result, err := db.Db.Exec(sqlstr, t.RoadName, t.TrafficFlow, t.AverageSpeed, t.CongestionLevel)
	if err != nil {
		fmt.Println("执行SQL语句:", sqlstr, "出错,err:", err)
		return
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}
