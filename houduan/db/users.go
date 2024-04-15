package db

import (
	"fmt"
	"houduan/model"
)

// 该文件负责CRUD - Users表

// GetOne 参数:username,password,usertype,获得对应的用户对象
func User_GetOne(username, password, usertype string) *model.User {
	var user model.User
	fmt.Println(username,password,usertype)
	sqlstr := `select id from users where username=? and password=? and user_type=?`
	err := Db.QueryRow(sqlstr, username, password, usertype).Scan(&user.UserID)
	if err != nil {
		fmt.Println("查询用户登录出错, err:", err)
		return nil
	}
	return &user
}
