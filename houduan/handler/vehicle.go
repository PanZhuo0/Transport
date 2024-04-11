package handler

import (
	"fmt"
	"houduan/db"
	"houduan/model"

	"github.com/gin-gonic/gin"
)

func getVehicles(ctx *gin.Context) {
	sqlstr := `select * from Vehicles`
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("执行SQL:", sqlstr, "失败,err:", err)
	}
	var vehicles []model.Vehicle
	for rows.Next() {
		var v model.Vehicle
		rows.Scan(&v.VehicleID, &v.LicensePlate, &v.VehicleType, &v.OwnerName, &v.ContactNumber)
		vehicles = append(vehicles, v)
	}
	fmt.Println("获取到的所有车辆对象!")
	fmt.Println(vehicles)
	ctx.JSON(200, gin.H{
		"data": vehicles,
	})
}

func getVehiclesByName(ctx *gin.Context) {
	var user model.User
	ctx.ShouldBind(&user)
	fmt.Println("获取到用户对象:", user)
	sqlstr := `select * from vehicles where OwnerName =? `
	rows, err := db.Db.Query(sqlstr, user.Username)
	if err != nil {
		fmt.Println("执行sql语句:", sqlstr, "出错:", err)
	}
	var v model.Vehicle
	var vs []model.Vehicle
	for rows.Next() {
		rows.Scan(&v.VehicleID, &v.LicensePlate, &v.VehicleType, &v.OwnerName, &v.ContactNumber)
		vs = append(vs, v)
	}
	fmt.Println(user.Username, "有", vs)
	ctx.JSON(200,gin.H{
		"data":vs,
	})
}
