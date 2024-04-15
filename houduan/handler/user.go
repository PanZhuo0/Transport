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
	sqlstr := `select id,real_name,created_at,email from users where username=? and password=? and user_type=?`
	err := db.Db.QueryRow(sqlstr, user.Username, user.Password, user.UserType).Scan(&user.UserID, &user.RealName, &user.CreateAt, &user.Email)
	if err != nil {
		fmt.Println("查询用户登录出错, err:", err)
	}
	fmt.Println("从数据库获得的数据!")
	fmt.Println(user)
	if user.UserID == "" {
		// 没有对应的用户
		ctx.JSON(200, gin.H{
			"data": user,
		})
	} else {
		ctx.JSON(200, gin.H{
			"data": user,
		})
	}
}

func register(ctx *gin.Context) {
	sqlstr := `insert into users (id,username,password,email,real_name,user_type)values(UUID(),?,?,?,?,"user")`
	var u model.User
	ctx.ShouldBind(&u)
	fmt.Printf("%#v", u)
	_, err := db.Db.Exec(sqlstr, u.Username, u.Password, u.Email, u.RealName)
	if err != nil {
		fmt.Println("新增加用户失败,err:", err)
		ctx.JSON(200, gin.H{
			"result": "failed",
			"reason": err.Error(),
		})
	}
	ctx.JSON(200, gin.H{
		"result": "succeed",
	})

}

func getUsers(ctx *gin.Context) {
	sqlstr := `select * from users`
	rows, err := db.Db.Query(sqlstr)
	if err != nil {
		fmt.Println("获取所有用户SQL:", sqlstr, "失败,err:", err)
		return
	}
	var u model.User
	var users []model.User
	for rows.Next() {
		rows.Scan(&u.UserID, &u.Username, &u.Password, &u.Email, &u.RealName, &u.UserType, &u.CreateAt)
		users = append(users, u)
	}
	ctx.JSON(200, gin.H{
		"data": users,
	})
}

func deleteUser(ctx *gin.Context) {
	sqlstr := `delete from users where id = ?`
	var u model.User
	ctx.ShouldBind(&u)
	fmt.Println("从后端获得ID:", u.UserID)
	result, err := db.Db.Exec(sqlstr, u.UserID)
	if err != nil {
		fmt.Println("删除用户sql:", sqlstr, "失败,err:", err)
		return
	}
	n, _ := result.RowsAffected()
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}

func updateUser(ctx *gin.Context) {
	var u model.User
	ctx.ShouldBind(&u)
	fmt.Println("从前端获取数据:", u)
	sqlstr := `update users set username=?,password=?,email=?,real_name=? where id=?`
	result, err := db.Db.Exec(sqlstr, u.Username, u.Password, u.Email, u.RealName, u.UserID)
	if err != nil {
		fmt.Println("执行SQL语句:", sqlstr, "出错,err:", err)
		return
	}
	n, _ := result.RowsAffected()
	fmt.Println(n,"条数据被影响!")
	if n == 1 {
		ctx.JSON(200, gin.H{
			"result": "succeed",
		})
	}
}
