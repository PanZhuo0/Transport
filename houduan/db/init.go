// 该文件实现初始化一个db连接对象
package db

import (
	"database/sql"
	"fmt"

	"github.com/go-ini/ini"
	_ "github.com/go-sql-driver/mysql"
)

// mysql 对象
type MysqlConfig struct {
	Address              string `ini:"address"`
	Username             string `ini:"username"`
	Password             string `ini:"password"`
	Dbname               string `ini:"dbname"`
	Max_connections      int    `ini:"max_connections"`
	Max_idel_connections int    `ini:"max_idel_connections"`
}

var Db *sql.DB

func Init() error {
	// 解析ini文件
	var mysql MysqlConfig
	err := ini.MapTo(&mysql, "./config/config.ini")
	if err != nil {
		panic(err)
	}
	fmt.Println("--成功解析mysql-ini配置文件", mysql)
	// 解析DSN
	dsn := mysql.Username + ":" + mysql.Password + "@tcp(" + mysql.Address + ")/" + mysql.Dbname
	Db, err = sql.Open("mysql", dsn)
	if err != nil {
		fmt.Printf("dsn syntax failed,err:%v", err)
		return err
	}
	err = Db.Ping()
	if err != nil {
		fmt.Printf("open %s failed,err:%v", dsn, err)
		return err
	}
	fmt.Println("连接数据库成功!!!")
	return err
}
