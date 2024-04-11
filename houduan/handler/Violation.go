package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"

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
