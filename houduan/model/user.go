package model

// 该文件包含所有数据库需要操作的对象模型

// Users表
type User struct {
	UserID   string `json:"userid"`
	Username string `json:"username"`
	Password string `json:"password"`
	Email    string `json:"email"`
	UserType string `json:"usertype"`
	RealName string `json:"realname"`
	CreateAt string `json:"createat"`
}
