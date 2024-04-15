package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"
	"time"

	"github.com/gin-gonic/gin"
)

func getViolations(ctx *gin.Context) {
	// 获取所有的罚单信息
	var violations []model.Vio
	sqlstr := `select * from violations`
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("获取罚单SQL"+sqlstr+"执行出错:", err)
	}
	for rows.Next() {
		var v model.Vio
		rows.Scan(&v.Id, &v.Name, &v.License_Plate, &v.Vio_Time, &v.Location, &v.Vio_description, &v.Penalty)
		violations = append(violations, v)
	}

	// fmt.Println("获取到的罚单数据:", violations)
	ctx.JSON(200, gin.H{
		"data": violations,
	})
}

func deleteVio(ctx *gin.Context) {
	var v model.Vio
	ctx.ShouldBind(&v)
	fmt.Println("从前端获取到违章事件id:", v.Id)
	sqlstr := `delete from violations where id = ?`
	result, err := db.Db.Exec(sqlstr, v.Id)
	if err != nil {
		fmt.Println("删除违章事件SQL:", sqlstr, "失败,err:", err)
		return
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}

func addVio(ctx *gin.Context) {
	var v model.Vio
	ctx.ShouldBind(&v)
	fmt.Println("从前端获得对象", v)
	t := time.Now().Format("2006-01-02 15:04:05")
	// fmt.Println(t)
	sqlstr := `insert into violations(name,license_plate,violation_time,location,violation_description,penalty)values(?,?,?,?,?,?)`
	result, err := db.Db.Exec(sqlstr, v.Name, v.License_Plate, t, v.Location, v.Vio_description, v.Penalty)
	if err != nil {
		fmt.Println("执行SQL:", sqlstr, "失败,err:", err)
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}
